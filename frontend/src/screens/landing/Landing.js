import React from 'react'
import './css/landing.css'
import About from './About'
import Cities from './Cities'
import Footer from '../../components/Footer';


function Landing() {
    return (
        <React.Fragment>
            <About />
            <Cities />
            <div style={{marginTop:'20px'}}></div>
        </React.Fragment>
    )
}

export default Landing
