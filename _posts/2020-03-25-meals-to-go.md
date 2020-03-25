---
layout: post
title:  "Meals To Go #covid-19"
date:   2020-03-25
categories: [cartography, mapbox]
---
<hr>  

tl;dr - Visit [Meals-to-Go Service](https://www.jonahadkins.com/school-meals/)  

<hr>  

![mtg]({{ site.url }}/static/projects/mtg.gif)  

<hr>

Welp. Here in Virginia, school has been cancelled.......  

....  
...  
..  
.  
.. and my kids are so bummed about it.

On social media and emails, I was seeing bulleted *LISTS* of places local kids can get school provided meals during this time. With several different school districts each providing meals, several different ways, it seemed obvious enough to make one map of each school's offerings.

Using the [Mapbox Store Locator](https://docs.mapbox.com/help/tutorials/building-a-store-locator/#getting-started) template, I was quickly able get a navigable list/map of each schools service locations. The template turned what couldve been days of effort into a few short hours. Most of the time here was spent creating a `.geojson` file of all the locations. Each school provided a static list, sometimes with addresses, most of the time not - just a place name. Keeping it simple, all I've done to the template is apply some different colors, a different icon, and links to each schools meal service information page. Big thanks to Mapbox for making this template easy to use and freely available.

<hr>
Got questions or comments? Feel free to [email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins).
