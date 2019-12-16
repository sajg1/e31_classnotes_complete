import React from 'react';

class Filter extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    event.preventDefault();
    this.setState({ searchTerm: event.target.value });
  }

  componentDidUpdate(prevProps, prevState) {
    if (prevState.searchTerm !== this.state.searchTerm) {
      this.props.handleChange(this.state.searchTerm);
    }
  }

  handleSubmit(event) {
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input
          onChange={this.handleChange}
          type="text"
          name="searchTerm"
          placeholder="Filter Stories"
          value={this.state.searchTerm} />
      </form>
    );
  }
}

export default Filter;
