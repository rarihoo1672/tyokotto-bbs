class ChangeColumnToArticle < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :title, :string, null: false, unique: true
    change_column :articles, :description, :text, null: false, unique: true

  end
end
