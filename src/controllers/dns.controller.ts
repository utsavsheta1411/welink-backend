import { NextFunction, Request, Response } from "express";

import { DNS } from "../models/dns.model";
import { HttpStatus } from "../utils/http-status";

export class DnsController extends HttpStatus {
  public createDns = async (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const { dns, companyId } = req.body;
      const isExist = await DNS.findOne({
        where: {
          dns,
          company_id: companyId,
        },
      });

      if (isExist)
        return this.sendBadRequestResponse(res, "DNS already exist.");

      const create = await DNS.create({
        dns,
        company_id: companyId,
      });

      if (!create)
        return this.sendBadRequestResponse(res, "Unable to create DNS.");

      this.sendOkResponse(res, "DNS created successfully.", create);
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };
  public createDnsNew = async (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const { data, company_id } = req.body;
      let lstDns: any = [];
      // arrProductApplyDiscount = strProductApplyDiscount.split(",");
      for (var i = 0; i < data.length; i++) {
        lstDns.push({
          company_id,
          dns: data[i],
        });
      }
      let getAllDns: any;
      await DNS.destroy({ where: { company_id: company_id } }).then(
        async function (res) {
          await DNS.bulkCreate(lstDns).then(async function (rescreate) {
            if (rescreate) {
              getAllDns = await DNS.findAll({
                where: {
                  company_id,
                },
              });
            }
          });
        }
      );
      this.sendOkResponse(res, "DNS created successfully.", getAllDns);
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public getDNS = async (req: Request, res: Response, next: NextFunction) => {
    try {
      const company_id = req.params.id;
      const getAllDns = await DNS.findAll({
        where: {
          company_id,
        },
      });

      if (!getAllDns.length)
        return this.sendBadRequestResponse(res, "Dns not found.");
      this.sendOkResponse(res, "Dns found successfully.", getAllDns);
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };

  public deleteDns = async (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      const id = req.params.id;
      const isExist = await DNS.findOne({ where: { id } });
      if (!isExist) return this.sendBadRequestResponse(res, "Dns not found.");

      const deleteDns = await DNS.destroy({ where: { id } });
      if (!deleteDns)
        return this.sendBadRequestResponse(res, "Unable to delete dns.");

      this.sendOkResponse(res, "Dns deleted successfully.");
    } catch (err) {
      console.log("err: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };
}
