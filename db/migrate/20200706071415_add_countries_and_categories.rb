class AddCountriesAndCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :countries
    add_column :countries, :country_title, :string
    
    create_table :categories
    add_column :categories, :category_title, :string
  end
end
