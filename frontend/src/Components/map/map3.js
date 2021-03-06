import React, { useState } from 'react';
import { Icon } from "leaflet";
import { Map, TileLayer, Marker, CircleMarker, ZoomControl } from 'react-leaflet';
import { geolocated } from 'react-geolocated';
import ReactLeafletSearch from "react-leaflet-search";
import Routing from './RoutingMachine';
import '../../index.css';
import 'leaflet/dist/leaflet.css';

const DEFAULT_LATITUDE = 19.0760;
const DEFUALT_LONGITUDE = 72.8777;

function MyMap(props) {
  const pickUp = props.pU;
  const setPickUp = props.sPU;
  const isMapInit = props.mI;
  const setMapInit = props.sMI;

  const [map,setMap] = useState();

  const saveMap = (map) => {
    setMap(map);
  };

  const longitude = props.coords? props.coords.longitude:DEFUALT_LONGITUDE;
  const latitude = props.coords? props.coords.latitude:DEFAULT_LATITUDE;

  const customer = new Icon({
    iconUrl: 'https://icon-library.com/images/google-maps-person-icon/google-maps-person-icon-6.jpg',
    iconSize: [50, 50]
  });


  return (
    <React.Fragment>
      <Map center={[latitude, longitude]} zoom={12} ref={saveMap} zoomControl={false}>
      <TileLayer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
      attribution='&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors' />
      <ZoomControl position="bottomright" />
            
      {/* {!isDriver &&  */}
      <React.Fragment>
        {/* Customer */}
        <CircleMarker center={[pickUp.lat, pickUp.lng]} radius={100} />
        {/* Driver(s) */}
        {/* <Marker position={[pickUp.lat+0.03, pickUp.lng+0.03]} icon={driver} />
        <Marker position={[pickUp.lat-0.01, pickUp.lng-0.01]} icon={driver} /> */}
      </React.Fragment>
      {/* } */}

      {/* pickUp/Drop */}
      {/* {!isDriver && */}
      <React.Fragment>
        <ReactLeafletSearch 
        className="custom-style"
        position="topright" 
        provider="OpenStreetMap" 
        openSearchOnLoad={true} 
        inputPlaceholder="Location of Travel Destination"
        closeResultsOnClick={true}
        zoom={14}
        search={pickUp.info}
        showPopup={false}
        showMarker={true}
        markerIcon={customer}
        onChange={(e) => {
          setPickUp({address: e.info, lat: e.latLng.lat, lng: e.latLng.lng});
          // setStep((prev) => prev+1);
        }}
        />
        
      </React.Fragment>
      {/* } */}

      {/* {isDriver &&  */}
      <React.Fragment>
        <CircleMarker center={[pickUp.lat, pickUp.lng]} radius={100} />
        {/* <Marker position={[pickUp.lat, pickUp.lng]}/> */}
        {/* <Marker position={[drop.lat, drop.lng]} /> */}
      </React.Fragment>
      {/* } */}

      {/* Path */}
      {isMapInit && 
      <Routing map={map} pickUp={pickUp}/>}
      
    </Map>
    </React.Fragment>
  )
};

export default geolocated({
  positionOptions: {
    enableHighAccuracy: false,
  },
  userDecisionTimeout: 5000,
})(MyMap);