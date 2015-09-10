# InactiveSupport

A collection of useful extensions for Ruby projects.

## Installation

Add this line to your application's Gemfile:

    gem 'inactive_support'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inactive_support

## Extensions

#### Object

##### #identity
returns self

```ruby
[1,2,3,3,4,5,5].group_by(&:identity)
# => [[1], [2], [3,3], [4], [5,5]]
```

##### #try
send a message to the receiver and if it doesn't respond to the message, return nil

```ruby
"".try(:some_method)
# => nil
```

##### #ctry
chained try, for methods with no arguments

```ruby
"Somestring".ctry(:mb_chars, :downcase, :some_method)
# => nil
```

#### Hash
##### #delete_blank
Deletes all key/value pairs where the value is an empty string/array/hash or nil.

```ruby
{ name: nil, age: 19, address: "" }.delete_blank
# => { age: 19 }
```

##### #deep_delete_blank
Recursively deletes all key/value pairs where the value is an empty string/array/hash or nil.

```ruby
{ name: nil, age: 19, address: { street_name: 'Vitosha', street_number: nil },  }.deep_delete_blank
# => { age: 19, address: { street_name: 'Vitosha' }  }
```

#### Enumerable
##### #consecutive_by
Groups objects by an attribute that is consecutive

```ruby
[1,2,3,5,6,8,9].consecutive_by(&:identity)
# => [[1,2,3],[5,6],[8,9]]
```

##### #consecutive?
Returns true if the objects are consecutive

```ruby
[1, 2, 3, 5, 6, 8, 9].consecutive?
# =>  false
```

##### #sorted?
Returns true if the collection is sorted

```ruby
[1, 2, 3, 3, 5, 6, 8, 9].sorted?
# =>  true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
