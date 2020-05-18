class ChangeColumnToTag < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :tags, :name, :string, null: false, unique: true
    end
  
    def down
      change_column :tags, :name, :string, null: false
    end
  end
end