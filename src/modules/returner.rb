module Returner
  def return_by_name_of_something(array, name, other_key)
    deep = false
    deep = true unless other_key.empty?
    array.each do |item|
      if deep
        if other_key == 'class'
          item.classes.each do |character_class|
            yield(item) if block_given? && character_class.name == name
          end
        elsif block_given? && item.public_send(other_key).name == name
          yield(item)
        end
      elsif block_given? && item.name == name
        yield(item)
      end
    end
  end
end
