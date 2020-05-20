class JobsFeature < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :job_title, null: false
      t.string :job_category, null: false
      t.string :job_country, null: false
      t.string :job_city
      t.datetime :job_publish_date
      t.integer :job_salary
      t.text :job_description
    end
  end
end
