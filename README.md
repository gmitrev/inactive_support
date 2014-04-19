# InactiveSupport

A collection of utilities for ruby projects. 

## Installation

Add this line to your application's Gemfile:

    gem 'inactive_support'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inactive_support

## Usage

Object#identity
returns self
    
    [1,2,3,3,4,5,5].group_by(&:identity)
    # => [[1], [2], [3,3], [4], [5,5]]

Hash#delete_blank
Deletes all key/value pairs where the value is an empty string/array/hash or nil.

    { name: nil, age: 19, address: "" }.delete_blank
    # => { age: 19 }
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
