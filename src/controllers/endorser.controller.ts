import { NextFunction, Request, Response } from "express";
import { Endorser } from "../models/endorser.model";
import { HttpStatus } from "../utils/http-status";
import axios from "axios";
import { User } from "../models/user.model";
import { UserRole } from "../models/user-role.model";
import { sequelize } from "../config/database";
import env from "../utils/validateEnv";
import { sendEndoresementFeedbackMail, sendEndoresementMail } from "../utils/send-mail";

type Bucket = "STAGING" | "DEVELOP" | "PRODUCTION";

export class EndorserController extends HttpStatus {
  public endorserRole = async (req: Request, res: Response) => {
    try {
      const userInfo = req.body.endorsers;
      let errors: any = [];
      let endorserUser: any = [];
      const forLoop = async (i: number) => {
        if (i < userInfo.length) {
          const { emailAddress } = userInfo[i];
          console.log("emailAddress: ", emailAddress);
          let user: any = await User.findOne({
            where: {
              email_address: emailAddress,
              enabled: true,
            },
          });
          if (!user) {
            user = await axios.post(
              "https://stagingnode.returnontalent.io/api/v1/user/signup",
              {
                first_name: emailAddress,
                last_name: "",
                username: emailAddress,
                email_address: emailAddress,
                // role: "0231de63-1f5f-4073-99d2-3d7b8630fbdd",
                password: "Test@123",
              }
            );

            console.log("user: ", user);
            // user = userData.data.data;

            if (!user) {
              errors.push({
                email: emailAddress,
                error: "Unable to create user.",
              });
            } else {
              const access_token = "test-token";
              const redirect_url = `${env.REDIRECT_URL}?token=${access_token}&email=${emailAddress}`;

              console.log("redirect_url: ", redirect_url);

              const { data } = await axios.post(
                `https://${env.DOMAIN}/passwordless/start`,
                {
                  client_id: env.CLIENT_ID,
                  client_secret: env.CLIENT_SECRET,
                  connection: "email",
                  email: emailAddress,
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
              endorserUser.push(emailAddress);
            }
          } else {
            const selectUserRoleQuery = `SELECT * FROM user_role WHERE user_id = '${user.id}' AND role_id = '0231de63-1f5f-4073-99d2-3d7b8630fbdd';`;
            const isExist: any = await sequelize.query(selectUserRoleQuery, {
              type: "select",
            });

            if (isExist) {
              const access_token = "test-token";
              const redirect_url = `${env.REDIRECT_URL}?token=${access_token}&email=${emailAddress}`;

              const { data } = await axios.post(
                `https://${env.DOMAIN}/passwordless/start`,
                {
                  client_id: env.CLIENT_ID,
                  client_secret: env.CLIENT_SECRET,
                  connection: "email",
                  email: emailAddress,
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
              endorserUser.push(emailAddress);
            } else {
              const insertUserRoleQuery = `INSERT INTO user_role (user_id, role_id) VALUES ('${user.id}', '0231de63-1f5f-4073-99d2-3d7b8630fbdd');`;
              const assignRole = await sequelize.query(insertUserRoleQuery, {
                type: "insert",
              });
              if (!assignRole) {
                errors.push({
                  email: emailAddress,
                  error: "Unable to assign role.",
                });
              } else {
                const access_token = "test-token";
                const redirect_url = `${env.REDIRECT_URL}?token=${access_token}&email=${emailAddress}`;

                const { data } = await axios.post(
                  `https://${env.DOMAIN}/passwordless/start`,
                  {
                    client_id: env.CLIENT_ID,
                    client_secret: env.CLIENT_SECRET,
                    connection: "email",
                    email: emailAddress,
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
                endorserUser.push(emailAddress);
              }
            }
          }
          forLoop(i + 1);
        } else {
          if (errors.length > 0) {
            return this.sendErrorResponse(
              res,
              `The invitation sent to the endorsers excepts ${errors.length} endorsers.`,
              {
                errors,
                endorserUser,
              }
            );
          } else {
            return this.sendOkResponse(
              res,
              "The invitation sent to the endorsers.",
              {
                endorserUser,
              }
            );
          }
        }
      };
      forLoop(0);
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public getEndorsementList = async (req: Request, res: Response) => {
    try {
      const { email } = req.query;

      if (!email)
        return this.sendBadRequestResponse(
          res,
          "Invalid email address to get endorsement list."
        );

      const endorsementQuery = `SELECT endorser.id, endorser.date_created AS endorsedDate, job.title AS jobTitle, profile.first_name AS firstName, profile.last_name AS lastName, application.status AS applicationStatus FROM endorser LEFT OUTER JOIN application ON endorser.application_id = application.id LEFT OUTER JOIN job ON application.job_id = job.id LEFT OUTER JOIN profile ON application.applicant_id = profile.id LEFT OUTER JOIN endorser_feedback ON endorser.id = endorser_feedback.endorser_id WHERE endorser.email_address = '${email}';`;

      const endorsements: any = await sequelize.query(endorsementQuery, {
        type: "select",
      });
      if (!endorsements.length)
        return this.sendOkResponse(
          res,
          "There is no endorsement available for you.",
          endorsements
        );

      this.sendOkResponse(
        res,
        "Endorsement list found successfully.",
        endorsements
      );
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public getEndorsementDetails = async (req: Request, res: Response) => {
    try {
      const { endorserId } = req.params;

      const endorserQuery = `SELECT id, application_id, first_name as firstName, last_name as lastName, email_address as emailAddress, mobile_phone as mobilePhone, relationship, gender, current_company as currentCompany, current_position as currentPosition, department, company_together as companyTogether, start_year_of_working as startYearOfWorking, end_year_of_working as endYearOfWorking, personal_note as personalNote, linked_in_profile as linkedInProfile, is_email_sent as isEmailSent, status, date_created as dateCreated, last_updated as lastUpdated FROM endorser WHERE id = '${endorserId}';`;
      const endorserData: any = await sequelize.query(endorserQuery, {
        type: "select",
      });
      const endorser = endorserData[0];

      if (!endorser)
        return this.sendBadRequestResponse(res, "Endorsement not found.");

      const applicationQuery = `SELECT id, job_id, applicant_id, competencies_id, resume_id, push_factors as pushFactors, pull_factors as pullFactors, achievements, excels, status, is_short_listed as isShortListed, date_applied as dateApplied, date_created as dateCreated, last_updated as lastUpdated FROM application WHERE id = '${endorser.application_id}';`;
      const applicationData: any = await sequelize.query(applicationQuery, {
        type: "select",
      });
      const application = applicationData[0];

      const jobQuery = `SELECT id, address_id, title, description, seniority_level as seniorityLevel, job_type as jobType, status, salary, application_slots as applicationSlots, is_resume_required as isResumeRequired, location, special_note as specialNote, selected_brand as selectedBrand, selected_industry as selectedIndustry, selected_div_or_department as selectedDivOrDepartment, date_created as dateCreated, last_updated as lastUpdated FROM job WHERE id = '${application.job_id}';`;
      const jobData: any = await sequelize.query(jobQuery, {
        type: "select",
      });
      const job = jobData.length > 0 ? jobData[0] : {};

      if (job.address_id) {
        const addressQuery = `SELECT id, bld_or_apartment_no as bldOrApartmentNo, street, province, city, state, zip_code as zipCode, country, date_created as dateCreated, last_updated as lastUpdated FROM address WHERE id = '${job.address_id}';`;
        const addressData: any = await sequelize.query(addressQuery, {
          type: "select",
        });
        const address = addressData.length > 0 ? addressData[0] : {};
        address.fullAddress = this.getFullAddress(address);
        job.address = address;
      }

      if (job.hiring_manager_id) {
        const hiringManagerProfileQuery = `SELECT position, brand_name as brandName, division_or_department as divisionOrDepartment, show_complete_applications as showCompleteApplications, show_incomplete_applications as showIncompleteApplications FROM hiring_manager_profile WHERE id = '${job.hiring_manager_id}';`;
        const hiringManagerProfileData: any = await sequelize.query(
          hiringManagerProfileQuery,
          {
            type: "select",
          }
        );
        const hiringManagerProfile =
          hiringManagerProfileData.length > 0
            ? hiringManagerProfileData[0]
            : {};

        const hrProfileQuery = `SELECT id, user_id, address_id, first_name as firstName, middle_name as middleName, last_name as lastName, gender, nationality, birth_date as birthDate, phone_number as phoneNumber, mobile_number as mobileNumber, linked_in_url as linkedInUrl, status, date_created as dateCreated, last_updated as lastUpdated FROM profile WHERE id = '${job.hiring_manager_id}';`;
        const hrProfileData: any = await sequelize.query(hrProfileQuery, {
          type: "select",
        });
        const hrProfile = hrProfileData.length > 0 ? hrProfileData[0] : {};

        const hrUserQuery = `SELECT id, tenant_id, username, email_address as emailAddress, enabled, date_created as dateCreated, last_updated as lastUpdated FROM users WHERE id = '${hrProfile.user_id}';`;
        const hrUserData: any = await sequelize.query(hrUserQuery, {
          type: "select",
        });
        const hrUser = hrUserData.length > 0 ? hrUserData[0] : {};

        const getHrRolesQuery = `Select authority from role where id IN (select role_id from user_role where user_id = '${hrUser.id}');`;
        const hrRoleData = await sequelize.query(getHrRolesQuery);

        const hrRoles: string[] = [];
        if (hrRoleData.length > 0) {
          hrRoleData[0].forEach((role: any) => {
            hrRoles.push(role.authority);
          });
        }
        hrUser.roles = hrRoles;

        const hrTenantQuery = `SELECT id, email_template_signature_id, subdomain, company_id as company, date_created as dateCreated, last_updated as lastUpdated FROM tenant WHERE id = '${hrUser.tenant_id}';`;
        const hrTenantData: any = await sequelize.query(hrTenantQuery, {
          type: "select",
        });
        const hrTenant = hrTenantData.length > 0 ? hrTenantData[0] : {};
        hrUser.tenant = hrTenant;

        job.hiringManager = {
          ...hiringManagerProfile,
          ...hrProfile,
          user: hrUser,
        };
      }

      const jobTagsQuery = `SELECT * FROM job_tags WHERE job_id = '${job.id}';`;
      const jobTagsData: any = await sequelize.query(jobTagsQuery, {
        type: "select",
      });

      const jobTags: string[] = [];
      if (jobTagsData.length > 0) {
        jobTagsData.forEach((jobTag: any) => {
          jobTags.push(jobTag.tags_string);
        });
      }

      job.tags = jobTags;

      const jobApplicationsQuery = `SELECT id, status FROM application WHERE job_id = '${job.id}';`;
      const jobApplicationsData = await sequelize.query(jobApplicationsQuery);
      const jobApplications = jobApplicationsData[0];
      console.log("jobApplicationsData: ", jobApplicationsData);

      const applicationIds: string[] = [];
      const completeApplications: string[] = [];
      const incompleteApplications: string[] = [];
      jobApplications.forEach((application: any) => {
        applicationIds.push(application.id);
        if (application.status === "INCOMPLETE") {
          incompleteApplications.push(application.id);
        } else {
          completeApplications.push(application.id);
        }
      });

      job.applicationIds = applicationIds;
      job.completeApplications = completeApplications;
      job.incompleteApplications = incompleteApplications;

      const getQualificationQuestionsQuery = `Select * from qualification_question where id IN (select qualification_question_id from job_qualification_question where job_qualification_questions_id = '${job.id}');`;
      const qualificationQuestionsData = await sequelize.query(
        getQualificationQuestionsQuery
      );
      const qualificationQuestions =
        qualificationQuestionsData.length > 0
          ? qualificationQuestionsData[0]
          : [];
      job.qualificationQuestions = qualificationQuestions;

      const getRequiredLanguageQuery = `Select * from required_language where id IN (select required_language_id from job_required_language where job_required_languages_id = '${job.id}');`;
      const requiredLanguagesData = await sequelize.query(
        getRequiredLanguageQuery
      );
      const requiredLanguages =
        requiredLanguagesData.length > 0 ? requiredLanguagesData[0] : [];
      job.requiredLanguages = requiredLanguages;

      application.job = job;

      const applicantQuery = `SELECT picture_url as pictureUrl, summary, headline, linked_in_id as linkedInId FROM applicant_profile WHERE id = '${application.applicant_id}';`;
      const applicantData: any = await sequelize.query(applicantQuery, {
        type: "select",
      });
      const applicant_profile =
        applicantData.length > 0 ? applicantData[0] : {};

      const profileQuery = `SELECT id, user_id, first_name as firstName, middle_name as middleName, last_name as lastName, address_id, nationality, gender, birth_date as birthDate, phone_number as phoneNumber, mobile_number as mobileNumber, linked_in_url as linkedInUrl, status, date_created as dateCreated, last_updated as lastUpdated FROM profile WHERE id = '${application.applicant_id}';`;
      const profileData: any = await sequelize.query(profileQuery, {
        type: "select",
      });
      const profile = profileData.length > 0 ? profileData[0] : {};

      const userQuery = `SELECT id, tenant_id, username, email_address as emailAddress, enabled, date_created as dateCreated, last_updated as lastUpdated FROM users WHERE id = '${profile.user_id}';`;
      const userData: any = await sequelize.query(userQuery, {
        type: "select",
      });
      const user = userData.length > 0 ? userData[0] : {};

      const getRolesQuery = `Select authority from role where id IN (select role_id from user_role where user_id = '${user.id}');`;
      const roleData = await sequelize.query(getRolesQuery);

      const roles: string[] = [];
      if (roleData.length > 0) {
        roleData[0].forEach((role: any) => {
          roles.push(role.authority);
        });
      }
      user.roles = roles;

      const tenantQuery = `SELECT id, subdomain, email_template_signature_id, company_id as company, date_created as dateCreated, last_updated as lastUpdated FROM tenant WHERE id = '${user.tenant_id}';`;
      const tenantData: any = await sequelize.query(tenantQuery, {
        type: "select",
      });
      const tenant = tenantData.length > 0 ? tenantData[0] : {};
      user.tenant = tenant;

      const getExperiencesQuery = `Select * from experience where id IN (select experience_id from applicant_profile_experience where applicant_profile_experiences_id = '${applicant_profile.id}');`;
      const experiencesData = await sequelize.query(getExperiencesQuery);
      const experiences = experiencesData.length > 0 ? experiencesData[0] : [];

      const getEducationsQuery = `Select * from education where id IN (select education_id from applicant_profile_education where applicant_profile_educations_id = '${applicant_profile.id}');`;
      const educationsData = await sequelize.query(getEducationsQuery);
      const educations = educationsData.length > 0 ? educationsData[0] : {};

      const skillsQuery = `SELECT * FROM applicant_profile_skills WHERE applicant_profile_id = '${applicant_profile.id}';`;
      const skillsData: any = await sequelize.query(skillsQuery, {
        type: "select",
      });

      const skills: string[] = [];
      if (skillsData.length > 0) {
        skillsData[0].forEach((skill: any) => {
          skills.push(skill.skills_string);
        });
      }

      application.applicant = {
        ...applicant_profile,
        ...profile,
        user,
        experiences,
        educations,
        skills,
      };

      const competenciesQuery = `SELECT id, management, leadership, self_management as selfManagement, relationship, analytical FROM competencies WHERE id = '${application.competencies_id}';`;
      const competenciesData: any = await sequelize.query(competenciesQuery, {
        type: "select",
      });
      const competencies =
        competenciesData.length > 0 ? competenciesData[0] : {};
      application.competencies = competencies;

      const resumeQuery = `SELECT id, key, content_type as contentType, size, type, status, date_created as dateCreated, last_updated as lastUpdated FROM s3resource WHERE id = '${application.resume_id}';`;
      const resumeData: any = await sequelize.query(resumeQuery, {
        type: "select",
      });
      const resume: any = resumeData.length > 0 ? resumeData[0] : {};

      const bucket: Bucket = resume.bucket;
      resume.location = `https://${env[bucket]}.s3-ap-southeast-1.amazonaws.com/${resume.key}`;
      application.resume = resume;

      const coreQualitiesQuery = `SELECT * FROM application_core_qualities WHERE application_id = '${application.id}';`;
      const coreQualitiesData: any = await sequelize.query(coreQualitiesQuery, {
        type: "select",
      });

      const coreQualities: string[] = [];
      if (coreQualitiesData.length > 0) {
        coreQualitiesData.forEach((quality: any) => {
          coreQualities.push(quality.core_qualities_string);
        });
      }

      const importantNextRoleQuery = `SELECT * FROM application_important_next_role WHERE application_id = '${application.id}';`;
      const importantNextRoleData: any = await sequelize.query(
        importantNextRoleQuery,
        {
          type: "select",
        }
      );

      const importantNextRoles: string[] = [];
      if (importantNextRoleData.length > 0) {
        importantNextRoleData.forEach((role: any) => {
          importantNextRoles.push(role.important_next_role_string);
        });
      }

      const getApplicationQualificationQuestionQuery = `Select * from qualification_question where id IN (select qualification_question_id from application_qualification_question where application_qualification_answers_id = '${application.id}');`;
      const applicationQualificationQuestionsData = await sequelize.query(
        getApplicationQualificationQuestionQuery
      );
      const applicationQualificationQuestions =
        applicationQualificationQuestionsData.length > 0
          ? applicationQualificationQuestionsData[0]
          : [];

      const getApplicationRequiredLanguageQuery = `Select * from required_language where id IN (select required_language_id from application_required_language where application_language_answers_id = '${application.id}');`;
      const applicationRequiredLanguageData = await sequelize.query(
        getApplicationRequiredLanguageQuery
      );
      const applicationRequiredLanguage =
        applicationRequiredLanguageData.length > 0
          ? applicationRequiredLanguageData[0]
          : [];

      application.coreQualities = coreQualities;
      application.importantNextRole = importantNextRoles;
      application.languageAnswers = applicationRequiredLanguage;
      application.qualificationAnswers = applicationQualificationQuestions;

      const applicationEndorsersQuery = `SELECT id, first_name as firstName, last_name as lastName, email_address as emailAddress, mobile_phone as mobilePhone, relationship, gender, current_company as currentCompany, current_position as currentPosition, department, company_together as companyTogether, start_year_of_working as startYearOfWorking, end_year_of_working as endYearOfWorking, personal_note as personalNote, linked_in_profile as linkedInProfile, is_email_sent as isEmailSent, status, date_created as dateCreated, last_updated as lastUpdated FROM endorser WHERE application_id = '${application.id}';`;
      const applicationEndorsers: any = await sequelize.query(
        applicationEndorsersQuery,
        {
          type: "select",
        }
      );
      application.endorsers = applicationEndorsers;

      const endorserFeedbackQuery = `SELECT * FROM endorser_feedback WHERE endorser_id = '${endorser.id}';`;
      const endorserFeedbacksData: any = await sequelize.query(
        endorserFeedbackQuery,
        {
          type: "select",
        }
      );
      const endorserFeedback =
        endorserFeedbacksData.length > 0 ? endorserFeedbacksData[0] : null;
      if (endorserFeedback) {
        const getFeedbackCoreQualityQuery = `Select * from core_quality where id IN (select core_quality_id from endorser_feedback_core_quality where endorser_feedback_core_quality_answers_id = '${endorserFeedback.id}');`;
        const feedbackCoreQualityData = await sequelize.query(
          getFeedbackCoreQualityQuery
        );
        const feedbackCoreQuality =
          feedbackCoreQualityData.length > 0 ? feedbackCoreQualityData[0] : [];

        const getFeedbackQualificationQuestionQuery = `Select * from qualification_question where id IN (select qualification_question_id from endorser_feedback_qualification_question where endorser_feedback_qualification_answers_id = '${endorserFeedback.id}');`;
        const feedbackQualificationQuestionData = await sequelize.query(
          getFeedbackQualificationQuestionQuery
        );
        const feedbackQualificationQuestion =
          feedbackQualificationQuestionData.length > 0
            ? feedbackQualificationQuestionData[0]
            : [];

        const getFeedbackRequiredLanguageQuery = `Select * from required_language where id IN (select required_language_id from endorser_feedback_required_language where endorser_feedback_language_answers_id = '${endorserFeedback.id}');`;
        const feedbackRequiredLanguageData = await sequelize.query(
          getFeedbackRequiredLanguageQuery
        );
        const feedbackRequiredLanguage =
          feedbackRequiredLanguageData.length > 0
            ? feedbackRequiredLanguageData[0]
            : [];

        endorserFeedback.coreQualities = feedbackCoreQuality;
        endorserFeedback.languageAnswers = feedbackRequiredLanguage;
        endorserFeedback.qualificationAnswers = feedbackQualificationQuestion;
      }

      const endorsermentEmailTokenQuery = `SELECT id, token, expiration_date as expirationDate, status, date_created as dateCreated, last_updated as lastUpdated FROM endorsement_email_token WHERE endorser_id = '${endorser.id}';`;
      const endorsermentEmailTokenData: any = await sequelize.query(
        endorsermentEmailTokenQuery,
        {
          type: "select",
        }
      );
      const endorsermentEmailToken =
        endorsermentEmailTokenData.length > 0
          ? endorsermentEmailTokenData[0]
          : null;
      endorsermentEmailToken.endorser = {
        ...endorser,
        application,
        feedback: endorserFeedback,
      };

      const allFeedbacksQuery = `SELECT * FROM endorser_feedback where endorser_id IN (SELECT id FROM endorser WHERE application_id = '${application.id}');`;
      const allFeedbacks: any = await sequelize.query(allFeedbacksQuery, {
        type: "select",
      });

      const resData = {
        endorser: {
          ...endorser,
          application,
          feedback: endorserFeedback,
        },
        application,
        job,
        feedbackResponse: endorserFeedback,
        encryptedToken: endorsermentEmailToken.token,
        feedbacks: allFeedbacks,
        endorsermentEmailToken,
      };

      this.sendOkResponse(res, "Endorsement data found successfully.", resData);
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public getFullAddress = (address: any) => {
    let fullAddress = address.bld_or_apartment_no
      ? address.bld_or_apartment_no
      : "";

    if (address.street) {
      fullAddress = fullAddress.length
        ? `${fullAddress} ${address.street}`
        : address.street;
    }
    if (address.city) {
      fullAddress = fullAddress.length
        ? `${fullAddress} ${address.city}`
        : address.city;
    }
    if (address.province) {
      fullAddress = fullAddress.length
        ? `${fullAddress} ${address.province}`
        : address.province;
    }
    if (address.state) {
      fullAddress = fullAddress.length
        ? `${fullAddress} ${address.state}`
        : address.state;
    }
    if (address.zip_code) {
      fullAddress = fullAddress.length
        ? `${fullAddress} ${address.zip_code}`
        : address.zip_code;
    }
    if (address.country) {
      fullAddress = fullAddress.length
        ? `${fullAddress} ${address.country}`
        : address.country;
    }

    return fullAddress;
  };

  public sendEndorsementEmail = async (req: Request, res: Response) => {
    try {
      const { applicationId } = req.params;

      const endorserQuery = `SELECT e.id, e.email_address as endorser_email, e.personal_note as candidate_message, token, e.first_name as endorser_firstname, e.last_name as endorser_lastname, p.first_name as candidate_firstname, p.last_name as candidate_lastname, u.email_address as candidate_email, job.id as job_id, job.title as job_title FROM endorser as e LEFT OUTER JOIN endorsement_email_token as eet ON eet.endorser_id = e.id LEFT OUTER JOIN application as a ON e.application_id = a.id LEFT OUTER JOIN profile as p ON a.applicant_id = p.id LEFT OUTER JOIN job ON a.job_id = job.id LEFT OUTER JOIN users as u ON p.user_id = u.id WHERE e.application_id = '${applicationId}';`;
      const endorsers: any = (await sequelize.query(endorserQuery))[0];
      console.log("endorsers: ", endorsers);

      for (const endorser of endorsers) {
        sendEndoresementMail(endorser);
      }

      this.sendOkResponse(
        res,
        "Endorsement mail sent successfully.",
        endorsers
      );
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public sendEndorsementFeedbackEmail = async (req: Request, res: Response) => {
    try {
      const token = req.query.token;

      const endorserQuery = `
     SELECT
      -- Endorsement Email Token
      et.id AS et_id,
      et.version AS et_version,
      et.date_created AS et_date_created,
      et.last_updated AS et_last_updated,
      et.token AS et_token,
      et.status AS et_status,
      et.endorser_id AS et_endorser_id,
      et.expiration_date AS et_expiration_date,

      -- Endorser
      e.id AS e_id,
      e.version AS e_version,
      e.date_created AS e_date_created,
      e.linked_in_profile AS e_linked_in_profile,
      e.first_name AS e_first_name,
      e.last_name AS e_last_name,
      e.mobile_phone AS e_mobile_phone,
      e.last_updated AS e_last_updated,
      e.application_id AS e_application_id,
      e.gender AS e_gender,
      e.is_email_sent AS e_is_email_sent,
      e.relationship AS e_relationship,
      e.current_company AS e_current_company,
      e.department AS e_department,
      e.email_address AS e_email_address,
      e.end_year_of_working AS e_end_year_of_working,
      e.personal_note AS e_personal_note,
      e.start_year_of_working AS e_start_year_of_working,
      e.status AS e_status,
      e.current_position AS e_current_position,
      e.last_name AS e_last_name,
      e.company_together AS e_company_together,

      -- Application
      a.id AS a_id,
      a.version AS a_version,
      a.is_short_listed AS a_is_short_listed,
      a.date_created AS a_date_created,
      a.job_id AS a_job_id,
      a.last_updated AS a_last_updated,
      a.applicant_id AS a_applicant_id,
      a.achievements AS a_achievements,
      a.excels AS a_excels,
      a.date_applied AS a_date_applied,
      a.competencies_id AS a_competencies_id,
      a.push_factors AS a_push_factors,
      a.status AS a_status,
      a.pull_factors AS a_pull_factors,
      a.resume_id AS a_resume_id,

      -- Profile
      p.id AS p_id,
      p.version AS p_version,
      p.date_created AS p_date_created,
      p.first_name AS p_first_name,
      p.last_updated AS p_last_updated,
      p.middle_name AS p_middle_name,
      p.gender AS p_gender,
      p.phone_number AS p_phone_number,
      p.linked_in_url AS p_linked_in_url,
      p.address_id AS p_address_id,
      p.mobile_number AS p_mobile_number,
      p.user_id AS p_user_id,
      p.nationality AS p_nationality,
      p.status AS p_status,
      p.birth_date AS p_birth_date,
      p.last_name AS p_last_name,
      p.picture_url AS p_picture_url,

      -- Job
      j.title AS j_title,
      j.id AS j_id,
    
      -- Hiring Manager Profile
      hm.first_name AS hm_first_name,
      hm.last_name AS hm_last_name,

      -- Hiring Manager User Details
      u.id AS u_id,
      u.email_address AS u_email_address,

      -- Tenant Details
      t.subdomain AS t_subdomain,

      -- Company Icon
      c.logo AS company_logo,

      -- email_template_signature
      ets.template AS email_template_signature
      
      FROM public.endorsement_email_token AS et
      INNER JOIN public.endorser AS e ON e.id = et.endorser_id
      INNER JOIN public.application AS a ON a.id = e.application_id
      INNER JOIN public.profile AS p ON p.id = a.applicant_id
      INNER JOIN public.job AS j ON j.id = a.job_id
      INNER JOIN public.profile AS hm ON hm.id = j.hiring_manager_id
      INNER JOIN public.users AS u ON u.id = hm.user_id
      INNER JOIN public.tenant AS t ON t.id = u.tenant_id
      INNER JOIN public.company AS c ON c.id = t.company_id
      INNER JOIN public.email_template_signature AS ets ON ets.id = t.email_template_signature_id
      WHERE et.token = '${token}'`;

      let endorser: any = (await sequelize.query(endorserQuery))[0];
      
      // Get the iamge URL 
      endorser[0].company_logo = await getImage(endorser[0].company_logo);
      
      // Send the email
      sendEndoresementFeedbackMail(endorser[0]);

      this.sendOkResponse(
        res,
        "Endorsement mail sent successfully.",
        endorser
      );
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

}

function getImage(originalUrl: string): string {
  if (!originalUrl) return ''; // Return an empty string if the input URL is invalid
  // Extract the part after 'SaaS/' and replace the path with the correct format
  const logoPath = originalUrl
    .substring(originalUrl.indexOf('SaaS/') + 5)
    .replace('/', '-');
  // Return the transformed URL
  return `${process.env.API_STAGING_URL}/api/v1/Public/Uploads/COMPANY_LOGO/${logoPath}`;
}