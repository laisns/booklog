class String
  def to_boolean
    ActiveRecord::Type::Boolean.new.cast(self)
  end
end

class TrueClass
  def to_boolean
    true
  end

  def to_i
    1
  end
end

class FalseClass
  def to_boolean
    false
  end

  def to_i
    0
  end
end

class Integer
  def to_boolean
    to_s.to_boolean
  end
end