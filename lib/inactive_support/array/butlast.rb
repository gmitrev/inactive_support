# encoding: utf-8

class Array
  # Returns all elements excluding the last one
  def butlast
    if empty?
      []
    else
      self[0...-1]
    end
  end
end
