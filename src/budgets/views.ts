import { PrismaClient } from "@prisma/client";
import express, { Request, Response } from "express";
//import Transaction from "./resources/transaction/transaction.model";
const router = express.Router();
const prisma = new PrismaClient();

// Main Budgets Page
router.get(
    "/",
    (req: Request, res: Response) => {
        const context = {
            title: "Lupo Budgets"
        }
        res.render("budgets/index", context);
    }
);

// Transactions | List
router.get(
    "/transactions",
    (req: Request, res: Response) => {
        // GET params /transactions?dateFrom="<dateFrom>",dateTo="<dateTo>"
        const _dateFrom = req.query.dateFrom as string;
        const _dateTo = req.query.dateTo as string;

        // Save date filters
        // TODO: Sanitise for strings etc
        const dateFrom = _dateFrom ? new Date(_dateFrom) : new Date("2000-01-01");
        const dateTo = _dateTo ? new Date(_dateTo) : new Date();
        res.send("Transactions!");
    }
)

// Transactions | Details
router.get(
    "/transactions/:transID",
    (req: Request, res: Response) => {
        const { transID } = req.params;
        
        // TODO: Create fetch logic to return a real result
        const result = true;

        if (result) res.end(`<h1>Transaction ${transID}</h1><br><p>Date: 20 October 2022</p>`);
        else res.status(404).json({message: `No transaction found with ID ${transID}`});
    }
);

// Transactions | Create
// router.post(
//     "/transactions/create",
//     async (req: Request, res: Response) => {
//         try {
//             const id = uuidv4();

//             const record = await Transaction.create({
//                 id,
//                 ...req.body
//             });
//             return res.json({
//                 success: true,
//                 msg: "Created record successfully"
//             });
//         } catch (err) {
//             console.log(err);
//             return res.json({
//                 success: false,
//                 msg: "Could not create record"
//             });
//         }
        
//     }
// );

module.exports = router;
