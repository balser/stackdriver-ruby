# stackdriver-ruby

A simple ruby toolkit for reporting metrics and events to [Stackdriver] endpoints.

## installation

Add this line to your application's Gemfile:

    gem 'stackdriver-ruby'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stackdriver-ruby

## usage

Set `STACKDRIVER_API_KEY` in your environment.  Errors are rescued by default in order to not break the application if reporting fails.  For debugging responses, you can call `Stackdriver.last_response` to inspect the previous response.

**Reporting a [custom metric]**

```ruby
Stackdriver.custom(metric_name, value, collected_at, aws_instance_id)
# => true
```

**Sending a [deploy event]**

```ruby
options = {
  deployed_by: 'whodis',
  deployed_to: 'production',
  repository:  'foo'
}

Stackdriver.deploy_event('0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33', options)
# => true
```

**Displaying an [annotation event]**

```ruby
options = {
  level:        'WARN'        # INFO/WARN/ERROR (default INFO)
  annotated_by: 'whodis'
  instance_id:  'i-1234abcd',
  event_epoch:  Time.now.to_i
}

Stackdriver.annotation_event('That just happened!', options)
# => true
```

## examples

  * [Using with delayed jobs.](https://github.com/balser/stackdriver-ruby/wiki/Example-using-with-delayed-jobs)

## tk

  * configureables (logger, agent, etc)
  * tests

## thank you

The code structure an conventions are heavily influenced by the following gems:
  * [octokit]
  * [twitter]
  * [instagram-ruby-gem]

## contributing

1. Fork it ( http://github.com/balser/stackdriver-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[stackdriver]: http://www.stackdriver.com/
[custom metric]: http://feedback.stackdriver.com/knowledgebase/articles/181488-sending-custom-application-metrics-to-the-stackdri
[deploy event]: http://feedback.stackdriver.com/knowledgebase/articles/212917-sending-code-deploy-events-to-stackdriver
[annotation event]: http://feedback.stackdriver.com/knowledgebase/articles/260455-sending-annotation-events-to-stackdriver

[octokit]: https://github.com/octokit/octokit.rb
[instagram-ruby-gem]: https://github.com/Instagram/instagram-ruby-gem
[twitter]: https://github.com/sferik/twitter
