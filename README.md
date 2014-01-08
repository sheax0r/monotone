# Monotone

Gem to generate increasing numbers. Numbers are stored on the local filesystem, in ~/.monotone.
Also includes a CLI. I use it for generating BUILD_NUMBER-like numbers outside of the context of Jenkins jobs.

## Installation

Add this line to your application's Gemfile:

    gem 'monotone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monotone

## Usage
### Ruby
```ruby
require 'monotone'
Monotone.next 'key'     # Returns 0
Monotone.next 'key'     # Returns 1
Monotone.set  'key', 0  # Returns 0
Monotone.next 'key'     # Returns 1
```

### CLI
```bash
mon-next key    # Returns 0
mon-next key    # Returns 1
mon-set  key 0  # Returns 0
mon-next key    # Returns 1
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
