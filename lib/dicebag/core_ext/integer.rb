class Integer
  def d(sides)
    Dicebag::Roller.roll(self, sides)
  end
end
