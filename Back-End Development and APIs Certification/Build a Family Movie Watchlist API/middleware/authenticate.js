import jwt from "jsonwebtoken";

export function authenticate(req, res, next) {
    const atoken = req.headers.authorization;
    if (!atoken || !atoken.startsWith("Bearer ")) {
        res.status(401).json({ "error": "No token provided." });
        return;
    }
    const token = atoken.split(" ")[1];
    try {
        const p = jwt.verify(token, process.env.JWT_SECRET);
        req.user = p;
        next();
    } catch (e) {
        res.status(401).json({ "error": "Invalid or expired token." });
    }
}
