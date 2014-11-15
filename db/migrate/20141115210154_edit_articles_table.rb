class EditArticlesTable < ActiveRecord::Migration
  def change
  	add_column(:articles, :category, :string)
  	drop_table :article_categories
  end
end
