import { Router } from "express";
import { EndorserController } from "../controllers/endorser.controller";

export class EndorserRoutes {
  public endorserController: EndorserController = new EndorserController();
  public router: Router = Router();

  constructor() {
    this.config();
  }

  private config(): void {
    this.router.post("/", this.endorserController.endorserRole);
    this.router.get("/endorsements", this.endorserController.getEndorsementList);
    this.router.get("/endorsements/:endorserId", this.endorserController.getEndorsementDetails);
    this.router.get("/endorsement-mail/:applicationId", this.endorserController.sendEndorsementEmail);
  }
}
