import React from 'react'
import a from './img/1st-big-item.jpg'
import Card from '@material-ui/core/Card'
import Grid from '@material-ui/core/Grid'
import {makeStyles} from '@material-ui/core/styles';

const useStyles = makeStyles((theme) => ({
    root:{
        marginTop:'10px',
        marginLeft:'10%',
        border:'1px solid #ccc',
        width:'80%',
        backgroundColor:'#E9F0FC',
        display:'flex',
        flexDirection:'column',
        alignItems:'center',
        justifyContent:'center',
        [theme.breakpoints.down('sm')]:{
            marginLeft:'10%'
        }
    },
    img:{
        borderRadius:'50%',
        height:'100px',
        width:'100px',
        marginTop:'10px'
    },
    heading:{
        color:"#17a2b8",
        fontWeight:'bold'
    },
    linkStyle:{
        textDecoration:'none',
        color:"green"
    },
    subheading:{
        fontsize:'5px'
    }
 }));
function City({city}) {
    const classes=useStyles();
    return (
       <React.Fragment>
            <Grid item xs={12} sm={6} md={4}>
                <Card className={classes.root}>
                    <img src={a} alt="Profile Image" className={classes.img} />
                    <h1>Mumbai</h1>
                </Card>
            </Grid>       
       </React.Fragment>
    )
}

export default City
