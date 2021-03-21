import Location from '../../models/locationModel.js';
import User from '../../models/userModel.js';
import { admin, loggedin } from '../../utils/verifyUser.js';
import { axios } from 'axios';

const createLocation = async (args, req) => {
  try {
    if (admin(req)) {
      const location = new Location({
        name: args.locationInput.name,
        image: args.locationInput.image,
        address: args.locationInput.address,
        rating: args.locationInput.rating,
        description: args.locationInput.description,
        location: args.locationInput.location,
        weather: args.locationInput.weather,
        attractions: args.locationInput.attractions,
        specialities: args.locationInput.specialities,
        food: args.locationInput.food,
      });
      const res = await location.save();
      return res;
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

// get all locations
// cached
const getLocations = async (args, { req, redis }) => {
  try {
    const locations = await redis.get('locations:all');

    if (locations) {
      return JSON.parse(locations);
    } else {
      const locations = await Location.find({}).populate('category');

      if (locations) {
        redis.setex(
          'locations:all',
          process.env.SLOW_CACHE,
          JSON.stringify(locations)
        );
        return locations;
      } else {
        throw new Error('Location does not exist.');
      }
    }
  } catch (err) {
    throw err;
  }
};

// get all locations
// cached
const getmyLocations = async (args, { req, redis }) => {
  const users = await User.find({});

  const response = await axios({
    method: 'post',
    url: 'localhost:8000/predict',
    data: {
      user_id: users.findIndex((user) => {
        return user.id === req.user.id;
      }),
    },
  });

  if (response.error == 0) {
    const locations = await Location.find({});

    const recommendations = response.pred_ids.filter((pred_id) => {
      return locations[pred_id];
    });

    return recommendations;
  } else {
    throw new Error(response.message);
  }
};

// get location by category
// public
// cached
const getLocationByCategory = async (args, { req, redis }) => {
  try {
    const locations = await redis.get('category:locations:' + args.categoryId);

    if (locations) {
      return JSON.parse(locations);
    } else {
      const locations = await Location.find({
        category: args.categoryId,
      }).populate('category');

      if (locations) {
        redis.setex(
          'category:locations:' + args.categoryId,
          process.env.FAST_CACHE,
          JSON.stringify(locations)
        );
        return locations;
      } else {
        throw new Error('Location does not exist.');
      }
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

// get location by id
// public
// cached
const getLocationById = async (args, { req, redis }) => {
  try {
    const locations = await redis.get('locations:' + args.id);

    if (locations) {
      return JSON.parse(locations);
    } else {
      const locations = await Location.find({ _id: args.id }).populate(
        'category'
      );

      if (locations) {
        redis.setex(
          'location:' + args.id,
          process.env.FAST_CACHE,
          JSON.stringify(locations)
        );
        return locations;
      } else {
        throw new Error('Location does not exist.');
      }
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

// update location
// private/admin
const updateLocation = async (args, { req, redis }) => {
  try {
    if (admin(req)) {
      const location = await Location.findById(args.locationId);
      if (!location) {
        throw new Error('Location does not exist.');
      }

      const newUpdatedLocation = {
        name: args.locationInput.name,
        image: args.locationInput.image,
        address: args.locationInput.address,
        rating: args.locationInput.rating,
        description: args.locationInput.description,
        location: args.locationInput.location,
        weather: args.locationInput.weather,
        attractions: args.locationInput.attractions,
        specialities: args.locationInput.specialities,
        food: args.locationInput.food,
      };

      await Location.findByIdAndUpdate(args.locationId, {
        $set: newUpdatedLocation,
      });
      const updatedLocation = await Location.findById(args.locationId);
      return updatedLocation;
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

// delete location
// private/admin
const deleteLocation = async (args, { req, redis }) => {
  try {
    if (admin(req)) {
      const location = await Location.find({ _id: args.id });
      if (location) {
        await Location.deleteOne({ _id: location.locationId });
        const deleted = await Location.findByIdAndDelete(args.id);
        return { ...deleted._doc };
      } else {
        throw new Error('Location does not exist.');
      }
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

//add location review
//private/
const createLocationReview = async (args, req) => {
  try {
    if (loggedin(req)) {
      const location = await Location.findById(args.locationId);
      if (location) {
        let reviews = location[0].reviews;
        const review = {
          name: args.locationReview.name,
          rating: args.locationReview.rating,
          comment: args.locationReview.comment,
          user: args.locationReview.user,
        };
        reviews.push(review);
        const updatedLocation = {
          reviews: reviews,
        };
        await Location.findByIdAndUpdate(args.locationId, {
          $set: updatedLocation,
        });
        const newUpdatedLocation = await Location.findById(args.locationId);
        return newUpdatedLocation;
      }
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

//get location reviews
//public
const getLocationReviews = async (args) => {
  try {
    const location = await Location.findById(args.locationId);
    if (location) {
      const reviews = location[0].reviews;
      return reviews;
    }
  } catch (err) {
    console.log(err);
    throw err;
  }
};

export {
  createLocation,
  getLocations,
  getLocationByCategory,
  getLocationById,
  updateLocation,
  deleteLocation,
  createLocationReview,
  getLocationReviews,
  getmyLocations,
};
