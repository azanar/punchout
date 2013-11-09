punchout
========
Punchout is an implementation of the [Registry pattern](http://martinfowler.com/eaaCatalog/registry.html) that tries to make as few assumptions as possible about what is being registered, and how it wants to be found.

Punchout relies on the following three components to works its magic:

* A `Matcher`, which decides if a passed in values 'matches'.
* A `Matchable`, which will stores a value and a `Matcher`, and returns a value on a successful match.
* A `Punchable`, which is an extended module allowing for registration and lookup against `Matchable` objects.


Matchers
--------

Several `Matcher` classes are provided, and it is very easy to define your own `Matcher` classes.

An example matcher to determine if a particular value is awesome:

```ruby
class Awesomeness < Punchout::Matcher
  def matches?(thing)
    thing.respond_to?(:awesome?) && thing.awesome?
  end
end
```

Matchable
---------

A `Matchable` defines a relationship between a subclass of `Matcher` and a value to be returned.

A `Matchable` can be created as follows for testing equality, using the built-in `Punchout::Matcher::Equal` matcher

```ruby
require 'punchout/matcher/equal'

matcher = Punchout::Matcher::Equal(42)

matchable = Punchout::Matchable.new(matcher, 'meaning of life')
```

Punchable
---------

Punchout allows you to declare modules as `Punchable`, 

like as follows:

```ruby
require 'punchout'

module Things
  extends Punchout::Punchable
  
  #...other code...  
end
```

This will make your module `Punchable`, but at this point, there is nothing registered to `punch`.

When you extend something as `Punchable`, this exposes two new public methods: `#add` and `#punch`. 

* `puncher#add` is used to register a `Matchable` object against the Punchable module. 

* `#punch` returns the value attached to the first registered `Matchable` to match against the passed value.

Example
-------

```ruby
require 'punchout'

module Things
  extends Punchout::Punchable
  
  def self.add(thing)
    puncher.add(thing.name, thing)
  end
  #...other code...  
end

class Thing
  def initialize(name)
    @name = name
  end
  
  attr_reader :name
end

thing1 = Thing.new("thing1")
thing2 = Thing.new("thing2")

Things.add(thing1)
Things.add(thing2)

Things.punch("thing2") # returns thing2
Things.punch("thing3") # returns nil
```

Contributors
------------

See [Contributing](CONTRIBUTING.md) for details.

License
-------

See [License](LICENSE) for details.

Copyright
-------

&copy;2013 Ed Carrel and Pocket Change
