import React from 'react'
import {useEffect} from 'react';
import {useState} from 'react'
import axios from 'axios';
import { Doughnut } from 'react-chartjs-2'
import { PieChart } from 'react-minimal-pie-chart';
import Highcharts from 'highcharts'
import HighchartsReact from 'highcharts-react-official'
import corona from './Corona';

let name="Afghanistan"
const {data} =corona;
const a=data.filter(d=>d.name==name);
const {latest_data}=a[0];
console.log(latest_data)


function PieChartBuilder() {
    const ENDPOINT=`https://corona-api.com/countries`;
    let name="Afghanistan"
    const [countryData,setCountryData]=useState({});
    const [death,setDeath]=useState(null);
    const [confirmed,setConfirmed]=useState(null);
    const [recovered,setRecovered]=useState(null);
    const [critical,setCritical]=useState(null);
    
    
    const options = {
        title: {
          text: 'My chart'
        },
        chart: {
            type: 'pie'
        },
        series: [{
          data: [latest_data.deaths,latest_data.critical,latest_data.confirmed,latest_data.recovered]
        }]
      }
      console.log(death)
    return (
        <React.Fragment>
             <HighchartsReact
                highcharts={Highcharts}
                options={options}
             />
             
        </React.Fragment>
    )
}

export default PieChartBuilder
