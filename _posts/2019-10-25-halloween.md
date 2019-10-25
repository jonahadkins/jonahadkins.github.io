---
layout: post
title:  "This Is Halloween"
date:   2019-10-25
categories: [cartography, tangram, here]
---
<hr>  

tl;dr - Visit [This is Halloween](https://heremaps.github.io/developer-blog/this-is-halloween/)  

<hr>  

![progress0]({{ site.url }}/static/projects/helloween_lc.gif)  

<hr>

According to the National Retail Federation (NRF), around [3.2 billion](https://nrf.com/insights/holiday-and-seasonal-trends/halloween) is spent on Halloween costumes annually. Diving further into that number, [1/3 of that](https://nrf.com/insights/holiday-and-seasonal-trends/halloween/halloween-data-center) spending will take place at a brick & mortar (not online, a physical location). Traditional retailers like Target, Wal-Mart, Party City and others offer a popular selection of costumes, but for **the right** costume, a discerning shopper heads to the pop-up shop.

Costume Pop-up shops are an interesting concept that breathes new (but temporary) life into the abandoned, dead, and closed medium and big-box stores across the country. Have an old Toys-R-Us or Circuit City near you? Chances are it will be occupied by a costume pop-up shop after Labor Day. For the 2 main retailers, Halloween City and Spirt Halloween Costumes, it's a great model to capitalize on the spirit of the season. Digging in to [Spirit's website](https://www.spirithalloween.com/content.jsp?pageName=RealEst), it reads like a problem from a GIS textbook.

```
Spirit is ideally looking for temporary 3 MONTH leases that include a kick-out clause
(should the landlord secure a permanent deal by June). Since Spirit locations open on or
about Labor Day and remain open through November 1st, our ideal lease would run from August
1st through mid-November. To achieve this, we scour the country, making our site selections
from January through August. We like to locate our stores in power centers, strip centers,
free-standing stores, major downtown retail locations and in major malls surrounded by a
national retailer mix. Our aim is to set up in communities that have 1) a population of
approximately 35,000+, 2) living within a 3-5 mile radius, and 3) with a car count of at
least 25,000 cars per day. Our flexibility is key! While our ideal locations feature between
5,000 to 50,000 square feet of sales floor space with awesome visibility, no store is too
large (or too small). We can even adapt to a space with as little as 3,000 square feet.
```

If you can't tell by now, I've become really interested in this - or has my friend [Katie](https://twitter.com/KatieKowalsky) eloquently said:
>"...the ephemeral nature of these stores combined with the prolonged death of brick and mortar shops makes this a fascinating and uniquely american-phenomenon.."

## Source Data
You guessed it, the store location data was not readily available. I messed around with [Postman](www.getpostman.com), a cool desktop program/gui that lets you build API queries - ultimately the APIs on both costume sites, weren't *true* APIs. [Ian](https://twitter.com/iandees) reminded me about [All The Places](https://www.alltheplaces.xyz), an awesome tool that lets you add websites to a scraper that in turn gathers the relevant location data. We used All The Places for store locations during the [Detroit Mapathon](https://www.openstreetmap.us/2018/08/mapping-challenge2/) at the 2018 State of the Map US. It worked great then, and worked great this time when adding both costume retailers to it.

## XYZ
To host and store the store locations, I used XYZ Hub. Hub (part of the [XYZ series](https://developer.here.com/products/xyz) of mapping tools from HERE ) is cloud storage and hosting for your data. You can basically can bring your own data, and have programmatic access to it through other XYZ tools (like Studio) or through other mapping libraries (like Leaflet).

<hr>  

![progress0]({{ site.url }}/static/projects/helloween_xyz.png)  

<hr>

After loading the store data in Hub, I was able to access it in XYZ Studio, which allowed me to quickly visualize what the data looked like, both tabular-ly and spatially. [This map](https://xyz.here.com/viewer/?project_id=861ffdbb-b68e-4860-ba22-94c180a430ad) is a quick example of what I did with XYZ Studio - I was able to customize the point styling, what attributes were shown on hover and pop-up, and the background basemap. It's great, but I **LOVE** Halloween and wanted to spook it up a bit.

## Tangram

[In a previous post](https://www.jonahadkins.com/esri/cartography/openstreetmap/2019/03/28/esri-tangrams.html), I used Tangram to visualize Esri vector tiles. Since then, I've used it for some large basemap creation projects and absolutely fell in love. While it lacks the clicki-ness of most GUI based style editors, the killer feature for me are the functions. Similar to the filter and expression parts of the Mapbox Style Spec, functions let you pretty much do anything to your layer.

<hr>  

![progressa]({{ site.url }}/static/projects/helloween.gif)  

<hr>

A function on a layer might include something like this to get all the major roads and anything that starts with the word secondary in the kind column:

{% highlight yaml %}
function() {return (feature.kind == 'major_road' && feature.kind_detail.startsWith('secondary'))}
{% endhighlight %}  

or something like this to only label names less than 6 characters:

{% highlight yaml %}
function() { return feature.name.length < 6}
{% endhighlight %}

All of this is done in a yaml based editor. To up the creepiness, I went with Haunted Mansion themed purples/greens with Pac-man themed teal & pink highlights. Creepster and Averia Gruesa fonts add the right amount eeriness, while still being readable. Some hidden treats await those who zoom in.

## Leaflet

To put it all together and add additional haunts, I used [Leaflet](https://leafletjs.com) with [Tangram](https://github.com/tangrams/tangram) as the main plugin to load my scene yaml. Some magic in there allows us access our data and attributes all the way from XYZ Hub.

{% highlight javascript %}

events: {
  click: function(selection) {
    if (selection.feature) {
      document.getElementById('info').innerHTML =
        "<font size='3'>" +
        "<img src=" + selection.feature.properties.logo + ">" + "</br>" +
        selection.feature.properties.addr_full + "</br>" +
        selection.feature.properties.addr_city + "," +
        selection.feature.properties.addr_state + "</br>" +
        "<a href=" + selection.feature.properties.website + ' " target="_blank" ' + ">" + "Store Link</a>" +
        "</font>"
    } else {
      document.getElementById('info').innerHTML =
        "<font size='5'>" +
        "select a ghost" + "</br>" +
        "let the points respond" + "</br>" +
        "look for a message" + "</br>" +
        "from regions beyond" +
        "</font>"
    }
{% endhighlight %}

I had a lot of fun making this map :) .

To get geo-location to the user's device, [Leaflet Locate Control](https://github.com/domoritz/leaflet-locatecontrol) is quick and easy plugin with good options for customization. To allow the user to enter places and addresses, the [Leaflet Geocoder Control](https://github.com/perliedman/leaflet-control-geocoder) was added using the HERE Gecocode API. This was a no-brainer since I've got existing developer access keys under my XYZ Freemium account.


The nice folks at HERE have also featured this project on their [Developer Blog](https://developer.here.com/blog/find-all-the-popup-halloween-stores-with-this-handy-map) or [visit the map directly at:](https://heremaps.github.io/developer-blog/this-is-halloween/)

<hr>

![progressc]({{ site.url }}/static/projects/halloween.gif)
<hr>

Special thanks to Ian, Katie, and Phil for help during various stages of this project.

Got questions or comments? Feel free to [email me](mailto:jonahadkins@gmail.com) or hit me up on [twitter](https://twitter.com/jonahadkins).
