class Search < ApplicationRecord
	def get_ids
		users = User.where('first LIKE ? OR last LIKE ? COLLATE NOCASE',"%#{query}%","%#{query}%")
		return users.collect(&:id)
	end

	def result
      return {
      	ids: get_ids,
      	url: Rails.application.routes.url_helpers.search_path(id: id),
      	query: query
      }
	end
end
