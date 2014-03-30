class Hash
  # Deletes all key/value pairs where the value is empty string/array/hash or nil. 
  def delete_blank
    delete_if do |k, v|
      (v.blank? && v != false) or v.instance_of?(Hash) && v.delete_blank.empty?
    end
  end
end
