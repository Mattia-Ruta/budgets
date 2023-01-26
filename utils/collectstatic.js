const fs = require("fs");
const path = require("path");
const { exit } = require("process");

const materializeDir = path.resolve("node_modules", "materialize-css", "dist");
const staticDir = path.resolve("static");

const files = [
    {
        src: path.join(materializeDir, "css", "materialize.css"),
        dist: path.join(staticDir, "css", "materialize.css")
    },
    {
        src: path.join(materializeDir, "js", "materialize.js"),
        dist: path.join(staticDir, "js", "materialize.js")
    }
];

async function collectStatic(obj) {
    let pCSS = new Promise((resolve, reject) => {
        fs.copyFile(obj.src, obj.dist, (err) => {
            if (err) reject(err);
            else resolve(`Copied ${obj.src} to ${obj.dist}`);
        });
    });

    pCSS
    .then((msg) => {
        console.log(msg);
    })
    .catch((err) => {
        console.error(err);
    });
};

files.map(
    (obj) => collectStatic(obj)
);
