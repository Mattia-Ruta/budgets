import { pbkdf2Sync, randomBytes } from "crypto";


function generateHash(password: string): object {
    const salt = randomBytes(32).toString("hex");
    const hash = pbkdf2Sync(password, salt, 20000, 64, "sha512").toString("hex");
    return {
        hash: hash,
        salt: salt
    };
}

function isValidPassword(password: string, hash: string, salt: string): boolean {
    // Generates new hash using given password and compares to given hash
    const newHash = pbkdf2Sync(password, salt, 20000, 64, "sha512").toString("hex");
    return hash === newHash;
}

export {
    generateHash,
    isValidPassword,
}
