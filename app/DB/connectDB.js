import pg from "pg";
import dotenv from "dotenv";

dotenv.config({path:'../.env'});

const client = new pg.Pool({
    host: process.env.PSQL_HOST,
    user: process.env.PSQL_USER,
    password: process.env.PSQL_PWD,
    port: process.env.PSQL_PORT,
    database: process.env.PSQL_DB
});


export default client;