export const UserSchema = `
    type expense {
        cost: Float!
        details: String
        location: Location!
    }

    type User {
        _id: ID!
        name: String!
        phoneNo: String!
        email: String!
        password: String
        isAdmin: Boolean!
        token: String
        expenses: [expense!]
    }

    input expenseInput {
        cost: Float!
        details: String
        location: LocationInput!
    }

    input UserInput {
        name: String!
        phoneNo: String!
        email: String!
        password: String!
        isAdmin: Boolean
        expenses: [expenseInput!]
    }
    
    input UpdateUserInput {
        name: String
        phoneNo: String!
        email: String
        password: String
        isAdmin: Boolean
        expenses: [expenseInput!]
    }
`;
