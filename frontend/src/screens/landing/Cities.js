import React from 'react'
import City from './City'
import Grid from '@material-ui/core/Grid';
import Button from '@material-ui/core/Button'
import ProductCarousel from '../../components/ProductCarousel';


function Cities() {
    return (
        <React.Fragment>
            <h1 style={{textAlign:'center',color:'#ff7d27'}}>Top Cities Of world</h1>
            <ProductCarousel />
            {/* <Grid container spacing={2}>
               {cities.map(city=><City key={city} city={city} />)}
            </Grid> */}
        </React.Fragment>
    )
}

export default Cities
