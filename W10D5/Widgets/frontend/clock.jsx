import React from 'react';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: (new Date())
    }

    console.log(this.state.time);
  }
  render() {
    return (<h1>Hello</h1>);ç
    // console.log();
    // if (!this.state.time) return null;
    // return this.state.time;
  }
};