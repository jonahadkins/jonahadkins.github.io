---
layout: post
title: bridges of america
date: 2016-03-22
description: learning all the things
---

back in 2013, i made "Virginia: Bridges of the Commonwealth" for a map contest using National Bridge Inventory data. the static map won a few awards (!!!) which is always nice, and it was an interesting project given the amount odd bridge facts i gathered from the data. (like the skinniest bridge in virginia is 6.8 feet wide)
<div class="img_row">
    <img class="col three" src="/img/posts/vabridge.jpg">
</div>
<div class="col three caption">
    Virginia: Bridges of the Commonwealth
</div>

while my project was limited to Virginia, the data definitely called out for a cool web map version. after a few years of that idea floating around, i got a gentle nudge from a friend that it _would_ be a cool project, especially if i used [tippecanoe](https://github.com/mapbox/tippecanoe).

here's a quick review of how it came to be:<br><br>     the data used is the National Bridge Inventory from the Federal Highway Administration. they have     bridge data going back to 1992 (!!!) and it's available for download in csv format. the data also     comes with a 124 page guide detailing all the attributes (like 100 fields) - most importantly lat/lng     for geocoding. the coordinates are in DMS but not DMS. so, 80°45'10" would be 80451000 - ok, no problem,     we can do some weird field calc in qgis or you can have a friend (ask [Alex](https://twitter.com/alex_kappel)     about this) write some funky python to do it....     <br><br>     `wait Jonah did you even check data.gov to see if a geocoded version of the data exists?`     <br><br>so you can get     the [geocoded data from data.gov](http://catalog.data.gov/dataset/national-bridge-inventory-national-geospatial-data-asset-ngda-bridges) in shapefile format. i brought this into qgis, killed 98% of the fields and exported a .geojson file.     <br>     <br>     i knew i wanted to use mapbox studio & gl-js to create and display the map, i did not want to upload the 300mb     .geojson of 600 some thousand bridge points into my $5 per month account. so lets give tippecanoe a try - per      it's description, it "Builds vector tilesets from large collections of GeoJSON features. This is a tool for      making maps from huge datasets." tippecanoe is a command line utility that will, with a few parameters, take      my .geojson and output .mbtiles, which i can then load up to my mapbox account. with my .geojson handy, and      using the great documentation on the [github page](https://github.com/mapbox/tippecanoe), i dig in...<br><br>      `wait Jonah did you make sure you had the latest tippecanoe brew installed?` <br><br>      ugh...so make sure your using the      latest version (npm, homebrew, whichever) - i followed some great examples of tippecanoe in action like      [this blog from eric fischer](https://www.mapbox.com/blog/vector-density/) or this every lightning strike      [example by jordan rousseau](http://rousseau.io/2015/03/23/visualizing-a-month-of-lightning/) and settled      on this command <br><br>      `tippecanoe -pf -y EXTRA -y DATE -y AvgDyTrfc -rg -o nbi_2015.mbtiles nbi_2015.geojson -Z3 -z14` <br><br>     the final step was loading it up to my mapbox account, applying some scale dependent (!!!) symbology based on     my static map, and lastly creating a [quick page to demo](http://jonahadkins.github.io/bridges.html) the maps using mapbox-gl-js, which     i highly recommend to compare the two views i created and see the power of panning/zooming over 600k points.     here's a few static images made with the [image generator](https://www.mapbox.com/blog/static-maps-with-studio/)     in studio.
<P>special shot-outs to aaron alex, and will for their gracious support on this project!
<div class="img_row">
    <img class="col three" src="/img/posts/bridgestatus.png">
</div>
<div class="col three caption">
    Nation Bridge Inventory - Bridges By Status<p>
        | Ok | Structurally Deficient | Functionally Obsolete |
</div>

<div class="img_row">
    <img class="col three" src="/img/posts/bridgetraffic.png">
</div>
<div class="col three caption">
    Nation Bridge Inventory - Bridges By Traffic Count<p>
        | 0 | 10k | 25k | 75k | 150k | per day
</div>
