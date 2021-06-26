import React, { useState, useEffect, useRef, useReducer } from "react";
import styled from "styled-components";
import { Bar } from 'react-chartjs-2';


class ChartContainer extends React.PureComponent {
  constructor(props) {
    super(props);  
  }

  render() {
    return (
      <Bar data={this.props.data} />
    )
  }
}

export default ChartContainer;
