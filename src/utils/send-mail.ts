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

const sendEndoresementFeedbackMail = (data: any) => {

  const job_link = `${env.STAGING_URL}/jobs/${data.a_job_id}`;
  const email_template_signature = data.email_template_signature ? data.email_template_signature : '';

  const url = path.join(__dirname, '../content/endorsement_feedback_mail.html');

  let html = fs.readFileSync(url, 'utf8');
  html = html.replace(/{applicant_firstName}/g, data.p_first_name);
  html = html.replace(/{endorser_firstName}/g, `${data.e_first_name}`);
  html = html.replace(/{endorser_lastName}/g, `${data.e_last_name}`);
  html = html.replace(/{job_title}/g, `${data.j_title}`);
  html = html.replace(/{job_id}/g, `${data.j_id}`);
  html = html.replace(/{hiringManager_firstName}/g, `${data.hm_first_name}`);
  html = html.replace(/{hiringManager_lastName}/g, `${data.hm_last_name}`);
  html = html.replace(/{hiringManager_user_emailAddress}/g, data.u_email_address);
  html = html.replace(/{tenant_subdomain}/g, data.t_subdomain);
  html = html.replace(/{company_icon}/g, data.company_logo);
  html = html.replace(/{job_link}/g, job_link);
  html = html.replace(/{email_template_signature}/g, email_template_signature);

  const mail = {
    to: data.endorser_email,
    from: "ReturnOnTalent <hello@returnontalent.io>",
    subject: "Welcome to ReturnOnTalent",
    html
  };
  transporter.sendMail(mail);
}

export { sendMailToHiringManager, sendEndoresementMail, sendEndoresementFeedbackMail };
