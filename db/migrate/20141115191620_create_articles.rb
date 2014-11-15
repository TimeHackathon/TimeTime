class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :headline
    	t.text :blurb
    	t.text :content
    	t.text :image
    end
  end
end