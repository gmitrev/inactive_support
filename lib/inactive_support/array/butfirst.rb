# encoding: utf-8

class Array
  # Returns the tail of the array
  def butfirst
    if empty?
      []
    else
      self[1..-1]
    end
  end
end
