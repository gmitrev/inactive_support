class Object

  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end

  def present?
    !blank?
  end

  # Chained try
  #
  # Allows writing
  #
  #    str.ctry(:mb_chars, :downcase, :dasherize)
  #
  # instead of
  # 
  #    str.try(:mb_chars).try(:downcase).try(:dasherize)
  #
  # Only works for methods that dont have any arguments
  def ctry(*args)
    first, *rest = args
    if rest.any?
      self.try(first).ctry(*rest)
    else
      self.try(first)
    end
  end

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
