import mongoose from 'mongoose';
import mongoose_fuzzy_searching from 'mongoose-fuzzy-searching';

const locationSchema = mongoose.Schema({
    name: { 
        type: String, 
        required: true 
    },
    rating: { 
        type: Number, 
        required: true 
    },
    description: {
        type: String,
        required: true
    },
    weatherType: {
        type: String,
        required: true
    },
    weatherTemperature: {
        type: String,
        required: true
    }
  }, {
    timestamps: true,
  }
);

locationSchema.plugin(mongoose_fuzzy_searching, {
  fields: [
    {
      name: 'name',
      minSize: 2,
      weight: 5,
    }
  ]
});

const Location = mongoose.model('Location', locationSchema);

export default Location;
