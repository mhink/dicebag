require 'spec_helper'

RSpec.describe Dicebag::Roller do
  describe :roll_expr do
    it "should parse the expression '10d20' successfully" do
      roller = nil

      expect{ roller = Dicebag::Roller.roll_expr("10d20").each }.not_to raise_error

      10.times do 
        expect( roller.peek ).to (be >= 1).and (be <= 20)
        expect{ roller.next }.not_to raise_error
      end

      expect{ roller.peek }.to raise_error(StopIteration)
      expect{ roller.next }.to raise_error(StopIteration)
    end

    it "should roll once if given an expression like 'd20'" do
      roller = nil

      expect{ roller = Dicebag::Roller.roll_expr("d20").each }.not_to raise_error

      expect( roller.peek ).to (be >= 1).and (be <= 20)
      expect{ roller.next }.not_to raise_error
      expect{ roller.peek }.to raise_error(StopIteration)
      expect{ roller.next }.to raise_error(StopIteration)
    end
  end

  # NOTE: The following specs rely on a deterministic Dicebag::Roller PRNG seed.
  describe :sum do
    it "should correctly sum the numbers generated by the Dicebag::Roller" do
      expect(Dicebag::Roller.roll_expr("5d6").sum).to eq(21)
    end
  end

  describe :sum_highest do
    it "should correctly sum the highest numbers generated by the DiceRoiller" do
      expect(Dicebag::Roller.roll_expr("4d6").sum_highest(3)).to eq(16)
    end
  end
end
