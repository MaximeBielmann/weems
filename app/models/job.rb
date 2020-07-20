class Job < ApplicationRecord
  paginates_per 20
  
  filterrific(
   default_filter_params: {  },
   available_filters: [
     :sorted_by,
     :search_query,
     :search_city_query,
     :with_country_id,
     :with_category_id,
   ]
 )
 
  
  belongs_to :country
  belongs_to :category
  
 
  scope :search_query, ->(query) {
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.tr("*", "%") + "%").gsub(/%+/, "%")
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 1
  where(
    terms.map { |_term|
      "(LOWER(jobs.job_title) LIKE ?)"
    }.join(" AND "),
    *terms.map { |e| [e] * num_or_conds }.flatten,
  )
}

scope :search_city_query, ->(city_query) {
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if city_query.blank?

  # condition query, parse into individual keywords
  terms = city_query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.tr("*", "%") + "%").gsub(/%+/, "%")
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 1
  where(
    terms.map { |_term|
      "(LOWER(jobs.job_city) LIKE ?)"
    }.join(" AND "),
    *terms.map { |e| [e] * num_or_conds }.flatten,
  )
}


  scope :with_country_id, ->(country_ids) {
  where(country_id: [*country_ids])
}

  scope :with_category_id, ->(category_ids) {
  where(category_id: [*category_ids])
}

  def self.options_for_sorted_by
    
  end

end