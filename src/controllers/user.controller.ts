import { NextFunction, Request, Response } from "express";
import { User } from "../models/user.model";
import { UserRole } from "../models/user-role.model";
import { HttpStatus } from "../utils/http-status";
import { hashAsync } from "../utils/cryptoHelper";
import { sequelize } from "../config/database";
import { Profile } from "../models/profile.model";
import axios from "axios";
import env from "../utils/validateEnv";
import { sendMailToHiringManager } from "../utils/send-mail";
import { where } from "sequelize";
import { DNS } from "../models/dns.model";
import { QueryTypes } from "sequelize";

export class UserController extends HttpStatus {
  public getAllUsers = async (req: Request, res: Response) => {
    try {
      const users = await User.findAll({});
      if (!users.length)
        return this.sendBadRequestResponse(res, "Users not found.");

      this.sendOkResponse(res, "Users found successfully.", users);
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public signup = async (req: Request, res: Response) => {
    try {
      const { first_name, last_name, username, email_address, password, role } =
        req.body;

      const userExists = await User.findOne({
        where: {
          username,
          email_address,
        },
      });
      if (userExists)
        return this.sendBadRequestResponse(res, "User already exists.");

      const encryptedPassword = await hashAsync(password);

      const user = await User.create({
        username,
        email_address,
        password: `{bcrypt}${encryptedPassword}`,
      });
      if (!user)
        return this.sendBadRequestResponse(res, "Unable to create user.");
    
      if(role) {
        const insertUserRoleQuery = `INSERT INTO "user_role" ("user_id", "role_id") VALUES ($1, $2) RETURNING *;`;
        await sequelize.query(insertUserRoleQuery, {
          bind: [user.id, role],
          type: "insert",
        });
      }

      const profile = await Profile.create({
        user_id: user.id,
      });

      if(profile) {
        // if(role === "48e92031-57d7-4c2a-ae00-7e091d06aa0d") {
          const insertApplicantProfileQuery = `INSERT INTO "applicant_profile" (
            "id", "picture_url", "summary", "hobbies", "headline", "linked_in_id")
            VALUES ('${profile.id}', null, null, null, null, null);`;
          await sequelize.query(insertApplicantProfileQuery, {
            type: "insert",
          });
        // }

        // if(role === "0231de63-1f5f-4073-99d2-3d7b8630fbdd") {}
      }

      this.sendOkResponse(res, "User signup successfully.", user);
    } catch (err) {
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public auth0Signup = async (req: Request, res: Response) => {
    try {
      const { email, assignApplicantRole } = req.body;

      let user: any = await User.findOne({
        where: {
          email_address: email,
        },
      });

      if (!user) {
        // const encryptedPassword = await hashAsync("Test@123");

        const matchDNS = await this.checkDNSAvailability(email);
        if(!matchDNS) return this.sendBadRequestResponse(res, "Invalid email domain, please check the provided email address.");

        const userData = await axios.post(
          "https://stagingnode.returnontalent.io/api/v1/user/signup",
          {
            // first_name: email,
            // last_name: email.split('@')[0],
            username: email,
            email_address: email,
            role: "48e92031-57d7-4c2a-ae00-7e091d06aa0d",
            password: "Test@123",
          }
        );
        // user = await User.create({
        //   username: email,
        //   email_address: email,
        //   password: encryptedPassword,
        // });
        if (!userData)
          return this.sendBadRequestResponse(res, "Unable to create user.");
        if (!userData.data.success)
          return this.sendBadRequestResponse(res, "Unable to create user.");
        console.log("userData: ", userData);
        user = userData.data.data;
      }

      // Login Api
      // const insertUserRoleQuery = `INSERT INTO "user_role" ("user_id", "role_id") VALUES ($1, $2) RETURNING *;`;
      // await sequelize.query(insertUserRoleQuery, {
      //   bind: [user.id, "48e92031-57d7-4c2a-ae00-7e091d06aa0d"],
      //   type: "insert",
      // });

      // const loginData: any = await axios.post(
      //   "https://stagingapi.returntalent.io/api/login",
      //   {
      //     username: user.email_address,
      //     password: "Test@123",
      //   }
      // );
      // if (!loginData)
      //   return this.sendBadRequestResponse(res, "Unable to sign up.");
      // console.log("loginData: ", loginData);
      if (assignApplicantRole) {
        const selectUserRoleQuery = `SELECT * FROM user_role WHERE user_id = '${user.id}' AND role_id = '48e92031-57d7-4c2a-ae00-7e091d06aa0d';`;
        const isExist: any = await sequelize.query(selectUserRoleQuery, {
          type: "select",
        });
        if (isExist.length == 0) {
          const insertUserRoleQuery = `INSERT INTO user_role (user_id, role_id) VALUES ('${user.id}', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');`;
          const assignRole = await sequelize.query(insertUserRoleQuery, {
            type: "insert",
          });
          if (!assignRole) {
            return this.sendErrorResponse(
              res,
              "Unable to assign Applicant role."
            );
          }
        }
      }

      const access_token = "test-token";
      const redirect_url = `${env.REDIRECT_URL}?token=${access_token}&email=${email}`;

      // let redirect_url = `https://stagingapi.returntalent.io?token=${loginData?.access_token}&email=${user.email_address}`;

      const { data } = await axios.post(
        `https://${env.DOMAIN}/passwordless/start`,
        {
          client_id: env.CLIENT_ID,
          client_secret: env.CLIENT_SECRET,
          connection: "email",
          email: email,
          send: "link",
          authParams: {
            role: "admin",
            redirect_uri: redirect_url,
          },
        },
        {
          headers: {
            contentType: "application/json",
          },
        }
      );

      this.sendOkResponse(
        res,
        "A magic link has been sent to your email address."
      );
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public sendMailToHiringManager = async (req: Request, res: Response) => {
    try {
      const objParams = req.body;
      // find user if already exist
      const user: any = await User.findOne({
        where: {
          email_address: objParams.emailAddress,
          enabled: true,
        },
      });
      console.log("user: ", user);
      if (user) {
        const selectUserRoleQuery = `SELECT * FROM user_role WHERE user_id = '${user.id}' AND role_id = 'b9a0f2b8-f4bd-450e-8318-304920f3781e';`;
        const isExist: any = await sequelize.query(selectUserRoleQuery, {
          type: "select",
        });
        // if user already exist then assign role
        if (isExist.length == 0) {
          const insertUserRoleQuery = `INSERT INTO user_role (user_id, role_id) VALUES ('${user.id}', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');`;
          const assignRole = await sequelize.query(insertUserRoleQuery, {
            type: "insert",
          });
          if (!assignRole)
            return this.sendErrorResponse(
              res,
              "Unable to create hiring manager."
            );

          const selectProfile: any = await Profile.findOne({
            where: {
              user_id: user.id,
            },
          });
          if (!selectProfile)
            return this.sendErrorResponse(
              res,
              "Unable to create hiring manager."
            );
          const insertHiringManagerProfile = `INSERT INTO hiring_manager_profile (id,show_complete_applications, show_incomplete_applications, position, brand_name, division_or_department) VALUES ('${selectProfile.id}',${objParams.showCompleteApplications},${objParams.showIncompleteApplications},${objParams.position},'${objParams.brandName}','${objParams.divisionOrDepartment}')`;
          const hiring_manger_profile = await sequelize.query(
            insertHiringManagerProfile,
            {
              type: "insert",
            }
          );
          if (!hiring_manger_profile)
            return this.sendErrorResponse(
              res,
              "Unable to create hiring manager."
            );
          sendMailToHiringManager(objParams.emailAddress).then(() => {
            this.sendOkResponse(
              res,
              "An email has been sent to your email address."
            );
          });
        } else {
          this.sendOkResponse(res, "You are already as hiring manager.");
        }
      } else {
        // if user does not exist;
        console.log(" req.headers: ", req.headers.authorization);

        const matchDNS = await this.checkDNSAvailability(objParams.emailAddress);
        if(!matchDNS) return this.sendBadRequestResponse(res, "Invalid email domain, please check the provided email address.");

        const { data } = await axios.post(
          `${env.HIRING_MANAGER}`,
          {
            birthDate: null,
            brandName: objParams.brandName,
            divisionOrDepartment: objParams.divisionOrDepartment,
            emailAddress: objParams.emailAddress,
            firstName: objParams.firstName,
            gender: objParams.gender,
            lastName: objParams.lastName,
            middleName: objParams.middleName,
            password: "Test@123",
            position: null,
            showCompleteApplications: objParams.showCompleteApplications,
            showIncompleteApplications: objParams.showIncompleteApplications,
            username: objParams.username,
          },
          {
            headers: {
              contentType: "application/json",
              Authorization: req.headers.authorization,
            },
          }
        );
        const access_token = 'test-token';
        const redirect_url = `${env.REDIRECT_URL}?token=${access_token}&email=${objParams.emailAddress}`;
        // send magic link to email
        await axios.post(
          `https://${env.DOMAIN}/passwordless/start`,
          {
            client_id: env.CLIENT_ID,
            client_secret: env.CLIENT_SECRET,
            connection: "email",
            email: objParams.emailAddress,
            send: "link",
            authParams: {
              role: "ROLE_HIRING_MANAGER",
              redirect_uri: redirect_url,
            },
          },
          {
            headers: {
              contentType: "application/json",
            },
          }
        );

        this.sendOkResponse(
          res,
          "A magic link has been sent to your email address."
        );
      }
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendErrorResponse(res, err.message);
      }
    }
  };
  public assignApplicantRole = async (req: Request, res: Response) => {
    try {
      const { email } = req.body;

      let user: any = await User.findOne({
        where: {
          email_address: email,
        },
      });
      if (user) {
        const selectUserRoleQuery = `SELECT * FROM user_role WHERE user_id = '${user.id}' AND role_id = '48e92031-57d7-4c2a-ae00-7e091d06aa0d';`;
        const isExist: any = await sequelize.query(selectUserRoleQuery, {
          type: "select",
        });
        if (isExist.length == 0) {
          const insertUserRoleQuery = `INSERT INTO user_role (user_id, role_id) VALUES ('${user.id}', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');`;
          const assignRole = await sequelize.query(insertUserRoleQuery, {
            type: "insert",
          });
          const insertApplicantProfileQuery = `INSERT INTO "applicant_profile" (
            "id", "picture_url", "summary", "hobbies", "headline", "linked_in_id")
            VALUES ('${user.id}', null, null, null, null, null);`;
          await sequelize.query(insertApplicantProfileQuery, {
            type: "insert",
          });
          if (!assignRole) {
            return this.sendErrorResponse(
              res,
              "Unable to assign Applicant role."
            );
          }
          return this.sendOkResponse(res, "User has assign applicant role");
        }
        return this.sendOkResponse(res, "User has already applicant role");
      } else {
        this.sendOkResponse(res, "User does not found");
      }
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };
  public getUserByEmail = async (req: Request, res: Response) => {
    try {
      const { email_address } = req.query;

      // Get user data
      const user = await User.findOne({
        where: { email_address: email_address },
      });

      if (!user)
        return this.sendBadRequestResponse(
          res,
          "User with this email address does not exists."
        );

      // Get profile data
      const profileQuery = `SELECT * FROM profile WHERE user_id = '${user.id}'`;
      const profileData: any = await sequelize.query(profileQuery);

      // Get user roles
      const getQuery = `Select authority from role where id IN (select role_id from user_role where user_id = '${user.id}');`;
      const roleData = await sequelize.query(getQuery);
      const roles: string[] = [];
      roleData[0].forEach((element: any) => {
        roles.push(element.authority);
      });

      if (roles.includes("ROLE_HIRING_MANAGER")) {
        const isHiringManagerQuery = `SELECT * FROM hiring_manager_profile WHERE id = '${profileData[0][0].id}'`;
        const hiringManagerData: any = await sequelize.query(
          isHiringManagerQuery
        );
        if (hiringManagerData[0][0]) {
          Object.assign(profileData[0][0], hiringManagerData[0][0]);
        }
      }

      // Get tenant data
      const tenantQuery = `SELECT * FROM tenant WHERE id = '${user.tenant_id}'`;
      const tenant: any = await sequelize.query(tenantQuery);

      // Get email template signature data
      const emailTemplateSignatureQuery = `SELECT * FROM email_template_signature WHERE id = '${tenant[0][0].email_template_signature_id}'`;
      const emailTemplateSignature: any = await sequelize.query(
        emailTemplateSignatureQuery
      );

      // Prepare response data
      const responseData = {
        ...this.convertToCamelCase(profileData[0][0]),
        user: {
          ...this.convertToCamelCase(user.dataValues),
          roles: roles,
          tenant: {
            ...this.convertToCamelCase(tenant[0][0]),
            emailTemplateSignature: this.convertToCamelCase(
              emailTemplateSignature[0][0]
            ),
          },
        },
      };

      this.sendOkResponse(res, "User found successfully.", responseData);
    } catch (err) {
      console.log("err: ", err);
    }
  };

  convertToCamelCase(obj: any) {
    const camelCaseObj: any = {};
    for (const key in obj) {
      if (obj.hasOwnProperty(key)) {
        const camelKey = key.replace(/_([a-z])/g, function (match, letter) {
          return letter.toUpperCase();
        });
        camelCaseObj[camelKey] = obj[key];
      }
    }
    return camelCaseObj;
  }

  public changePassword = async (req: Request, res: Response) => {
    try {
      const { email_address } = req.query;

      const findUser = await User.findOne({ where: { email_address } });
      if (!findUser) return this.sendBadRequestResponse(res, "User not found.");
      const encryptedPassword = await hashAsync("Test@123");
      const updatePassword = await User.update(
        { password: `{bcrypt}${encryptedPassword}` },
        {
          where: {
            email_address,
          },
        }
      );
      if (!updatePassword)
        return this.sendBadRequestResponse(res, "Password not updated");
      this.sendOkResponse(res, "Password updated successfully.");
    } catch (err) {
      console.log("err: ", err);
    }
  };
  
  public checkDNSAvailability = async (email: string) => {
    try {
      let matchDns = false;

      const dns = await DNS.findAll();
      if(!dns.length) return true;

      for(const element of dns) {
        if(email.includes(element.dns)) {
          matchDns = true;
          break;
        }
      }

      return matchDns;
    } catch(err) {
      console.log("err: ", err);
      return false;
    }
  };

  public updateProfilePic = async (req: Request, res: Response) => {
    try {
      const { id, pictureUrl }: { id: string; pictureUrl: string } = req.body; // Ensure id is a string

      if (!id || !pictureUrl) {
        return this.sendBadRequestResponse(
          res,
          "ID and pictureUrl are required"
        );
      }

      const [result]: any = await sequelize.query(
        "UPDATE public.applicant_profile SET picture_url = :pictureUrl WHERE id = :id",
        {
          replacements: { id, pictureUrl },
          type: "UPDATE",
        }
      );

      if (result.rowCount === 0) {
        // Fix for checking affected rows
        return res
          .status(404)
          .json({ success: false, message: "Profile not found" });
      }

      return this.sendOkResponse(res, "Profile picture updated successfully");
    } catch (error) {
      console.error("Error updating profile picture:", error);
      return this.sendErrorResponse(
        res,
        "Something went wrong, please try again later."
      );
    }
  };

  public getHobbies = async (req: Request, res: Response) => {
    try {
      const { id } = req.query;
  
      if (!id) {
        return this.sendBadRequestResponse(
          res,
          "ID is required."
        );
      }
  
      const result: any = await sequelize.query(
        "SELECT * FROM public.applicant_profile WHERE id = :id",
        {
          replacements: { id },
          type: QueryTypes.SELECT, // Use proper QueryTypes
        }
      );
  
      if (!result || result.length === 0) {
        return this.sendErrorResponse(
          res,
          "Applicant not found."
        );
      }
  
      return this.sendOkResponse(res, "Hobbies fetched successfully.", result[0] || [],
      );
  
    } catch (error) {
      console.error("Error getting hobbies:", error);
      return this.sendErrorResponse(
        res,
        "Something went wrong, please try again later."
      );
    }
  };
  
  public updateProfileData = async (req: Request, res: Response) => {
    try {
      const { id } = req.params;
      const { headline } = req.body;
  
      if (!headline) {
        res.status(400).json({ message: "Headline is required." });
        return;
      }
  
      const query = `
        UPDATE applicant_profile
        SET headline = :headline
        WHERE id = :id
        RETURNING *;
      `;
  
      const [results] = await sequelize.query(query, {
        replacements: { headline, id },
        type: "update",
      });
  
      if (!results || (Array.isArray(results) && results.length === 0)) {
        res.status(404).json({ message: "Profile not found." });
        return;
      }
  
      res.status(200).json({
        message: "Profile updated successfully.",
        data: results,
      });
    } catch (err) {
      console.error("Error updating profile:", err);
      if (err instanceof Error) {
        res.status(500).json({ message: err.message });
      } else {
        res.status(500).json({ message: "Unknown error occurred." });
      }
    }
  };
}
