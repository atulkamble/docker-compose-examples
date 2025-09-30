import express from "express";
const app = express();
app.get("/", (_,res)=>res.json({ api:"ok", msg:"Hello from API" }));
app.listen(3000, ()=>console.log("API on :3000"));