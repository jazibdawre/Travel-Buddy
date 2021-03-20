export const LocationSchema = `
    type location {
        type: String!
        coordinates: [Float!]!
    }

    type weather {
        note: String!
        temperature: String!
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
        weather: weather!
        reviews: [Review!]!
    }

    input locationInput {
        type: String!
        coordinates: [Float!]!
    }

    input weatherInput {
        note: String!
        temperature: String!
    }

    input LocationInput {
        name: String!
        image: String!
        brand: String!
        category: ID!
        keywords: [String!]!
        description: String!
        location: locationInput!
        weather: weatherInput!
        reviews: [ReviewInput!]!
    }

    input updateLocation {
        name: String!
        image: String!
        brand: String!
        category: ID!
        keywords: [String!]!
        description: String!
        location: locationInput!
        weather: weatherInput!
        reviews: [ReviewInput!]!
    }
`;
