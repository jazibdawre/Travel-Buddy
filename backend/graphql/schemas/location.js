export const LocationSchema = `
    type location {
        type: String!
        coordinates: [Float!]!
    }

    type weather {
        note: String!
        temperature: String!
    }

    type review {
        name: String!,
        rating: Int!,
        comment: String!,
        user: ID!,
    }

    type Location {
        _id: ID!
        name: String!
        image: String!
        rating: Number
        category: Category!
        keywords: [String!]!
        description: String!
        location: location!
        attractions: [String!]
        food: [String!]
        weather: weather!
        reviews: [review!]!
    }

    input locationInput {
        type: String!
        coordinates: [Float!]!
    }

    input weatherInput {
        note: String!
        temperature: String!
    }

    input reviewInput {
        name: String!,
        rating: Int!,
        comment: String!,
        user: ID!,
    }

    input LocationInput {
        name: String!
        image: String!
        brand: String!
        category: ID!
        keywords: [String!]!
        description: String!
        location: locationInput!
        attractions: [String!]
        food: [String!]
        weather: weatherInput!
        reviews: [reviewInput!]!
    }

    input updateLocation {
        name: String!
        image: String!
        brand: String!
        category: ID!
        keywords: [String!]!
        description: String!
        location: locationInput!
        attractions: [String!]
        food: [String!]
        weather: weatherInput!
        reviews: [reviewInput!]!
    }
`;
