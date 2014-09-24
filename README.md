# Yalp
## Yelp Business Search App

This is an iOS demo application for displaying the search results from the Yelp API. It was built with Swift!

Time spent: 12(?) hours spent in total

#### Required stories
* [x] Table rows should be dynamic height according to the content height
* [x] Custom cells should have the proper Auto Layout constraints
* [x] Search bar should be in the navigation bar.
* [x] Filter page. Unfortunately, not all the filters are supported in the Yelp API.
* [x] The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
* [x] The filters table should be organized into sections as in the mock.
* [x] Radius filter should expand as in the real Yelp app
* [ ] Categories should show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
* [x] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.

#### Optional Stories
* [ ] infinite scroll for restaurant results
* [ ] Implement map view of restaurant results
* [ ] Implement the restaurant detail page.

### Walkthrough of all user stories:

![Video Walkthrough](demo.gif)

### Notes

GIF created with [LiceCap](http://www.cockos.com/licecap/).

Uses open source libraries: [AFNetworking][afnetworking] and [BDBOAuth1Manager][auth1manager].
