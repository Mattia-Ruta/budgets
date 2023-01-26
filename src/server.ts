import express, { Express, Request, Response } from "express";
import { join } from "path";

const settings = require(join(__dirname, "core", "settings"));

const app: Express = settings.app;
app.use(express.json());
const router = express.Router();
const logger = settings.logger;

// App routing
app.use("/", require("./budgets/views"));
app.use("/accounts", require("./accounts/views"));

// Development Server
app.listen(settings.devPort, () => {
    logger.debug(
        `Development server running on port ${settings.devPort}`
    );
});

module.exports=router;
