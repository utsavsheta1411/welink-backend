import { Router } from "express";
import fs from "fs";
import path from "path";
import multer from "multer";
import { FileUploadController } from "../controllers/file-upload.controller";
import { sequelize } from "../config/database";

export class FileUploadRoutes {
  public fileUploadController: FileUploadController =
    new FileUploadController();
  public router: Router = Router();

  constructor() {
    this.config();
  }

  private config(): void {
    const uploadDirectory = path.join(__dirname, "../Public/Uploads/");

    // Ensure the base upload directory exists
    if (!fs.existsSync(uploadDirectory)) {
      fs.mkdirSync(uploadDirectory, { recursive: true });
    }

    const storage = multer.diskStorage({
      destination: (req, file, callback) => {
        callback(null, uploadDirectory); // Temp storage before moving to the final path
      },
      filename: (req, file, callback) => {
        const fileName = req.query.filename; // Extract from query parameter
        callback(null, `${fileName}`);
      },
    });

    const upload = multer({
      storage: storage,
      limits: { fileSize: 5 * 1024 * 1024 },
    });

    this.router.post(
      "/upload-image",
      upload.single("resource"),
      async (req, res, next) => {
        try {
          const folder = req.query.folder as string; // Explicitly cast to string
          const filename = req.query.filename as string; // Explicitly cast to string

          if (!folder) {
            return res.status(400).json({
              success: false,
              message: "Folder name is required",
              data: null,
            });
          }
          if (!filename) {
            if (req.file) {
              fs.unlinkSync(req.file.path);
            }
            return res.status(400).json({
              success: false,
              message: "Filename is required",
              data: null,
            });
          }
          if (!req.file) {
            return res.status(400).json({
              success: false,
              message: "No file uploaded. Please provide a file",
              data: null,
            });
          }
          console.log("folder: ", folder);
          // Construct dynamic subfolder path
          const subFolderPath = path.join(uploadDirectory, folder);

          // Ensure the dynamic subfolder exists
          if (!fs.existsSync(subFolderPath)) {
            fs.mkdirSync(subFolderPath, { recursive: true });
          }

          // Construct new file path
          const finalFilePath = path.join(subFolderPath, filename);

          // Move uploaded file to the correct subfolder
          fs.renameSync(req.file.path, finalFilePath);

          // Construct public-facing URL for the client
          const publicUrl = `https://stagingnode.returnontalent.io/api/v1/Public/Uploads/${folder}/${filename}`;

          let applicantId: string | null = null;
          const match = filename.match(/^profile_(.+)$/);
          if (match && match[1]) {
            applicantId = match[1];
          }

          if (folder == "profile_pictures") {
            if (!applicantId) {
              return res.status(400).json({
                success: false,
                message: "Applicant ID could not be extracted from filename",
              });
            }

            // Update the applicant profile_url in DB (adjust to your DB access method)

            sequelize.query(
              `UPDATE applicant_profile SET picture_url = '${publicUrl}' WHERE id = '${applicantId}'`,
              {
                type: "update",
              }
            );
          }
          res.status(200).json({
            success: true,
            message: "File uploaded successfully",
            filePath: publicUrl,
          });
        } catch (err) {
          next(err); // Forward any unexpected error to the error handler
        }
      }
    );

    this.router.use((err: any, req: any, res: any, next: any) => {
      if (err instanceof multer.MulterError) {
        if (err.code === "LIMIT_FILE_SIZE") {
          return res.status(400).json({
            success: false,
            message: "File too large. Maximum allowed size is 5MB.",
          });
        }
        return res.status(400).json({
          success: false,
          message: `Multer error: ${err.message}`,
        });
      } else if (err) {
        return res.status(500).json({
          success: false,
          message: `Unexpected error: ${err.message}`,
        });
      }
      next();
    });
  }
}
