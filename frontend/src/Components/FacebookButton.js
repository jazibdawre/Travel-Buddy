import React from 'react';
import ReactDOM from 'react-dom';
import FacebookLogin from 'react-facebook-login';

 
const FacebookButton = () => {

     
  
     
    return (
        <FacebookLogin
            appId="1088597931155576"
            autoLoad={true}
            fields="name,email,picture"
            callback={FacebookButton}
            cssClass="my-facebook-button-class"
            icon="fa-facebook"
        />
    );
}

export default FacebookButton;