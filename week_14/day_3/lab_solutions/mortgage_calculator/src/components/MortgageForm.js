import React from 'react';

class MortgageForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      salary1: 0,
      salary2: 0,
      deposit: 0,
      other: 0
    }

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    const newState = {};
    newState[event.target.name] = parseInt(event.target.value);
    this.setState(newState);
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.onSubmit(this.state);
  }

  render() {
    return (
      <form>
        <div className="form_wrap">
          <label htmlFor="salary1">Your salary:</label>
          <input
            onChange={this.handleChange}
            min="0"
            step="1000"
            name="salary1"
            id="salary1"
            type="number"
            value={this.state.salary1} />
        </div>

        <div className="form_wrap">
          <label htmlFor="salary2">Your partner's salary:</label>
          <input
            onChange={this.handleChange}
            min="0"
            step="1000"
            name="salary2"
            id="salary2"
            type="number"
            value={this.state.salary2}/>
        </div>

        <div className="form_wrap">
          <label htmlFor="deposit">Your deposit:</label>
          <input
            onChange={this.handleChange}
            min="0"
            step="1000"
            type="number"
            id="deposit"
            name="deposit"
            value={this.state.deposit} />
        </div>

        <div className="form_wrap">
          <label htmlFor="other">Other monthly commitments:</label>
          <input
            onChange={this.handleChange}
            min="0"
            step="100"
            type="number"
            id="other"
            name="other"
            value={this.state.other} />
        </div>

        <input onClick={this.handleSubmit} type="submit" value="submit" />
      </form>
    );
  }
}

export default MortgageForm;
