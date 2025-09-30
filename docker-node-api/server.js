import express from "express";
const app = express();
app.get("/", (req, res) => res.json({ message: "Hello from Node API in Docker 🐳" }));
app.listen(3000, () => console.log("API on :3000"));