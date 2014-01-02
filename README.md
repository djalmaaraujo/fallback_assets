# Fallback Asset Gem (WIP)
Create fallbacks to your assets. Handful to work with development and cdn assets.

## Single use
```haml
= javascript_include_fallback "underscore.js", "//cdnjs/underscore-min.js"
= stylesheet_include_fallback "vendor/normalize.css", "//cdnjs/normalize.min.css"
```

## Multiple

To use multiple fallbacks in the same command, you have to create a config/fallback_assets.yml, to use with symbols. This is the recommended syntax.

```haml
= javascript_include_fallback :underscore, :jquery, :normalize
= stylesheet_include_fallback :normalize, :bootstrap
```

## YML Example configuration
```yml

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
