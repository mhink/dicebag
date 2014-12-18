require 'spec_helper'

RSpec.describe Integer do
  describe "core_ext" do
    it "should allow the #d method as a shorthand for dice rolling" do
      expect( 5.d(6).to_a ).to eq([4, 6, 5, 5, 1])
    end
  end
end
