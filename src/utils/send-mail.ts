import nodemailer, { TransportOptions } from "nodemailer";
import env from '../utils/validateEnv';
import fs from 'fs';
import path from 'path';

interface SMTPConfig extends TransportOptions {
  service: string | undefined;
  host: string | undefined;
  port: string | undefined;
  secure: string | undefined;
  auth: {
    user: string | undefined;
    pass: string | undefined;
  };
  tls: {
    rejectUnauthorized: boolean;
  };
}

const smtpConfig: SMTPConfig = {
  service: process.env.SMTP_SERVICE,
  host: process.env.SMTP_HOST,
  port: process.env.SMTP_PORT,
  secure: process.env.SMTP_SECURE,
  auth: {
    user: process.env.SMTP_EMAIL,
    pass: "lqznwgcfsmpcccuc",
  },
  tls: {
    rejectUnauthorized: false,
  },
};

const transporter = nodemailer.createTransport(smtpConfig);

const sendMailToHiringManager = async (email: string) => {
  console.log("*#$$$#$", email);
  const mail = {
    to: email,
    from: process.env.SMTP_EMAIL,
    subject: "Welcome Hiring Manager",
    text: `Your email address is working now as Hiring Manager too.`,
  };
  const info: any = transporter.sendMail(mail);
};

// https://staging.returnontalent.io/endorser-candidate-info?token=FxVDrpUHK3OIs174SQt3FxQD3uG0ZPoe27yA7G5xEROVZ0J0
const sendEndoresementMail = (data: any) => {
  const link = `${env.STAGING_URL}/endorser-candidate-info?token=${data.token}`;
  const job_link = `${env.STAGING_URL}/jobs/${data.job_id}`;
  const url = path.join(__dirname, '../content/endorsement_mail.html');
  console.log('url: ', url);
  let html = fs.readFileSync(url, 'utf8');
  html = html.replace(/{endorsement_link}/g, link);
  html = html.replace(/{endorser_name}/g, `${data.endorser_firstname} ${data.endorser_lastname}`);
  html = html.replace(/{candidate_firstname}/g, `${data.candidate_firstname}`);
  html = html.replace(/{candidate_lastname}/g, `${data.candidate_lastname}`);
  html = html.replace(/{candidate_email}/g, `${data.candidate_email}`);
  html = html.replace(/{personal_message}/g, `${data.candidate_message}`);
  html = html.replace(/{job_name}/g, `${data.job_title}`);
  html = html.replace(/{job_link}/g, job_link);

  const mail = {
    to: data.endorser_email,
    from: "ReturnOnTalent <hello@returnontalent.io>",
    subject: "Welcome to ReturnOnTalent",
    html
  };
  const info: any = transporter.sendMail(mail);
}

export { sendMailToHiringManager, sendEndoresementMail };
