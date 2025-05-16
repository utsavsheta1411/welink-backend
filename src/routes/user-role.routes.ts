import { Router } from "express";
import { User_role } from "../controllers/user-role.controller";

export class UserRoleRoutes {
  public userRoleController: User_role = new User_role();
  public router: Router = Router();

  constructor() {
    this.config();
  }

  private config(): void {
    this.router.get("/", this.userRoleController.userRole);
  }
}
