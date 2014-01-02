# Fallback Asset Gem (WIP)
Create fallbacks to your assets. Helpful to work with development and cdn assets.

## Installation
```ruby
gem install useragent
```

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
= javascript_include_fallback "underscore.js", "//cdnjs/underscore-min.js"
= stylesheet_include_fallback "vendor/normalize.css", "//cdnjs/normalize.min.css"
```

### Single use with YML config
```haml
= javascript_include_fallback :underscore
= stylesheet_include_fallback :normalize
```

### Multiple

To use multiple fallbacks in the same command, you have to create a config/fallback_assets.yml.

```haml
= javascript_include_fallback :underscore, :jquery, :normalize
= stylesheet_include_fallback :normalize, :bootstrap
```

### YML Example configuration (Recommended for better code organization)
```yaml

config/fallback_assets.yml

fallbacks:
  stylesheets:
    normalize:
      file: cdn.whatever.com/normalize.css
      fallback: vendor/assets/stylesheets/normalize.css

  javascripts:
    jquery:
      file: cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js
      fallback: vendor/assets/jquery.min.js
```
