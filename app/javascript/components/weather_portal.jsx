import React, { useState, useEffect, useRef, useReducer } from "react";
import styled from "styled-components";
import moment from 'moment'
import axios from 'axios'
import { Bar } from 'react-chartjs-2';
import ChartContainer from './chart_container'

const WeatherPortalContainer = styled.div`
  margin: 20px 0;
  display: flex;
  align-items: center;
  jusitfy-content: center;
  flex-direction: column;
`;

const InputWrapper = styled.div`
  margin: 10px;
`

const WeatherForm = styled.form`
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100%;
`

const InputLabel = styled.label`
  padding: 0 5px 0 0;
`;

class WeatherPortal extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedDate: "01/07/2020",
      minTemp: 62,
      maxTemp: 75,
      chartData: 
        {
          labels: "Port of Portland HVAC System Usage",
          datasets: []
        },
      };
      this.getChartData = this.getChartData.bind(this)
      this.processData = this.processData.bind(this)
      this.handleInputChange = this.handleInputChange.bind(this)
  }

  componentDidMount() {
    this.processData(this.props.data)
  }

  processData(data) {
    var entries = Object.entries(data)
    console.log(data)
    var chartData = {
      labels: ["Port of Portland"],
      title: "Port of Portland",
      datasets: [
          {
            label: "Nothing",
            data: [0],
            backgroundColor: ["#519acc"]
          },
        ]
      }
    chartData.datasets = []
    chartData.datasets.push(
      {
        label: "# of days heat used",
        data: [entries[2][1]],
        categoryPercentage: 1,
        barPercentage: .3,
        backgroundColor: ["#ff0000"]
      }
    )
    chartData.datasets.push(
      {
        label: "# of days cooling used",
        data: [entries[3][1]],
        categoryPercentage: 1,
        barPercentage: .3,
        backgroundColor: ["#519acc"]
      }
    )
  this.setState({chartData: chartData})
  }

  getChartData(e) {
    e.preventDefault()
    var url = `/weather?date_time=${this.state.selectedDate}&min_temp=${this.state.minTemp}&max_temp=${this.state.maxTemp}`
    axios.get(url, {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    })
    .then((res)=>{
      this.processData(res.data)
    })
    .catch((err)=>console.error(err))
  }

  handleInputChange(e) {
    var name = e.target.name
    this.setState({[name] : e.target.value })
  }

  render() {
  return (
    <WeatherPortalContainer>
      <p>Weather Portal</p>
      <div style={{display: "flex", width: "90%", padding: 50}}>
        <div style={{flex: .5}}>
          <WeatherForm onSubmit={this.getChartData}>
           <InputWrapper>
              <InputLabel htmlFor="minTemp">Maximum Temperature:</InputLabel>
              <input
                type="number"
                value={this.state.maxTemp}
                name="maxTemp"
                onChange={this.handleInputChange}
              />
            </InputWrapper>
            <InputWrapper>
              <InputLabel htmlFor="minTemp">Minimum Temperature:</InputLabel>
              <input
                type="number"
                value={this.state.minTemp}
                name="minTemp"
                onChange={this.handleInputChange}
              />
            </InputWrapper>
            <InputWrapper>
              <InputLabel htmlFor="minTemp">Selected Month:</InputLabel>
              <select 
                name="month" 
                id="month" 
                onChange={this.handleInputChange}
                value={this.state.selectedDate}
                name="selectedDate">
                <option value="01/06/2020">June 2020</option>
                <option value="01/07/2020">July 2020</option>
              </select>
            </InputWrapper>
            <button onClick={this.getChartData} type="submit">Submit</button>
          </WeatherForm>
        </div>
        <div style={{flex: .5}}>
          <ChartContainer data={this.state.chartData} />
        </div>
      </div>
    </WeatherPortalContainer>
  );
  }
}

export default WeatherPortal;
