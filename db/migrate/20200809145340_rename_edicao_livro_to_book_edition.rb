class RenameEdicaoLivroToBookEdition < ActiveRecord::Migration[6.0]
  def up
    rename_column :edicoes_livros, :nome, :name
    rename_column :edicoes_livros, :numero, :number
    rename_column :edicoes_livros, :editora, :publisher
    rename_column :edicoes_livros, :idioma, :language
    rename_column :edicoes_livros, :num_paginas, :total_pages
    rename_column :edicoes_livros, :livro_id, :book_id
    rename_table :edicoes_livros, :book_editions
  end

  def down
    rename_column :book_editions, :name, :nome
    rename_column :book_editions, :number, :numero
    rename_column :book_editions, :publisher, :editora
    rename_column :book_editions, :language, :idioma
    rename_column :book_editions, :total_pages, :num_paginas
    rename_column :book_editions, :book_id, :livro_id
    rename_table :book_editions, :edicoes_livros
  end
end
