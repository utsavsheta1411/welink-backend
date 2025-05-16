import { NextFunction, Request, Response } from "express";
import { HttpStatus } from "../utils/http-status";
import { sequelize } from "../config/database";
import moment from "moment";

export class RotController extends HttpStatus{
    public ForecastingEmployeesLeave = async (req: Request, res: Response) => {
      try {
        const getQueryThisMonth = `SELECT applicant_id, date_applied FROM application
                            WHERE date_applied IS NOT NULL;`

        const applicationData :any = await sequelize.query(getQueryThisMonth,{
            type: "select",
        });

        console.log("applicationData: ", applicationData);
        

        let resData = {
            this_month: 0,
            next_month: 0,
            in_3_months: 0,
            in_4_months: 0,
            in_5_months: 0,
            in_6_months: 0
        };

        applicationData.forEach((element: {
            date_applied: any; applicant_id: any; }) => {
            let monthsDiff = moment().diff(moment(element.date_applied), 'months', true);
            if (monthsDiff >= 6) {
                resData.this_month++;
            } else if(monthsDiff >= 5) {
                resData.next_month++;
            } else if(monthsDiff >= 3) {
                resData.in_3_months++;
            } else if(monthsDiff >= 2) {
                resData.in_4_months++;
            } else if(monthsDiff >= 1) {
                resData.in_5_months++;
            } else if(monthsDiff == 0){
                resData.in_6_months++;
            }
        });

        this.sendOkResponse(res, "Forecasting of employees who are likely to leave a company.", resData);
      } catch (err) {
        console.log("err: ", err);
        if (err instanceof Error) {
          this.sendBadRequestResponse(res, err.message);
        }
      }
    };

    public RiskLevelTurnover = async (req: Request, res: Response) => {
        try {

            const getQueryThisMonth = `SELECT applicant_id, date_applied FROM application
                            WHERE date_applied IS NOT NULL;`

            const applicationData :any = await sequelize.query(getQueryThisMonth,{
                type: "select",
            });

            console.log("applicationData: ", applicationData);
            

            let resData = {
                this_month: 0,
                next_month: 0,
                in_3_months: 0,
                in_4_months: 0,
                in_5_months: 0,
                in_6_months: 0
            };
            
            let totalScore = 0;
            let totalCount = 0;
            
            applicationData.forEach((element: { date_applied: any; applicant_id: any; }) => {
                let monthsDiff = moment().diff(moment(element.date_applied), 'months', true);
                if (monthsDiff >= 6) {
                    resData.this_month++;
                    totalScore += 100;
                } else if(monthsDiff >= 5) {
                    resData.next_month++;
                    totalScore += 80;
                } else if(monthsDiff >= 3) {
                    resData.in_3_months++;
                    totalScore += 60;
                } else if(monthsDiff >= 2) {
                    resData.in_4_months++;
                    totalScore += 40;
                } else if(monthsDiff >= 1) {
                    resData.in_5_months++;
                    totalScore += 20;
                } else if(monthsDiff == 0){
                    resData.in_6_months++;
                    totalScore += 0;
                }
                totalCount++;
            });
            
            let weightedAverage = totalCount > 0 ? Math.round(totalScore / totalCount) : 0;
            
            console.log("resData: ", resData);
            console.log("Weighted Average Risk Score: ", weightedAverage);

            const response = {
                result: weightedAverage
            };

            this.sendOkResponse(res, "Risk Level Turnover", response);
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public RiskCost = async (req: Request, res: Response) => {
        try {
            const getQuery = `SELECT COUNT(DISTINCT application.applicant_id) AS unique_applicants 
                    FROM public.application
                    JOIN public.profile ON application.applicant_id = profile.id
                    WHERE application.date_applied IS NOT NULL
                    AND profile.status != 'DELETED';`;

            const applicationData :any = await sequelize.query(getQuery,{
                type: "select",
            });

            this.sendOkResponse(res, "Risk Cost", {"result": applicationData[0].unique_applicants});
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public ExternalRecruitmentCostSavings = async (req: Request, res: Response) => {
        try {
            const getQuery = `SELECT COUNT(DISTINCT application.applicant_id) AS unique_applicants 
                    FROM public.application
                    WHERE application.status = 'HIRED';`;

            const applicationData :any = await sequelize.query(getQuery,{
                type: "select",
            });

            this.sendOkResponse(res, "External Recruitment Cost Savings", {"result": applicationData[0].unique_applicants});
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public WageContainmentSavings = async (req: Request, res: Response) => {
        try {
            const getQuery = `SELECT COUNT(DISTINCT application.applicant_id) AS unique_applicants 
                    FROM public.application
                    WHERE application.status = 'HIRED';`;

            const applicationData :any = await sequelize.query(getQuery,{
                type: "select",
            });

            this.sendOkResponse(res, "Wage Containment Savings", {"result": applicationData[0].unique_applicants});
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public NumberOfLiveOpportunities = async (req: Request, res: Response) => {
        try {

            let {filter_time} = req.query;
            if(!filter_time){
                this.sendBadRequestResponse(res, 'filter time is not undefined');
                return;
            }

            if (!moment(filter_time?.toString(), 'MM-YYYY').isValid()) {
                this.sendBadRequestResponse(res, 'The parameter is not in the correct format. Please input format MM-YYYY');
                return;
            }
        
            let startOfMonth = moment(filter_time?.toString(), 'MM-YYYY').startOf('month').format('YYYY-MM-DD');
            let endOfMonth = moment(filter_time?.toString(), 'MM-YYYY').endOf('month').format('YYYY-MM-DD');
            let month = moment(filter_time?.toString(), 'MM-YYYY').format('MM');
        
            const getQuery = `SELECT date_created FROM job
                    WHERE status = 'ACTIVE'
                    AND date_created BETWEEN '${startOfMonth}' AND '${endOfMonth}';`;

        
            const jobData: any = await sequelize.query(getQuery, {
                type: "select",
            });

            const getTotalCountQuery = `SELECT COUNT(*) as total_count FROM job
                                    WHERE status = 'ACTIVE';`;

            const totalCountData: any = await sequelize.query(getTotalCountQuery, {
                type: "select",
            });

            let totalCount = totalCountData[0]?.total_count || 0;
        
            let resData = {
                week_1: 0,
                week_2: 0,
                week_3: 0,
                week_4: 0,
                week_5: 0,
            };
          
            jobData.forEach((element: { date_created: any }) => {
                let weekOfMonth = moment(element.date_created).week() - moment(element.date_created).startOf('month').week() + 1;
                switch (weekOfMonth) {
                    case 1:
                        resData.week_1++;
                        break;
                    case 2:
                        resData.week_2++;
                        break;
                    case 3:
                        resData.week_3++;
                        break;
                    case 4:
                        resData.week_4++;
                        break;
                    case 5:
                        resData.week_5++;
                        break;
                    default:
                        break;
                }
            });
          
            const details = [
                { date: `01-${month}`, value: resData.week_1 },
                { date: `08-${month}`, value: resData.week_2 },
                { date: `15-${month}`, value: resData.week_3 },
                { date: `22-${month}`, value: resData.week_4 },
                { date: `29-${month}`, value: resData.week_5 },
            ];
          
            const data = {
                total_count: totalCount,
                filter_time: filter_time,
                details: details,
            };
            this.sendOkResponse(res, "Number of live opportunities", data);
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public LatestOpportunitiesCreated = async (req: Request, res: Response) => {
        try {
            const getQuery = `SELECT job.id, title, selected_brand, "location", description, job.date_created AS created_at, 
                    (CASE 
                    WHEN profile.middle_name IS NULL THEN CONCAT(profile.first_name, ' ', profile.last_name)
                    ELSE CONCAT(profile.first_name, ' ', profile.middle_name, ' ', profile.last_name)
                    END) AS hiring_manager
                    FROM public.job
                    JOIN public.profile ON job.hiring_manager_id = profile.id
                    WHERE job.status = 'ACTIVE'
                    ORDER BY job.date_created DESC
                    LIMIT 5;`;

            const applicationData :any = await sequelize.query(getQuery,{
                type: "select",
            });

            this.sendOkResponse(res, "Latest opportunities created", applicationData);
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public EmployeeApplicationFunnel = async (req: Request, res: Response) => {
        try {
            const getQuery = `SELECT application.status, COUNT(*) AS count
                    FROM public.job
                    JOIN public.application ON application.job_id = job.id
                    WHERE job.status = 'ACTIVE'
                    GROUP BY application.status;`;


            const applicationData :any = await sequelize.query(getQuery,{
                type: "select",
            });

            let countComplete = 0;
            let countIncomplete = 0;
            let countEndorsed = 0;

            applicationData.forEach((element: { status: string; count: number }) => {
                if (['COMPLETED', 'HIRED'].includes(element.status)) {
                    countComplete += Number(element.count);
                }
          
                if (element.status === 'INCOMPLETE') {
                    countIncomplete += Number(element.count);
                }
          
                if (['SUBMITTED', 'REJECTED'].includes(element.status)) {
                    countEndorsed += Number(element.count);
                }
              });

            const data = {
                "incomplete_applications": countIncomplete,
                "complete_applications": countComplete,
                "endorsed_applications": countEndorsed
            }
            this.sendOkResponse(res, "Employee Application Funnel", data);
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public ApplicationOutcomes = async (req: Request, res: Response) => {
        try {
            const hiringManagerName = "Emmanuel xx SuperUser";
            const getQuery = `
                SELECT application.status, COUNT(*) AS count
                FROM public.job
                JOIN public.application ON application.job_id = job.id
                JOIN public.profile ON job.hiring_manager_id = profile.id
                WHERE job.status = 'ACTIVE'
                    AND (profile.first_name || ' ' || COALESCE(profile.middle_name, '') || ' ' || profile.last_name) = :hiringManagerName
                GROUP BY application.status;
                `;

            const applicationData: any = await sequelize.query(getQuery, {
                type: "select",
                replacements: { hiringManagerName },
            });

            console.log("applicationData ApplicationOutcomes: ", applicationData);

            let countHired = 0;
            let countTalentPool = 0;
            let countNotReviewed = 0;

            applicationData.forEach((element: any) => {
            if (element.status == 'HIRED') {
                countHired += Number(element.count);
            }

            if (element.status == 'REJECTED') {
                countTalentPool += Number(element.count);
            }

            if (['COMPLETED', 'INCOMPLETE'].includes(element.status)) {
                countNotReviewed += Number(element.count);
            }
            });

            const data = {
                selected: countHired,
                talent_pool: countTalentPool,
                not_reviewed: countNotReviewed
            };
            this.sendOkResponse(res, "Application Outcomes", data);
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }

    public AssumptionsTab  = async (req: Request, res: Response) => {
        try {
            this.sendOkResponse(res, "Assumptions tab ", []);
        } catch (err) {
            console.log("err: ", err);
            if (err instanceof Error) {
                this.sendBadRequestResponse(res, err.message)
            }
        }
    }
}