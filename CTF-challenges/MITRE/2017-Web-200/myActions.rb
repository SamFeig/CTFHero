Capybara::Node::Actions.module_eval do

  def fill_in(locator, options={})
    locator, options = nil, locator if locator.is_a? Hash
    raise "Must pass a hash containing 'with'" if not options.is_a?(Hash) or not options.has_key?(:with)
    with = options.delete(:with)
    fill_options = options.delete(:fill_options)
    options[:with] = options.delete(:currently_with) if options.has_key?(:currently_with)
    obj = find(:fillable_field, locator, options)
    obj.set(with, fill_options) unless obj == false
    session.driver.execute_script("console.log('unable to find field: #{locator.to_s}');") if obj == false
  end
end
