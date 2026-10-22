export function authorizeModification(req, res, next) {
    if (req.user.role != "parent" && (req.user.role == "child" && req.params.userId != req.user.id)) {
        res.status(403).send({ "error": "Access denied" });
        return;
    }
    else next();
}
