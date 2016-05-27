class APIFiltersCollection
  include Singleton

  attr_reader :filters

  def initialize
    path = './config/tests/filters.yml'
    @filters = File.exists?(path) ? YAML.load_file(path) : {}
  end

  def find_filter(type, name)
    @filters.fetch(type.downcase.gsub(/ +/, '_').to_sym)
        .find { |f| f[:label].downcase == name.downcase }[:filter]
  end
end