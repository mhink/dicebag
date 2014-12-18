# Dicebag

Dicebag is a fun little micro-library (maybe even a nano-library?) which implements a D&D-like syntax for dice rolling.

I wrote it as part of a small D&D-related side project that I've since put on the back burner.  ¯\_(ツ)_/¯

## Installation

Add this line to your application's Gemfile:

    gem 'dicebag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dicebag

## Usage

To use Dicebag, just require it in:

    require 'dicebag'

By default, Dicebag will use Random.new_seed to seed its PRNG. To provide your own, call:

    Dicebag::Roller.srand!(YOUR_SEED_HERE)

to seed the PRNG.

### Dice Expressions

Dicebag::Roller.roll(count, n) rolls an 'n'-sided die 'count' times, and returns an instance of Dicebag::Roller, which is an Enumerable- giving you all the usual userful methods.

    roll = Dicebag::Roller.roll_expr(1, 20) # roll a 20-sided die 1 time.
    # => #<Dicebag::Roller>

    roll.next # Come on, critical hit!
    # => 20

Dicebag can also parse "dice expressions" such as "4d6" or "1d100" that you provide, like so

    rolls = Dicebag::Roller.roll_expr("1d8")
    # => #<Dicebag::Roller>

    roll.next
    # => 6

### Integer Extensions

Dicebag also ships an extension method for Integer as well:

     2.d(4)
    # => #<Dicebag::Roller>

### Helper Methods

Dicebag::Roller#sum returns the sum of all rolls: 

    4.d(8).sum
    # => 8

While Dicebag::Roller#sum_highest returns the sum of the highest N rolls.
    
    6.times.inject([]) do |ability_scores|
      ability_scores << 4.d(6).sum_highest(3)
    end
    # => [9, 13, 11, 13, 15, 14]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dicebag/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
