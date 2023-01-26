/**
 * Main Project Settings
 * 
 * This is where core functionality is written to be used across the project.
 */
import express, { NextFunction } from "express";
import { join, resolve } from "path";
import { PrismaClient } from "@prisma/client";
import helmet from "helmet";
import cors from "cors";
import compression from "compression";
import "dotenv";

// ==========================================

const app = express();


// Default to dev log location in project
const logPath = process.env.ERROR_LOG ?? resolve(__dirname, "log", "error.log");

// Main variables
const debug = process.env.NODE_ENV !== "production" ?? false;
const devPort = process.env.DEV_PORT ?? 8000;
const baseDir = resolve("./");
const staticDir = resolve("./static");

// Load external modules
const logging = require("./logging");
const logger = new logging.Logger("dev");

// Static Files
app.use(express.static(staticDir));

// Middleware -------------------------------

// Template Engine
app.set("view engine", "pug");
app.set("views", resolve("./templates"));

// JSON - Uses Express's built-in JSON parser for requests
app.use(express.json());

// URL Encoded - Allows Express to use different types of requests
app.use(express.urlencoded({extended: true}));

// Logger - Logs all requests to server
function loggerMiddleware(
    request: express.Request,
    response: express.Response,
    next: NextFunction,
) {
    if (debug) logger.debug(`${request.method} [${response.statusCode}] ${request.url}`);
    next();
}
app.use(loggerMiddleware);

// Helmet - Adds security for HTTP requests
app.use(helmet());

// Cors - Allows access from other origins
app.use(cors());

// Compression - Compresses requests to make them faster
app.use(compression());

// ------------------------------------------
// Database Setup
async function setupPrisma(): Promise<PrismaClient> {
    try {
        const prisma = new PrismaClient();
        return prisma;
    } catch (err) {
        throw Error;
    }
}
const prisma = setupPrisma()
    .then(() => {
        logger.debug("Successfully connected to database");
    })
    .catch((err) => {
        logger.error("Could not create Prisma client: ", err);
    })
// Configuration for Prisma is found in prisma/schema.prisma

// ------------------------------------------

export {
    app,
    debug,
    logPath,
    devPort,
    logger,
    staticDir,
    baseDir,
    prisma,
};
