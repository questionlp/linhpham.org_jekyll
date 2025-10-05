source "https://rubygems.org"

gem "jekyll", "~> 4.4"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-sitemap", "~> 1.4"
  # gem "jekyll-paginate", "~> 1.1", "< 2.0"
  gem "jekyll-archives", "~> 2.3", "< 3.0"
  gem "jekyll-seo-tag", "~> 2.8", "< 3.0"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :windows, :jruby do
  gem "tzinfo", ">= 2", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.2", :platforms => [:windows]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.8.0", :platforms => [:jruby]

# Additional required gems
gem "kramdown-parser-gfm" if ENV["JEKYLL_VERSION"] == "~> 3.9"
gem "webrick", "~> 1.9"

# Add gems that will no longer be included in Ruby >= 3.4.0
gem "bigdecimal", "~> 3.1"
gem "safe_yaml", "~> 1.0"
gem "base64", "~> 0.2"
gem "csv", "~> 3.3"

# Add gems that will no longer be included in Ruby >= 3.5.0
gem "logger", "~> 1.6"
gem "ostruct", "~> 0.6"

gem "google-protobuf", "~> 4.32.1"
