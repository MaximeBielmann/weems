class Country < ApplicationRecord
    has_many :jobs
    
    def self.options_for_select
      order("LOWER(country_title)").map { |e| [e.country_title, e.id] }
    end
end