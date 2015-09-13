# encoding: utf-8
class Object
  # Object#dup is shallow and therefore useless:
  #
  # a = { name: { first: 'Georgi' } }
  # dupl = a.dup
  #
  # #this also changes a when it shouldn't
  # dupl[:name][:first] = 'Dazen'
  #
  # a
  # => :name=>{:first=>"Dazen"}}
  #
  # deep_dup fixes this behavior
  def deep_dup
    Marshal.load(Marshal.dump(self))
  end
end
