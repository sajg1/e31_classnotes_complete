# Lab: Make an app with the Brewdog API

## Learning Objectives
- Practice implementing a Vue Router
- Practice making API requests alongside Vue Router
- Practice implementing Vue components as views

Your task is to build an app that uses [this API](https://punkapi.com/documentation/v2) to display information on a variety of beers.

[This endpoint](https://api.punkapi.com/v2/beers) will provide you with some data detailing multiple beers.

**It is important for this task you consider what your views will be, but also how you can reuse components to construct these different views.**

## MVP

Your app should be able to:

- Allow the user to view all the beers provided at `/beers`.
- Allow the user to mark beers as 'favourites'
- Allow the user to click on a link that will take them to `/favourites` - a page that displays their favourite beers.

## Extensions

- Ensure that the user cannot 'favourite' the same beer more than once.
- The endpoint provided will only return 20 beers at a time. Modify your initial request to fetch all 300+ beers the API provides.
