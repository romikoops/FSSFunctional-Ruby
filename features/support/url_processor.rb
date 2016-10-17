class UrlProcessor
  def self.restore(name, value)
    return value
  end

  def self.match(name)
    return ".*"
  end
  def self.validate(name, value)
    return true
  end

  def self.transform(name, value)
    return value
  end
end
