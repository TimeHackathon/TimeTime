class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
    	t.text :image
    	t.string :headline
    	t.text :blurb
    	t.boolean :ad
    end
  end
end
