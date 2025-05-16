import { Router } from "express";
import { UserController } from "../controllers/user.controller";

export class UserRoutes {
  public userController: UserController = new UserController();
  public router: Router = Router();

  constructor() {
    this.config();
  }

  private config(): void {
    this.router.get("/", this.userController.getAllUsers);
    this.router.get("/getHobbies", this.userController.getHobbies);
    this.router.post("/signup", this.userController.signup);
    // this.router.post('/login', this.userController.login);

    this.router.post("/signup-auth", this.userController.auth0Signup);
    this.router.post(
      "/create-hiringmanager",
      this.userController.sendMailToHiringManager
    );
    this.router.post("/assignRole", this.userController.assignApplicantRole);
    this.router.get("/getUserByEmail", this.userController.getUserByEmail);
    this.router.put("/changePassword", this.userController.changePassword);
    this.router.put("/updateProfilePic", this.userController.updateProfilePic);
    this.router.put("/updateProfileData/:id", this.userController.updateProfileData);
  }
}
