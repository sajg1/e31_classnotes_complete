import React from 'react';

class RepaymentCalculator extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      interestRate: 3.0,
      term: 20
    };

    this.handleChange = this.handleChange.bind(this);
    this.calculateMonthly = this.calculateMonthly.bind(this);
    this.calculateMonthly = this.calculateMonthly.bind(this);
  }

  handleChange(event) {
    const newState = {};
    newState[event.target.name] = event.target.value;
    this.setState(newState);
  }

  calculateMonthly() {
    const principal = this.props.amount;
    const monthly_interest = (this.state.interestRate / 100) / 12;
    const number_of_payments = this.state.term * 12;

    const numerator = (monthly_interest * Math.pow(1 + monthly_interest, number_of_payments));
    const denominator = Math.pow(1 + monthly_interest, number_of_payments) - 1;

    const monthly_payments = principal * (numerator / denominator);

    return parseInt(monthly_payments);
  }

  render() {
    return (
      <form>
        <div className="form_wrap">
          <label htmlFor="interestRate">Interest Rate %:</label>
          <input
            onChange={this.handleChange}
            name="interestRate"
            id="interestRate"
            type="number"
            min="0"
            step="0.1"
            value={this.state.interestRate}
          />
        </div>

        <div className="form_wrap">
          <label htmlFor="term">Term in years:</label>
          <input
            onChange={this.handleChange}
            name="term"
            id="term"
            type="range"
            min="1"
            max="30"
            value={this.state.term}
          />
        </div>

        <p>
          At {this.state.interestRate}%, over {this.state.term} year{this.state.term > 1 ? "s":""},your monthly payments will be around £{this.calculateMonthly()}.
        </p>
      </form>
    );
  }
}

export default RepaymentCalculator;
