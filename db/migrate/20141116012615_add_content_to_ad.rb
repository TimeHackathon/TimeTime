class AddContentToAd < ActiveRecord::Migration
  def change
  	add_column :ads, :content, :varchar
  end
end
