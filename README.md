# Lograge::ActionMailer

You get a single line with all the important information, like this:
```log
 "status":"delivered","mailer":"UserMailer","message_id":"61e6b06c20d63_323a76b547849c@application-dev.mail","duration":"855.3ms"
```

## Installation

In your Gemfile:

```ruby
gem 'lograge'
gem 'lograge-action-mailer'
```

Enable it in an initializer or the relevant environment config:
```ruby
# config/initializers/lograge.rb
# OR
# config/environments/production.rb
Rails.application.configure do
  config.lograge.action_mailer.enabled = true
end
```
To further clean up your logging, you can also tell Lograge to skip log messages meeting given criteria. You can skip log messages generated from ActionMailer events:
```ruby
Rails.application.configure do
  config.lograge.action_mailer.ignore_events = ["process"]
end
```
## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
