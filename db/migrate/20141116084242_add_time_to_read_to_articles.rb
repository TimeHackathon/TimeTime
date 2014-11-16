class AddTimeToReadToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :read_time, :string
  end
end
