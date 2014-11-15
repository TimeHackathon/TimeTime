class RenameArticleCategory < ActiveRecord::Migration
	def change
		rename_table :article_category_tables, :article_categories 
	end
end
