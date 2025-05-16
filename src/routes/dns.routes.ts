import { Router } from "express";
import { DnsController } from "../controllers/dns.controller";

export class DnsRoutes {
  public dnsController: DnsController = new DnsController();
  public router: Router = Router();

  constructor() {
    this.config();
  }

  private config(): void {
    this.router.post("/", this.dnsController.createDns);
    this.router.post("/createDnsNew", this.dnsController.createDnsNew);
    this.router.get("/:id", this.dnsController.getDNS);
    this.router.delete("/:id", this.dnsController.deleteDns);
  }
}
