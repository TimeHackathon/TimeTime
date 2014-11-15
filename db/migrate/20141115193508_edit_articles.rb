class EditArticles < ActiveRecord::Migration
  def change_table
  	add_column(:articles, :created_at, :datetime)
  	add_column(:articles, :updated_at, :datetime)
  end
end
