# Fallback Asset Gem
Create fallbacks to your assets. Helpful to work with development and cdn assets.

[![Gem Version](https://badge.fury.io/rb/fallback_assets.png)](http://badge.fury.io/rb/fallback_assets) [![Build Status](https://travis-ci.org/djalmaaraujo/fallback_assets.png?branch=master)](https://travis-ci.org/djalmaaraujo/fallback_assets)

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
      development: /assets/normalize.css
      test: /assets/normalize.css

  javascripts:
    jquery:
      production: //cdn/jquery.min.js
      development: /assets/jquery.js
      test: /assets/jquery.js
```

### Tips-for-Troubleshooting
If you are expecting errors while your tests are running, set the test environment like this:
```yml
...
underscore:
  development: /assets/underscore.js
  production: //whatevercdn/underscore.min.js
  test: /assets/underscore.js # this is important, to access a file from vendor/assets/javascripts, use: /assets
```

## License

[MIT License](http://djalmaaraujo.mit-license.org/) © Djalma Araújo
