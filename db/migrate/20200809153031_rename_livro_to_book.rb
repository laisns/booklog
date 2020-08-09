class RenameLivroToBook < ActiveRecord::Migration[6.0]
  def up
    rename_column :livros, :nome, :name
    rename_column :livros, :ano_lancamento, :release_year
    rename_column :livros, :sinopse, :synopsis
    rename_column :livros, :idioma, :language
    rename_column :livros, :autor_id, :author_id
    rename_column :livros, :genero_id, :genre_id
    rename_table :livros, :books
  end

  def down
    rename_column :books, :name, :nome
    rename_column :books, :release_year, :ano_lancamento
    rename_column :books, :synopsis, :sinopse
    rename_column :books, :language, :idioma
    rename_column :books, :author_id, :autor_id
    rename_column :livros, :genre_id, :genero_id
    rename_table :books, :livros
  end
end
