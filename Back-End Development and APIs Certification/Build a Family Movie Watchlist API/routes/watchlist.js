import express from "express";
import path from "path";
import { authorizeModification } from "../middleware/authorize.js";
import { authenticate } from "../middleware/authenticate.js";
import fs from "fs";

const router = express.Router();
const __dirname = import.meta.dirname;


router.get("/:userId", authenticate, (req, res) => {
    const data = JSON.parse(fs.readFileSync(path.join(__dirname, "../data/watchlists.json"), "utf-8"));
    res.status(200).json(data[req.params.userId]);
});

router.post("/:userId/movies", authenticate, authorizeModification, (req, res) => {
    const data = JSON.parse(fs.readFileSync(path.join(__dirname, "../data/watchlists.json"), "utf-8"));
    const d = data[req.params.userId];
    const id = d[d.length - 1].id + 1;
    d.push({...req.body, id, "watched": false });
    fs.writeFileSync(path.join(__dirname, "../data/watchlists.json"), JSON.stringify(data, null, 4));
    res.status(201).json({ "message": "Added" });
});

router.put("/:userId/movies/:movieId", authenticate, authorizeModification, (req, res) => {
    const data = JSON.parse(fs.readFileSync(path.join(__dirname, "../data/watchlists.json"), "utf-8"));
    const d = data[req.params.userId];
    const index = d.findIndex(i => i.id == req.params.movieId);
    d[index] = {...d[index], ...req.body};
    fs.writeFileSync(path.join(__dirname, "../data/watchlists.json"), JSON.stringify(data, null, 4));
    res.status(200).json({ "message": "Updated" });
});

router.delete("/:userId/movies/:movieId", authenticate, authorizeModification, (req, res) => {
    const data = JSON.parse(fs.readFileSync(path.join(__dirname, "../data/watchlists.json"), "utf-8"));
    const d = data[req.params.userId];
    const index = d.findIndex(i => i.id == req.params.movieId);
    d.splice(index, 1);
    fs.writeFileSync(path.join(__dirname, "../data/watchlists.json"), JSON.stringify(data, null, 4));
    res.status(200).json({ "message": "Deleted" });
});

export default router;