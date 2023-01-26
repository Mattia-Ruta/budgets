/**
 * Logging system
 *
 * This uses Winston as the core of logging
 */
export class Logger {
    public static winston = require("winston");

    // Default to dev mode - More verbose
    public mode: string = "dev";
    public logger;
    public winstonOptions = {
        level: "info",
        format: Logger.winston.format.json(),
        transports: [
            new Logger.winston.transports.File({filename: "../log/error.log", level: "error"}),
            //new winston.transports.File({filename: "combined.log"}),
        ]
    };

    // Console Colours
    public red = "\x1b[31m%s\x1b[0m";
    public green = "\x1b[32m%s\x1b[0m";
    public yellow = "\x1b[33m%s\x1b[0m";
    public blue = "\x1b[34m%s\x1b[0m";
    public cyan = "\x1b[36m%s\x1b[0m";

    public constructor(mode: string) {
        this.assignMode(mode ?? this.mode);
        this.logger = new Logger.winston.createLogger(this.winstonOptions);

        // Only in dev mode - Add console logging
        if (this.mode == "dev") {
            this.logger.add(
                new Logger.winston.transports.Console(
                    {format: Logger.winston.format.simple()}
                )
            );
        }
    }

    private assignMode(name: string): void {
        if (name == "prod") this.mode = "prod";
        else this.mode = "dev";
    }

    // Logging Levels - From lowest to highest level

    // [DEBUG] | Lowest level - Only used for debug in development
    public debug(message: string = ""): void {
        const log = `${new Date().toLocaleString()} [DEBUG] | ${message}`
        if (this.mode == "dev") {
            console.log(this.cyan, log);
        } else {
            this.logger.debug(log);
        }
    }

    // [INFO] | Low level - Used for general information
    public info(message: string = "") {
        const log = `${new Date().toLocaleString()} [INFO] | ${message}`;
        if (this.mode == "dev") {
            console.log(log);
        } else {
            this.logger.info(log);
        }
    }
}
