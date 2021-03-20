import React from 'react'
import './css/landing.css'
import About from './About'
import Cities from './Cities'
function Landing() {
    return (
        <React.Fragment>
            
            <div class="fixed-side-navbar">
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link" href="#home"><span>Intro</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#services"><span>Services</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#portfolio"><span>Portfolio</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#our-story"><span>Our Story</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact-us"><span>Contact Us</span></a></li>
                </ul>
            </div>
            <About />
            <Cities />
        </React.Fragment>
    )
}

export default Landing
