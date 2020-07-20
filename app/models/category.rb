class Category < ApplicationRecord
    has_many :jobs
    
    def self.options_for_select
      order("LOWER(category_title)").map { |e| [e.category_title, e.id] }
    end
end