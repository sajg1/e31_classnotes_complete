import React, { useState, useEffect} from 'react';

export default function App(){

  const [post, setPost] = useState({})
  const [id, setId] = useState(1)
  const [windowSize, setWindowSize] = useState(window.innerWidth)

  useEffect(() => {
    getPost()
    window.addEventListener('resize', handleWindowResize)

    return () => window.removeEventListener('resize', handleWindowResize);

  }, [id])

  const handleWindowResize = () => {
    setWindowSize(window.innerWidth)
  }

  const getPost = () => {
    console.log('fetching');
    fetch(`http://jsonplaceholder.typicode.com/posts/${id}`)
    .then(res => res.json())
    .then(res => setPost(res))
  }

  return (
    <>
    <h2>{post.title}</h2>
    <p>{post.body}</p>
    <button onClick={() => setId(id + 1)}>Next Post</button>

    <p>{windowSize < 420 ? 'phone' : 'desktop'}</p>
    </>
  );
}
