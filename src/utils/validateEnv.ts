import { cleanEnv } from "envalid";
import { port, str } from "envalid/dist/validators";

export default cleanEnv(process.env, {
  // Server Environment
  NODE_ENV: str(),

  // API Port
  PORT: port(),

  // Database Configuration
  DB: str(),
  SQL_HOST: str(),
  SQL_USER: str(),
  SQL_PASSWORD: str(),
  SQL_DATABASE: str(),
  SQL_PORT: port(),

  // JWT secret
  SECRET: str(),

  // Auth0 Configuration
  CLIENT_ID: str(),
  CLIENT_SECRET: str(),
  DOMAIN: str(),
  REDIRECT_URL: str(),
  HIRING_MANAGER: str(),
  STAGING_URL: str(),

  // Buckets
  STAGING: str(),
  DEVELOP: str(),
  PRODUCTION: str(),
});
