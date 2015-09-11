# encoding: utf-8
class Hash
  # Deletes all key/value pairs where the value is empty string/array/hash or nil.
  def delete_blank
    delete_if do |_, v|
      (v.blank? && v != false)
    end
  end
end
