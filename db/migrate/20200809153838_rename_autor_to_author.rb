class RenameAutorToAuthor < ActiveRecord::Migration[6.0]
  def up
    rename_column :autores, :nome, :name
    rename_column :autores, :data_nascimento, :birth_date
    rename_column :autores, :nacionalidade, :nationality
    rename_table :autores, :authors
  end

  def down
    rename_column :authors, :name, :nome
    rename_column :authors, :birth_date, :data_nascimento
    rename_column :authors, :nationality, :nacionalidade
    rename_table :authors, :autores
  end
end
