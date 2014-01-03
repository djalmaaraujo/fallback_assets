# Fallback Asset Gem (v0.0.4)
Create fallbacks to your assets. Helpful to work with development and cdn assets.

[https://rubygems.org/gems/fallback_assets](https://rubygems.org/gems/fallback_assets)


## Installation
In your Gemfile:
```ruby
gem 'fallback_assets'
```

## Features
* Add assets (javascripts / stylesheets) to your codebase with fallback to local files
* Great to use with CDN assets (first idea)
* The local asset will be used if the CDN is not available
* Easy to config

## How to use

### Single use
```haml
= fallback_javascript :underscore
= fallback_stylesheet :normalize
```

### Configuration
Create a file config/fallback_assets.yml under your rails app.

```yaml
fallbacks:
  stylesheets:
    normalize:
      production: //cdn/normalize.min.css
      development: normalize.css

  javascripts:
    jquery:
      production: //cdn/jquery.min.js
      development: jquery.js
```

## Copyright
Copyright © 2014 Djalma Araújo. See LICENSE.txt for further details.

