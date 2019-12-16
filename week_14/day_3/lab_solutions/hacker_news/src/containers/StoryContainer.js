import React from 'react';
import StoryList from '../components/StoryList';
import Filter from '../components/Filter';

class StoryContainer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      stories: [],
      filteredStories: []
    }

    this.filter = this.filter.bind(this);
  }

  componentDidMount() {
    fetch("https://hacker-news.firebaseio.com/v0/topstories.json")
      .then(res => res.json())
      .then((data) => {
        const newData = data.slice(0, 20);
        const promises = newData.map((id) => {
          return fetch(`https://hacker-news.firebaseio.com/v0/item/${id}.json`)
            .then(res => res.json());
        });

        Promise.all(promises)
          .then((results) => {
            this.setState({ stories: results, filteredStories: results });
          });
      });
  }

  filter(searchTerm) {
    const lowerSearch = searchTerm.toLowerCase();
    const filteredStories = this.state.stories.filter((story) => {
      story.title.toLowerCase().indexOf(lowerSearch) > -1;
    });
    this.setState({ filteredStories: filteredStories });
  }

  render() {
    return (
      <>
        <Filter handleChange={this.filter} />
        <StoryList stories={this.state.filteredStories} />
      </>
    )
  }
}

export default StoryContainer;
