import express from "express";
import dotenv from 'dotenv'
import router from "./Routers/routes.js";

dotenv.config({ path: "../.env" });

const PORT = process.env.ND_PORT || 3002;

const app = express();

app.use("/", router);
app.use(express.json());

app.listen(PORT, () => {
    console.log(`Your website is running on http://localhost:${PORT}`);
});