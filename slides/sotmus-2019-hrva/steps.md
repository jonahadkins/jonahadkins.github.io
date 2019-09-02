tried using mbtiles-extracts but ran into errors https://github.com/mapbox/mbtiles-extracts/issues/17

installed tilelive `npm install -g @mapbox/tilelive`
installed mbtiles `npm install -g @mapbox/mbtiles`

downloaded qa-tiles country extract for USA https://osmlab.github.io/osm-qa-tiles/

used tilelive-copy `tilelive-copy --minzoom=12 --maxzoom=12 --bounds="-77.118,35.6379,-75.2723,37.5779" usa.mbtiles hrva.mbtiles`
 - went from 7.3gb to 71.3 mb

downloaded osm-tag-stats https://github.com/mapbox/osm-tag-stats
- `npm install`
- `npm link`

ran `osm-tag-stats --geojson=output.geojson --mbtiles='hrva.mbtiles' --users='Jonah Adkins'`

import specifc accounts
- Jonah Adkins
-

ran `tippecanoe -y @version -y @user -y addr:housenumber -y addr:city -y building -y note -y comment  -ag -pd -o output.mbtiles output.geojson -Z6 --force`
