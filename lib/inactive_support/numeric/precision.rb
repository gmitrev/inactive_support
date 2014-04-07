class Numeric
  # A more precise rounding. ~4 times slower than simple round
  #
  #     3.904605.round(2)
  #     # => 3.9
  #     3.904605.precision(2) 
  #     # => 3.91
  #
  #     37.9945.round(2)    
  #     # => 37.99                        
  #     37.9945.precision(2)
  #     # => 38.0                         
  def precision(precision = 0)
    power = 10 ** precision

    if precision == 0
      self.round
    else
      powered = self * power

      (precision - 1).downto(0).each do |i|
        powered = powered.round(i).to_f
      end

      powered.to_f / power.to_f
    end
  end
end