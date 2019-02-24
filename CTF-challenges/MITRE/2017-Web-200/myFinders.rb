Capybara::Node::Finders.module_eval do

  def synced_resolve(query)
    synchronize(query.wait) do
      if (query.match == :smart or query.match == :prefer_exact)
        result = query.resolve_for(self, true)
        result = query.resolve_for(self, false) if result.empty? && query.supports_exact? && !query.exact?
      else
        result = query.resolve_for(self)
      end
      if query.match == :one or query.match == :smart and result.size > 1
        raise Capybara::Ambiguous.new("Ambiguous match, found #{result.size} elements matching #{query.description}")
      end
      if result.empty?
        #raise Capybara::ElementNotFound.new("Unable to find #{query.description}")
        return false
      end
      result.first
    end.tap(&:allow_reload!)
  end
end
