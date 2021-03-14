module Returner
  def return_by_name_of_something(array, name, other_key)
    deep = false
    deep = true unless other_key.empty?
    array.each do |item|
      if deep
        yield(item) if block_given? && item.public_send(other_key).name == name
      elsif block_given? && item.name == name
        yield(item)
      end
    end
  end
end
