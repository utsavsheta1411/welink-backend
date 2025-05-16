import { UserRoutes } from "./user.routes";
import { DnsRoutes } from "./dns.routes";
import { Router } from "express";
import { UserRoleRoutes } from "./user-role.routes";
import { EndorserRoutes } from "./endorser.routes";
import { RotRoutes } from "./rot.routes";
import { FileUploadRoutes } from "./file-upload.routes";

export class Routes {
  public router = Router();

  // Create routes instances
  private userRoutes: UserRoutes = new UserRoutes();
  private dnsRoutes: DnsRoutes = new DnsRoutes();
  private userRoleRoutes: UserRoleRoutes = new UserRoleRoutes();
  private endorserRoutes: EndorserRoutes = new EndorserRoutes();
  private rotRouter: RotRoutes = new RotRoutes();
  private fileUploadRoutes: FileUploadRoutes = new FileUploadRoutes();

  constructor() {
    // Initialize routes
    this.router.use("/user", this.userRoutes.router);
    this.router.use("/dns", this.dnsRoutes.router);
    this.router.use("/user-role", this.userRoleRoutes.router);
    this.router.use("/endorser", this.endorserRoutes.router);
    this.router.use("/rot", this.rotRouter.router);
    this.router.use("/file-upload", this.fileUploadRoutes.router);
  }
}
