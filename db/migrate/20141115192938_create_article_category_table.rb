class CreateArticleCategoryTable < ActiveRecord::Migration
  def change
    create_table :article_category_tables do |t|
    	article_id :integer
    	category_id :integer
    end
  end
end
