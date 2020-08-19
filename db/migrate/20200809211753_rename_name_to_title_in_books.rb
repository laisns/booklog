class RenameNameToTitleInBooks < ActiveRecord::Migration[6.0]
  def up
    rename_column :books, :name, :title
  end
end
