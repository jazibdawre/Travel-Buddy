import { buildSchema } from 'graphql';
import { UserSchema } from './user.js';
import { CategorySchema } from './category.js';
import { LocationSchema } from './location.js';

export default buildSchema(`
    ${UserSchema}

    ${CategorySchema}

    ${LocationSchema}

    type rootQuery {
        authUser(email: String!, password: String!): User!
        getUserProfile: User!
        getUsers: [User!]!
        getUserById(userId: ID!): User!
        
        getCategories: [Category!]!

        searchLocation(searchTerm: String!): [Location!]!
    }

    type rootMutation {
        registerUser(userInput: UserInput!): User!
        updateUserProfile(userInput: UpdateUserInput!): User!
        updateUser(userId: ID!, userInput: UpdateUserInput!): User!
        deleteUser(userId: ID!): String!
        addExpenses(expenseInput: expenseInput!): User!
        
        createCategory(name: String!): Category!
        updateCategory(name: String!, newName: String!): Response!
        deleteCategory(name: String!): Response!
    }

    schema {
        query: rootQuery
        mutation: rootMutation
    }
`);
