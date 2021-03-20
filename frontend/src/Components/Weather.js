import React from 'react'
import ReactWeather, { useOpenWeather } from 'react-open-weather';

const Weather = ({location, name}) => {
  const { data, isLoading, errorMessage } = useOpenWeather({
    key: '35322ec02c2dd0be37a4311cce0e71b7',
    lat: location.lat,
    lon: location.lng,
    lang: 'en',
    unit: 'metric', // values are (metric, standard, imperial)
  });
   // console.log(location.lat);


  return (
      <ReactWeather
    
      isLoading={isLoading}
      errorMessage={errorMessage}
      data={data}
      lang="en"
      locationLabel={name}
      unitsLabels={{ temperature: 'C', windSpeed: 'Km/h' }}
      showForecast={true}
    />
  );
};

export default Weather;