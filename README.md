# Itebooks

A simple, and really basic Ruby client for the [IT Ebooks](http://it-ebooks.info/) [API](http://it-ebooks-api.info/).
A bit rough around the edges, but does the trick.

## Installation

Add this line to your application's Gemfile:

    gem 'itebooks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itebooks

## Usage

### Search the API

Returns a collection of Book objects

```ruby
require 'itebooks'

# search the api 
books = Itebooks::Book.search('ruby')
```

### Retrieve a single book by ID

Use the id attribute from a book object


```ruby
require 'itebooks'

book = Itebooks::Book.find(2973000696)

p book.title # "Metaprogramming Ruby"
p book.sub_title # "Program Like the Ruby Pros"
p book.download # "http://filepi.com/i/a16hVNr" Download link (requires captcha completion)

p book.inspect # displays all attributes for a book
```

## TODO

- [x] Basic search and retrieve
- [ ] Implement pagination
- [ ] Write some tests (stubbing HTTParty's GET)

## Contributing

1. Fork it ( https://github.com/gary-rafferty/itebooks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
