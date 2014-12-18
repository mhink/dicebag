module Dicebag
  class Roller
    include Enumerable

    def self.srand!(seed = Random.new_seed)
      @@seed = seed
    end

    def self.roll_expr(dice_expression = "1d20")
      matches = /(\d*)d(\d+)/.match(dice_expression)

      num_rolls = matches[1].blank? ? 1 : Integer(matches[1])
      num_sides     = Integer(matches[2], 10)

      Dicebag::Roller.new(num_rolls, num_sides)
    end

    def self.roll(num_rolls, num_sides)
      Dicebag::Roller.new(num_rolls, num_sides)
    end

    def initialize(num_rolls, num_sides)
      Dicebag::Roller.srand! unless @@seed

      @prng = Random.new(@@seed)
      @num_rolls = num_rolls
      @num_sides = num_sides
    end
    private :initialize

    def each
      return enum_for(:each) unless block_given?

      (1..@num_rolls).each do
        yield @prng.rand(1..@num_sides)
      end
    end

    def sum
      self.inject(0, &:+)
    end

    def sum_highest(n)
      self.sort.last(3).inject(0, &:+)
    end
  end
end
