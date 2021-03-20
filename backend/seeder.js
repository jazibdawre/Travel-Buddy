import dotenv from 'dotenv';
import users from './data/users.js';
import categories from './data/categories.js';
import locations from './data/locations.js';
import User from './models/userModel.js';
import Location from './models/locationModel.js';
import Category from './models/categoryModel.js';

import connectDB from './config/db.js';

dotenv.config();

connectDB();

const importData = async () => {
  try {
    await Location.deleteMany();
    await Category.deleteMany();
    await User.deleteMany();

    const createdUsers = await User.insertMany(users);
    const createdCategory = await Category.insertMany(categories);

    const adminUser = createdUsers[0]._id;

    const sampleLocations = await Promise.all(
      locations.map(async (location) => {
        const locationCategory = await Category.find({
          name: location.category,
        });

        return {
          ...location,
          category: locationCategory[0]._id,
        };
      })
    );

    await Location.insertMany(sampleLocations);

    console.log('Data Imported!'.green.inverse);
    process.exit();
  } catch (error) {
    console.error(`${error}`.red.inverse);
    process.exit(1);
  }
};

const destroyData = async () => {
  try {
    await Category.deleteMany();
    await Location.deleteMany();
    await User.deleteMany();

    console.log('Data Destroyed!'.red.inverse);
    process.exit();
  } catch (error) {
    console.error(`${error}`.red.inverse);
    process.exit(1);
  }
};

if (process.argv[2] === '-d') {
  destroyData();
} else {
  importData();
}
