import React from 'react';
import MortgageForm from '../components/MortgageForm';
import MortgageDisplay from '../components/MortgageDisplay';

class MortgageContainer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      maxAmount: 0
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(data) {
    const yearlyCommittments = data.other * 12;
    const yearlySalaries = (data.salary1 + data.salary2) - yearlyCommittments;
    const max = data.deposit + (yearlySalaries * 3);
    this.setState({ maxAmount: max });
  }

  render() {
    return (
      <>
        <h1>Mortgage Calculator</h1>
        <MortgageForm onSubmit={this.handleSubmit} />
        <MortgageDisplay maxAmount={this.state.maxAmount} />
      </>
    );
  }
}

export default MortgageContainer;
