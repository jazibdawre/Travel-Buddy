import Category from '../../models/categoryModel.js';
import { loggedin, admin } from '../../utils/verifyUser.js';

// Category
const createCategory = async (args, { req, redis }) => {
  try {
    if (admin(req)) {
      const { name } = args;

      const resp = await Category.find({ name: name });

      if (resp.length === 0) {
        const newCategory = new Category({
          name: name,
        });
        const res = newCategory.save();
        return res;
      } else {
        throw new Error('Category already exists');
      }
    }
  } catch (err) {
    throw err;
  }
};

// cached
const getCategories = async (args, { req, redis }) => {
  try {
    const categories = await redis.get('category:all');

    if (categories) {
      return JSON.parse(categories);
    } else {
      const categories = await Category.find({});
      redis.setex(
        'category:all',
        process.env.SLOW_CACHE,
        JSON.stringify(categories)
      );
      return categories;
    }
  } catch (err) {
    throw err;
  }
};

const updateCategory = async (args, { req, redis }) => {
  try {
    if (admin(req)) {
      const { name, newName } = args;

      let updatedCategory = {
        name: newName,
      };
      updatedCategory = { $set: updatedCategory };

      await Category.update({ name: name }, updatedCategory).exec();

      return { msg: 'success' };
    }
  } catch (err) {
    throw err;
  }
};

const deleteCategory = async (args, { req, redis }) => {
  try {
    if (admin(req)) {
      const { name } = args;

      await Category.deleteOne({ name: name });

      return { msg: 'success' };
    }
  } catch (err) {
    throw err;
  }
};

export { getCategories, createCategory, updateCategory, deleteCategory };
