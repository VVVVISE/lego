// @ts-ignore
import ApolloServer from "apollo-server";
// @ts-ignore
import gql from "gql";


const typeDefs = gql`
  type Query {
    message: String
  }
`;

const resolvers = {
  Query: {
    message: () => "Hello World!",
  },
};

const server = new ApolloServer({
  typeDefs,
  resolvers,
});
// @ts-ignore
server.listen().then(({ url }) => {
  console.log(`Server ready at ${url}`);
});
