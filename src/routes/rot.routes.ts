import { Router } from "express";
import { RotController } from "../controllers/rot.controller";

export class RotRoutes {
  public rotController: RotController = new RotController();
  public router: Router = Router();

  constructor() {
    this.config();
  }

  private config(): void {
    this.router.get("/ai-prediction-of-leavers", this.rotController.ForecastingEmployeesLeave);
    this.router.get("/risk-level-turnover", this.rotController.RiskLevelTurnover);
    this.router.get("/risk-cost", this.rotController.RiskCost);
    this.router.get("/external-recruitment-cost-savings", this.rotController.ExternalRecruitmentCostSavings);
    this.router.get("/wage-containment-savings", this.rotController.WageContainmentSavings);
    this.router.get("/number-of-live-opportunities", this.rotController.NumberOfLiveOpportunities);
    this.router.get("/latest-opportunities-created", this.rotController.LatestOpportunitiesCreated);
    this.router.get("/employee-application-funnel", this.rotController.EmployeeApplicationFunnel);
    this.router.get("/application-outcomes", this.rotController.ApplicationOutcomes);
    this.router.post("/assumptions-tab", this.rotController.AssumptionsTab);
  }
}