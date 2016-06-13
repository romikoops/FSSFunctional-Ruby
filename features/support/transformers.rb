Transform /^table:.*$/ do |table|
  raw = table.raw.map do |array|
    array.map do |element|
      element.gsub(/FACTORY_([A-Z_]+)(\d*)(?:\[:(.+)\]|)/) do |factory, num, property|
        res = FactoryGirl.given_factory_by_number($1.downcase, $2)
        res.send($3) if $3.present?
      end
    end
  end

  location = Cucumber::Core::Ast::Location.of_caller
  ast_table = Cucumber::Core::Ast::DataTable.new(raw, location)
  Cucumber::MultilineArgument::DataTable.new(ast_table).rows_hash.symbolize_keys
end