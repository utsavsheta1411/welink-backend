import express, { Express, Request, Response } from 'express';
import path from 'path';
import cors from 'cors';
import morgan from 'morgan';
import { Routes } from './routes/index.routes';

export class App {
    public express: Express = express();
    public routes = new Routes();
    
    constructor() {
        // Middlewares
        this.express.use(morgan('dev'));
        this.express.use(express.json({ limit: '200mb' }));
        this.express.use(cors({
            origin: '*',
            methods: ['GET', 'POST', 'OPTIONS', 'PUT', 'PATCH', 'DELETE'],
            allowedHeaders: ["Origin", "X-Requested-With", "Content-Type", "Accept", "Authorization", "Access-Control-Allow-Headers"],
            credentials: true,
        }));

        // Serve static files from the 'uploads' directory
        this.express.use("/api/v1/Public", express.static(path.join(__dirname, "Public")));

        // Routes
        this.express.use('/api/v1', this.routes.router);

        // Route to check if the server is working
        this.express.get('/', (req: Request, res: Response) => {
            res.send('Server Works! 🚀🚀 ');
        });

        // If no route is matched
        this.express.use((req: Request, res: Response) => {
            res.status(404).send('Endpoint not found!');
        });
    }
}
