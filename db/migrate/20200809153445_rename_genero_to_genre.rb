class RenameGeneroToGenre < ActiveRecord::Migration[6.0]
  def up
    rename_column :generos, :descricao, :description
    rename_table :generos, :genres
  end

  def down
    rename_column :genres, :description, :descricao
    rename_table :genres, :generos
  end
end
