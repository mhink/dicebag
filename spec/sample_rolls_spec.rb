require 'spec_helper'

RSpec.shared_examples "rolling" do |roll_expr, opts|
  it ": #{roll_expr} should yield the values #{opts[:should_yield]}" do
    expect(Dicebag::Roller.roll_expr(roll_expr).to_a).to eq(opts[:should_yield])
  end
end

RSpec.describe Dicebag::Roller do
  describe "example runs using DICE_RAND_SEED_FOR_TEST" do
    include_examples "rolling", "10d4", should_yield:   [4, 4, 3, 2, 1, 1, 1, 2, 4, 2]
    include_examples "rolling", "10d6", should_yield:   [4, 6, 5, 5, 1, 2, 2, 2, 3, 4]
    include_examples "rolling", "10d8", should_yield:   [8, 4, 7, 6, 5, 5, 1, 2, 8, 2]
    include_examples "rolling", "10d10", should_yield:  [4, 7, 6, 5, 9, 10, 2, 8, 10, 7]
    include_examples "rolling", "10d20", should_yield:  [16, 20, 7, 13, 16, 18, 10, 12, 13, 17]
  end
end
