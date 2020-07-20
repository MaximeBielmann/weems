class AddForeignKeyCategoryCountry < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :category_id, :integer
    add_column :jobs, :country_id, :integer
    
    remove_column :jobs, :job_category
    remove_column :jobs, :job_country
  end
end
