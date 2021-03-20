import Location from '../../models/locationModel.js';

// Ignore results with confidence score less than 7
// Populate category and brand once implemented
export const searchLocation = async (args, { req, redis }) => {
  const locs = await Location.fuzzySearch(args.searchTerm).populate('category');

  if (args.searchTerm) {
    return locs.filter((prod) => prod._doc.confidenceScore > 7);
  } else {
    return locs;
  }
};
