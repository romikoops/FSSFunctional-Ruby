Transform /^FACTORY_([A-Z_]+)(\d*)(?:\[:(.+)\])?$/ do |factory, num, property|
  res = FactoryGirl.given_factory_by_number(factory.downcase, num)
  property.present? ? res.send(property) : res
end

Transform /^table:.*$/ do |table|
  raw = table.raw.map do |array|
    array.map do |element|
      element.gsub(/FACTORY_([A-Z_]+)(\d*)(?:\[:(.+)\])?/) do
        factory, num, property = $1, $2, $3
        res = FactoryGirl.given_factory_by_number(factory.downcase, num)
        property.present? ? res.send(property) : res
      end
    end
  end

  location = Cucumber::Core::Ast::Location.of_caller
  ast_table = Cucumber::Core::Ast::DataTable.new(raw, location)
  Cucumber::MultilineArgument::DataTable.new(ast_table).rows_hash.symbolize_keys
end

Transform /^'(\w+)' email$/ do |email|
  "#{email}_email".camelize.constantize
end