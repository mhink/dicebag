require 'dicebag'

RAND_SEED_FOR_TEST = 1234

RSpec.configure do |config|
  config.before(:example) do
    Dicebag::Roller.srand!(RAND_SEED_FOR_TEST)
  end

  config.order = :random
end
