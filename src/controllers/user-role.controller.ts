import { Request, Response } from "express";
import { HttpStatus } from "../utils/http-status";
import { sequelize } from "../config/database";

export class User_role extends HttpStatus {
  public userRole = async (req: Request, res: Response) => {
    try {
      const { email } = req.query;

      const getQuery = `Select authority from role where id IN (select role_id from user_role where user_id = (select USERS.id from users AS USERS WHERE email_address = '${email}'));`;

      const userData = await sequelize.query(getQuery);
      console.log("userData: ", userData[0]);

      if (!userData[0]?.length)
        return this.sendBadRequestResponse(res, "User not found.");

      const responseData: string[] = [];
      userData[0].forEach((element: any) => {
        responseData.push(element.authority);
      });

      this.sendOkResponse(res, "User data found successfully.", {
        roles: responseData,
        username: email,
      });
    } catch (err) {
      console.log("err: ", err);
    }
  };
}
