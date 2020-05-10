class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :url, null: false
      t.string :urlToImage, null: false
      t.datetime :publishedAt, null: false
      t.timestamps
    end
  end
end

