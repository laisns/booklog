class AddNameToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :name, :string
    rename_column :book_editions, :name, :title
  end
end
