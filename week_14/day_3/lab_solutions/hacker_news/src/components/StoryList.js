import React from 'react';
import Story from './Story';

const StoryList = (props) => {
  const stories = props.stories.map((story, i) => {
    return (<Story key={i} details={story} position={i+1} />);
  });

  return (
    <ul>
      {stories}
    </ul>
  );
}

export default StoryList;
