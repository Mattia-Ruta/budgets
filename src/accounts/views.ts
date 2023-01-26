import express from "express";
import { Logger } from "../core/logging";
const router = express.Router();

router.get(
    "/login",
    (req, res, next) => {
        res.send("login response");
    }
);

router.get(
    "/logout",
    (req, res, next) => {
        res.send("Logout response");
    }
);

router.get(
    "/register",
    (req, res, next) => {
        res.render("accounts/register.pug");
    }
)

module.exports = router;
