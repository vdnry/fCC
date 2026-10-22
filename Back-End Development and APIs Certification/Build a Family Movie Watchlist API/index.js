import express from "express";
import helmet from "helmet";
import jwt from "jsonwebtoken";

import watchlistRoutes from "./routes/watchlist.js";
import { findByUsername } from "./utils/db.js";
import { authenticate } from "./middleware/authenticate.js";

const PORT = process.env.PORT;
const app = express();

app.use(helmet());
app.use(express.json());

app.get("/", (req, res) => {
  res.send("Family Movie Watchlist API");
});

app.use("/api/watchlist", authenticate, watchlistRoutes);
app.post("/api/auth/login", (req, res) => {
  const { username, password } = req.body;
  const user = findByUsername(username);
  if (!username || !password) res.status(400).json({ "message": "Credentials missing" });
  else if (!user) res.status(401).json({ "message": "Invalid credentials" });
  else if (user._password != password) res.status(401).json({ "message": "Invalid credentials" });
  else res.status(200).json({ "token": jwt.sign({ username, "id": user.id, "role": user.role }, process.env.JWT_SECRET) })
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}...`);
});
