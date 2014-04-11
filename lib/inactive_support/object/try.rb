class Object

  # Credit goes to the active_support contributors
  # https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/object/try.rb
  #
  # Invokes the public method whose name goes as first argument just like
  # +public_send+ does, except that if the receiver does not respond to it the
  # call returns +nil+ rather than raising an exception.
  def try(*args, &b)
    if args.empty? && block_given?
      yield self
    else
      public_send(*args, &b) if respond_to?(args.first)
    end
  end


  # Chained try allows writing
  #
  #    str.ctry(:mb_chars, :downcase, :dasherize)
  #
  # instead of
  # 
  #    str.try(:mb_chars).try(:downcase).try(:dasherize)
  #
  # Only works for methods that don't take arguments.
  def ctry(*args)
    first, *rest = args
    if rest.any?
      self.try(first).ctry(*rest)
    else
      self.try(first)
    end
  end

end

class NilClass
  def try(*args)
    nil
  end

  def ctry(*args)
    nil
  end

end
