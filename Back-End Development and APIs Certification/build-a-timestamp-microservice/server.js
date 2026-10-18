import express from "express";
import cors from "cors";

const app = express();

app.use(cors({ optionsSuccessStatus: 200 }));

app.use(express.static("public"));

app.get("/", (_req, res) => {
  res.sendFile(import.meta.dirname + "/views/index.html");
});

// Do not change code above this line

app.use(express.urlencoded());

app.get("/api", (req, res) => {
  const date = new Date(Date.now());
  res.json({
    unix: date.getTime(),
    utc: date.toUTCString()
  });
});

app.get("/api/:date", (req, res) => {
  const date = new Date(isNaN(req.params.date) ? req.params.date : Number(req.params.date));
  if (date == "Invalid Date") throw new Error("Invalid Date");
  res.json({
    unix: date.getTime(),
    utc: date.toUTCString()
  });
});

app.use((err, req, res, next) => {
  res.json({ error: "Invalid Date" });
});

// Do not change code below this line

const PORT = 8000;
const listener = app.listen(PORT, function () {
  console.log("Your app is listening on port " + listener.address().port);
});
