import { buildSchema } from 'graphql';
import { UserSchema } from './user.js';

export default buildSchema(`
    ${UserSchema}

    type rootQuery {
        authUser(email: String!, password: String!): User!
        getUserProfile: User!
        getUsers: [User!]!
        getUserById(userId: ID!): User!
    }

    type rootMutation {
        registerUser(userInput: UserInput!): User!
        updateUserProfile(userInput: UpdateUserInput!): User!
        updateUser(userId: ID!, userInput: UpdateUserInput!): User!
        deleteUser(userId: ID!): String!
    }

    schema {
        query: rootQuery
        mutation: rootMutation
    }
`);
