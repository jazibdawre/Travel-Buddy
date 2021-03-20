import React from 'react'
import {useEffect} from 'react';
import {useState} from 'react'
import axios from 'axios';
import { Doughnut } from 'react-chartjs-2'
import { PieChart } from 'react-minimal-pie-chart';
import Highcharts from 'highcharts'
import HighchartsReact from 'highcharts-react-official'

function PieChartBuilder() {
    const ENDPOINT=`https://corona-api.com/countries`;
    let name="Afghanistan"
    const [countryData,setCountryData]=useState({});
    const [death,setDeath]=useState(null);
    const [confirmed,setConfirmed]=useState(null);
    const [recovered,setRecovered]=useState(null);
    const [critical,setCritical]=useState(null);

    let chartReference=null;

    useEffect(async ()=>{
          const resp=await axios.get(ENDPOINT);
          console.log(resp)
          const {data}=resp.data;
          console.log(data)
          const a=data.filter(d=>d.name==name);
          const {latest_data}=a[0];
          setCountryData(latest_data)
          setDeath(latest_data.deaths);
          setConfirmed(latest_data.confirmed);
          setRecovered(latest_data.recovered);
          setCritical(latest_data.critical);

          // for chart Js
          chartReference = React.createRef();
    
    },[]);
    
    const options = {
        title: {
          text: 'My chart'
        },
        chart: {
            type: 'pie'
        },
        series: [{
          data: [death,confirmed,recovered,critical]
        }]
      }
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
