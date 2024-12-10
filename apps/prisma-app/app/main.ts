import "reflect-metadata";
import express from "express";
import { graphqlHTTP } from "express-graphql";
import { schema } from "schema";
import { prisma } from "context";

const app = express();
app.use("/graphql", graphqlHTTP(async (request) => ({
  schema,
  "context": {prisma, request},
})));
app.listen(9000);

console.log("http://localhost:9000/graphql");
