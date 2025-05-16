import 'dotenv/config';
import { createServer } from 'http';
import { App } from './app';
import env from './utils/validateEnv';
import './config/database';

const app = new App();

// Create HTTP server
const httpServer = createServer(app.express);

// Start the server
httpServer.listen(env.PORT, () => {
    console.log(`Server is running on port ${env.PORT}`);
});