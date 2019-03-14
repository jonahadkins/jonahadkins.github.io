require "jekyll-import";

JekyllImport::Importers::Tumblr.run({
    "url"            => "https://jonahsmaps.tumblr.com",
    "format"         => "md", # "md" misses links and images etc
    "grab_images"    => true,
    "add_highlights" => true,
    "rewrite_urls"   => true # `true` breaks build
})
