import {
  authUser,
  registerUser,
  getUserProfile,
  updateUserProfile,
  getUsers,
  deleteUser,
  getUserById,
  updateUser,
  addExpenses,
} from './user.js';

import {
  getCategories,
  createCategory,
  updateCategory,
  deleteCategory,
} from './category.js';

import {
  createLocation,
  getLocations,
  getLocationByCategory,
  getLocationById,
  updateLocation,
  deleteLocation,
  createLocationReview,
  getLocationReviews,
} from './location.js';

import { searchLocation, getNearby } from './search.js';

export default {
  //user
  authUser: authUser,
  registerUser: registerUser,
  getUserProfile: getUserProfile,
  updateUserProfile: updateUserProfile,
  getUsers: getUsers,
  deleteUser: deleteUser,
  getUserById: getUserById,
  updateUser: updateUser,
  addExpenses: addExpenses,
  //categories
  createCategory: createCategory,
  getCategories: getCategories,
  updateCategory: updateCategory,
  deleteCategory: deleteCategory,
  //locations
  createLocation,
  getLocations,
  getLocationByCategory,
  getLocationById,
  updateLocation,
  deleteLocation,
  createLocationReview,
  getLocationReviews,
  //search
  searchLocation: searchLocation,
  getNearby: getNearby,
};
