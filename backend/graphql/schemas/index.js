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
        
        getLocations: [Location!]!
        getLocationByCategory(categoryId: ID!): [Location!]!
        getLocationById(id: ID!): [Location!]!
        deleteLocation(id: ID!): Location!
        getLocationReviews(locationId: ID!): [review]!

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

        createLocation(locationInput: LocationInput):  Location!
        updateLocation(locationId: ID!, updateLocation: updateLocation): Location!
        createLocationReview(locationId: ID!, review: reviewInput!): Location!
    }

    schema {
        query: rootQuery
        mutation: rootMutation
    }
`);
