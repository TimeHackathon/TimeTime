class CreateArticleCategoryTable < ActiveRecord::Migration
  def change
    create_table :article_category_tables do |t|
    	t.integer :article_id
    	t.integer :category_id
    end
  end
end
