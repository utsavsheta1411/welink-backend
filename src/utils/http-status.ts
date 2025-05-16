import { Response } from "express";

interface response {
  success: boolean;
  message?: string;
  errorMessage?: string;
  data?: any;
}

export class HttpStatus {
    public sendOkResponse = (res: Response, message: string, data: any = null) => {
        const resObject: response = { success: true, message, data };
        res.status(200).json(resObject);
    }

    public sendBadRequestResponse = (res: Response, message: string = "Something went wrong, please try again later.", data: any = null) => {
        const resObject: response = { success: false, message, data };
        res.status(400).json(resObject);
    };

  public sendErrorResponse = (
    res: Response,
    errorMessage: string,
    data: any = null
  ) => {
    const resObject: response = { success: false, errorMessage, data };
    res.status(400).json(resObject);
  };
}
