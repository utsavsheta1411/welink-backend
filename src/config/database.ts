import mysql from 'mysql';
import { Client } from 'pg';
import env from '../utils/validateEnv';
import { Sequelize } from 'sequelize';
import { initMySQLModels } from '../models';

const client = new Client({
    host: env.SQL_HOST,
    user: env.SQL_USER,
    password: env.SQL_PASSWORD,
    database: env.SQL_DATABASE,
    port: env.SQL_PORT
});
client.connect((err) => {
    if(err) {
        console.log("Error: ", err);
        return;
    }

    console.log("DB connected successfully.");
})

export const query = (sql: string) => {
    console.log('sql: ', sql);
    return new Promise((resolve, reject) => {
        client.query(sql, (err, res) => {
            if (err) {
                console.log('err: ', err);
                return reject(err);
            }
    
            console.log('Data: ', res);
            resolve(res);
        });
    });
}

export const sequelize = new Sequelize({
    host: env.SQL_HOST,
    username: env.SQL_USER,
    password: env.SQL_PASSWORD,
    database: env.SQL_DATABASE,
    port: env.SQL_PORT,
    dialect: 'postgres'
});

(async () => {
    await sequelize.authenticate();
    console.log("Connection to the database has been established successfully.");

    initMySQLModels(sequelize);
})();