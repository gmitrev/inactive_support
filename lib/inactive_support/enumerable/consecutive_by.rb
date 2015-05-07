# encoding: utf-8
module Enumerable
  def consecutive_by
    sorted = sort { |a, b| _ordinal(yield(a)) <=> _ordinal(yield(b)) }

    prev = sorted.first

    sorted.slice_before do |cur|
      prev, prev2 = cur, prev
      _ordinal(yield(prev2)) + 1 != _ordinal(yield(prev))
    end.to_a
  end

  def consecutive?(&block)
    if block_given?
      consecutive_by(&block).count == 1 && self.sorted?(&block)
    else
      consecutive_by(&:identity).count == 1 && self.sorted?(&block)
    end
  end

  def sorted?
    if block_given?
      each_cons(2).all? do |a, b|
        (_ordinal(yield(a)) <=> _ordinal(yield(b))) <= 0
      end
    else
      each_cons(2).all? do |a, b|
        (_ordinal(a).to_i <=> _ordinal(b).to_i) <= 0
      end
    end
  end

  private
  def _ordinal(string)
    string.to_s.gsub(/[a-zA-Z]/) { |c| c.ord }.to_i
  end
end
