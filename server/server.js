import express from "express";
import mongoose from "mongoose";
import cors from "cors";
import dotenv from "dotenv";
import authRoutes from "./routes/authRoutes.js";

dotenv.config();

const app = express();
app.use(express.json());
app.use(cors());

// connect to Mongo
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log("MongoDB connected"));

// ⬇️ THIS LINE tells Express to use your routes
app.use("/", authRoutes);

app.listen(process.env.PORT, () => console.log(`Server running on port ${process.env.PORT}`));
