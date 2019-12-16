console.log('app loaded')

document.addEventListener('DOMContentLoaded', () => {

  const title = document.querySelector('h1');
  title.textContent = 'Hello JavaScript!';

  const welcomeParagraph = document.querySelector('#welcome-paragraph');
  // console.log(welcomeParagraph);
  // console.dir(welcomeParagraph);

  const redElements = document.querySelectorAll('.red');
  // console.log(redElements);

  const redListItem = document.querySelector('li.red');
  redListItem.textContent = 'RED!!!';
  redListItem.classList.add('bold');

  const newListItem = document.createElement('li');
  newListItem.textContent = 'Purple';
  newListItem.classList.add('purple');

  console.log(newListItem);

  const list = document.querySelector('ul');

  list.appendChild(newListItem);

});
