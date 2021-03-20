import mongoose from 'mongoose';
import mongoose_fuzzy_searching from 'mongoose-fuzzy-searching';

const reviewSchema = mongoose.Schema(
  {
    name: { type: String, required: true },
    rating: { type: Number, required: true },
    comment: { type: String, required: true },
    user: {
      type: mongoose.Schema.Types.ObjectId,
      required: true,
      ref: 'User',
    },
  },
  {
    timestamps: true,
  }
);

const locationSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
    rating: {
      type: Number,
      required: true,
      default: 0,
    },
    category: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Category',
    },
    keywords: [String],
    description: {
      type: String,
      required: true,
    },
    location: {
      type: { type: String, default: 'Point' },
      coordinates: [],
    },
    weather: {
      note: {
        type: String,
        required: true,
      },
      temperature: {
        type: String,
        required: true,
      },
    },
    reviews: [reviewSchema],
  },
  {
    timestamps: true,
  }
);

// For geospatial processing
productSchema.index({ location: '2dsphere' });

locationSchema.plugin(mongoose_fuzzy_searching, {
  fields: [
    {
      name: 'name',
      minSize: 2,
      weight: 5,
    },
  ],
});

const Location = mongoose.model('Location', locationSchema);

export default Location;
