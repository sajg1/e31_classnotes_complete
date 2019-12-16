import React, { Component } from 'react';
import snd from "./sound";

class Metronome extends Component {
  constructor(props) {
    super(props);

    this.state = {
      bpm: 40,
      interval: null
    };

    this.handleChange = this.handleChange.bind(this);
    this.play = this.play.bind(this);
    this.stop = this.stop.bind(this);
  }

  componentDidUpdate(prevProps, prevState) {
    if ((prevState.bpm !== this.state.bpm) && this.state.interval) {
      this.stop();
      this.play();
    }
  }

  handleChange(event) {
    this.setState({ bpm: event.target.value });
  }

  play() {
    let timeInterval = (1000 * 60) / this.state.bpm;

    let interval = setInterval(() => {
      snd.play();
    }, timeInterval);

    this.setState({interval: interval});
  }

  stop() {
    clearInterval(this.state.interval);
    this.setState({ interval: null });
  }

  render() {
    return (
      <>
        <h1>Metronome</h1>
        <p><span className="bpm">{this.state.bpm}</span> bpm</p>
        <input
          type="range"
          min="40"
          max="120"
          step="1"
          value={this.state.bpm}
          onChange={this.handleChange}
        />
        <button onClick={this.play}>Play</button>
        <button onClick={this.stop}>Stop</button>
      </>
    );
  }
}

export default Metronome;
