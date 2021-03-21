const locations = [
  {
    name: 'Mumbai',
    image: '/images/mumbai.jpg',
    description: 'Mumbai is the capital city of the Indian state of Maharashtra. Mumbai is home to three UNESCO World Heritage Sites: the Elephanta Caves, Chhatrapati Shivaji Maharaj Terminus, and the city\'s distinctive ensemble of Victorian and Art Deco buildings. Mumbai is built on what was once an archipelago of seven islands: Isle of Bombay, Parel, Mazagaon, Mahim, Colaba, Worli, and Old Woman\'s Island (also known as Little Colaba). Mumbai is the financial, commercial, and the entertainment capital of India. The name Mumbai is derived from Mumbā or Mahā-Ambā—the name of the patron goddess (kuladevata) Mumbadevi meaning "mother" in the Marathi language, which is the mother tongue of and the official language of Maharashtra.',
    category: 'City',
    location: {
      type: 'Point',
      coordinates: [72.834705, 18.921836],
    },
    rating: 4,
    attractions: ['Fair', 'History', 'Beach'],
    specialities:['Marine Drive', 'Gateway of India'],
    food: ['Vada Pav'],
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
    description: 'The Taj Mahal \'Crown of the Palace\', is an ivory-white marble mausoleum on the southern bank of the river Yamuna in the Indian city of Agra. It was commissioned by Shah Jahan in 1631, to be built in the memory of his wife Mumtaz Mahal, who died on 17 June that year, while giving birth to their 14th child, Gauhara Begum. The Taj Mahal was designated as a UNESCO World Heritage Site in 1983 for being "the jewel of Muslim art in India and one of the universally admired masterpieces of the world\'s heritage".',
    category: 'Historical Place',
    location: {
      type: 'Point',
      coordinates: [78.0421, 27.1751],
    },
    rating: 4,
    attractions: ['History', 'Art'],
    specialities:['Shah Jahan', 'One of the seven wonders of the world'],
    food: ['North Indian'],
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
    description: 'Himalayas, Nepali Himalaya, great mountain system of Asia forming a barrier between the Plateau of Tibet to the north and the alluvial plains of the Indian subcontinent to the south. The Himalayas include the highest mountains in the world, with more than 110 peaks rising to elevations of 24,000 feet (7,300 metres) or more above sea level.',
    category: 'Mountains',
    location: {
      type: 'Point',
      coordinates: [83.931062, 28.598316],
    },
    rating: 4,
    attractions: ['History', 'Mountains'],
    specialities:['Tallest mountains', 'Cold'],
    food: ['North Indian'],
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
    description: 'The Sahyadris is a mountain range that covers an area of 160,000 square kilometres (62,000 sq mi) in a stretch of 1,600 kilometres (990 mi) parallel to the western coast of the Indian peninsula, traversing the states of Tamil Nadu, Kerala, Karnataka, Goa, Maharashtra and Gujarat. It is a UNESCO World Heritage Site and is one of the eight hot-spots of biological diversity in the world. It is sometimes called the Great Escarpment of India. It contains a very large proportion of the country\'s flora and fauna, many of which are only found in India and nowhere else in the world. The Western Ghats are older than the Himalayas.',
    category: 'Mountains',
    location: {
      type: 'Point',
      coordinates: [77.0667, 10.1667],
    },
    rating: 4,
    attractions: ['History', 'Mountains'],
    specialities:['Long mountain range'],
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
    description: 'The Juhu beach is a much admired beach in Mumbai. A very long beach that is surrounded by iconic hotels and residents of famous cine personalities.',
    category: 'Beaches',
    location: {
      type: 'Point',
      coordinates: [72.8773928, 19.0759899],
    },
    rating: 4,
    attractions: ['Beach', 'Art'],
    specialities:['Longest Beach in the world'],
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
    description: 'Jehangir Art Gallery is an art gallery in Mumbai founded by Sir Cowasji Jehangir at the urging of Homi Bhabha. It was constructed in 1952 and the entire cost of this mansion was donated by Cowasji Jehangir. It is situated at Kala Ghoda, just behind the Prince of Wales Museum, in South Mumbai near the Gateway of India. They have 4 exhibition halls. ',
    category: 'Art',
    location: {
      type: 'Point',
      coordinates: [72.8773928, 19.0759899],
    },
    rating: 4,
    attractions: ['History', 'Art'],
    specialities:['Jehangier', 'Artistic Masterpieces'],
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
