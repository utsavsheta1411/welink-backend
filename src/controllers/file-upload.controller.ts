// src/controllers/file-upload.controller.ts
import { NextFunction, Request, Response } from "express";
import { HttpStatus } from "../utils/http-status"; // Assuming you have a custom HttpStatus class
import fs from "fs";
import sharp from "sharp";

export class FileUploadController extends HttpStatus {
  public uploadFile = async (
    req: Request,
    res: Response,
    next: NextFunction
  ) => {
    try {
      if (!req.file) {
        return this.sendBadRequestResponse(res, "No file uploaded.");
      }

      const filePath = req.file.path;
      const imageMetadata = await sharp(filePath).metadata();

      if (imageMetadata.width !== 400 || imageMetadata.height !== 120) {
        // Delete the file if resolution doesn't meet the criteria
        fs.unlinkSync(filePath);
        return this.sendErrorResponse(
          res,
          "Image resolution must be exactly 400 x 120 pixels."
        );
      }

      // Return success response with uploaded file path
      return this.sendOkResponse(res, "Upload images successfully!", {
        filePath: `https://stagingnode.returnontalent.io/api/v1/Public/Uploads/CompanyImages/${req.file.filename}`,
      });
    } catch (err) {
      console.error("Error: ", err);
      if (err instanceof Error) {
        this.sendBadRequestResponse(res, err.message);
      }
    }
  };
}
