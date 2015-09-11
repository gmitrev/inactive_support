# encoding: utf-8
class Object
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end

  def present?
    !blank?
  end
end

class String
  def blank?
    strip.empty?
  end
end
