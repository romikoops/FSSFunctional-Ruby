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
  Cucumber::MultilineArgument::DataTable.new(ast_table)
end

Transform /^through '(\w+)' api$/ do |api|
  apis = ObjectSpace.each_object(Class).select { |c| c < SearchApi::Models::Base }.inject({}) do |res, api_class|
    res.tap { res[api_class.name.demodulize.underscore.to_sym] = api_class }
  end

  key = api.gsub(/[^\w]+/, '').downcase.to_sym
  apis.fetch(key) { |p| raise "Unregistered api model given: '#{p.to_s.camelize}'" }
end