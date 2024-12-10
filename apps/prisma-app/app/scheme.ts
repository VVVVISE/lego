import { buildSchemaSync } from "type-graphql";
import { FindManyUserResolver, FindUniqueUserResolver, UserRelationsResolver, CreateUserResolver, FindManyChannelResolver, CreateChannelResolver, ChannelRelationsResolver, PostCrudResolver } from "../generated/typegraphql-prisma";

export const schema = buildSchemaSync({
  "resolvers": [
    FindManyUserResolver,
    FindUniqueUserResolver,
    UserRelationsResolver,
    CreateUserResolver,
    FindManyChannelResolver,
    CreateChannelResolver,
    ChannelRelationsResolver,
    PostCrudResolver,
  ],
  "validate": false,
});
