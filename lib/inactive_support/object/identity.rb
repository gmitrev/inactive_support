class Object
  # Returns self. If given a block, it works a lot like Object#tap
  #
  # ==== Examples
  #
  #   [1,2,3,5,7].consecutive_by(:identity) 
  #   => [[1, 2, 3], [5], [7]]
  def identity
    if block_given?
      yield self
    else
      self
    end
  end
end


