const locations = [
  {
    name: 'Mumbai',
    image: '/images/mumbai.jpg',
    description: 'City of mumbai, India',
    category: 'City',
    location: {
      type: 'Point',
      coordinates: [72.8347, 18.922],
    },
    rating: 4,
    attractions: ['Fair', 'History', 'Beach'],
    specialities: ['Marine Drive', 'Gateway of India'],
    food: ['Indian'],
    weather: {
      note: 'Slightly Sunny',
      temperature: '22 C',
    },
    reviews: [
      {
        name: 'John',
        rating: 4,
        comment: 'Good place to visit!',
      },
    ],
    address: {
      city: 'Mumbai',
      state: 'Maharashtra',
      country: 'India',
      zipcode: 123456,
    },
  },
  {
    name: 'Taj Mahal',
    image: '/images/tajmahal.jpg',
    description: 'Taj Mahal, Agra',
    category: 'Historical Place',
    location: {
      type: 'Point',
      coordinates: [78.0421, 27.1751],
    },
    rating: 4,
    attractions: ['History', 'Art'],
    specialities: ['Shah Jahan', 'One of the seven wonders of the world'],
    food: ['Indian'],
    weather: {
      note: 'Slightly Sunny',
      temperature: '22 C',
    },
    reviews: [
      {
        name: 'John',
        rating: 4,
        comment: 'Good place to visit!',
      },
    ],
    address: {
      city: 'Agra',
      state: 'Uttar Pradesh',
      country: 'India',
      zipcode: 123456,
    },
  },
  {
    name: 'Himalaya',
    image: '/images/himalaya.jpg',
    description: 'Himalayan mountains',
    category: 'Mountains',
    location: {
      type: 'Point',
      coordinates: [83.931062, 28.598316],
    },
    rating: 4,
    attractions: ['History', 'Mountains'],
    specialities: ['Tallest mountains', 'Cold'],
    food: ['Indian'],
    weather: {
      note: 'Slightly Sunny',
      temperature: '22 C',
    },
    reviews: [
      {
        name: 'John',
        rating: 4,
        comment: 'Good place to visit!',
      },
    ],
    address: {
      city: 'Mumbai',
      state: 'Maharashtra',
      country: 'India',
      zipcode: 123456,
    },
  },
  {
    name: 'Sahyadri',
    image: '/images/sahyadri.jpg',
    description: 'Sahyadri mountain range, Maharashtra',
    category: 'Mountains',
    location: {
      type: 'Point',
      coordinates: [77.0667, 10.1667],
    },
    rating: 4,
    attractions: ['History', 'Mountains'],
    specialities: ['Long mountain range'],
    food: ['Indian'],
    weather: {
      note: 'Slightly Sunny',
      temperature: '22 C',
    },
    reviews: [
      {
        name: 'John',
        rating: 4,
        comment: 'Good place to visit!',
      },
    ],
    address: {
      city: 'Sahyadri',
      state: 'Maharashtra',
      country: 'India',
      zipcode: 123456,
    },
  },
  {
    name: 'Juhu Beach',
    image: '/images/juhubeach.jpg',
    description: 'Juhu Beach, Mumbai',
    category: 'Beaches',
    location: {
      type: 'Point',
      coordinates: [72.8773928, 19.0759899],
    },
    rating: 4,
    attractions: ['Beach', 'Art'],
    specialities: ['Longest Beach in the world'],
    food: ['Indian'],
    weather: {
      note: 'Slightly Sunny',
      temperature: '22 C',
    },
    reviews: [
      {
        name: 'John',
        rating: 4,
        comment: 'Good place to visit!',
      },
    ],
    address: {
      city: 'Mumbai',
      state: 'Maharashtra',
      country: 'India',
      zipcode: 123456,
    },
  },
  {
    name: 'Jehangir Art Gallery',
    image: '/images/jehangirartgallery.jpg',
    description: 'Jehangir art gallery',
    category: 'Art',
    location: {
      type: 'Point',
      coordinates: [72.8773928, 19.0759899],
    },
    rating: 4,
    attractions: ['History', 'Art'],
    specialities: ['Jehangier', 'Artistic Masterpieces'],
    food: ['Indian'],
    weather: {
      note: 'Slightly Sunny',
      temperature: '22 C',
    },
    reviews: [
      {
        name: 'John',
        rating: 4,
        comment: 'Good place to visit!',
      },
    ],
    address: {
      city: 'Mumbai',
      state: 'Maharashtra',
      country: 'India',
      zipcode: 123456,
    },
  },
];

export default locations;
