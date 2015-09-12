# Prpr::Checklist

[Prpr](https://github.com/mzp/prpr) plugin to label unmergeable pull request as conflict.

## Install

Add this line to your application's Gemfile:

```ruby
# Gemfile
gem 'prpr-conflict_label'
```

## Usage
When some commits is pushed, add "conflict" label to unmergeable pull request.

![add conflict label](https://raw.githubusercontent.com/mzp/prpr-conflict_label/master/conflict_label.png)

## Env

```
CONFLICT_LABEL - label name for unmergeable pull request (Default: conflict)
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
