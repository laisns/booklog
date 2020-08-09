class RenameListaLivroToBookList < ActiveRecord::Migration[6.0]
  def up
    rename_column :lista_livros, :lista_id, :list_id
    rename_column :lista_livros, :livro_id, :book_id
    rename_table :lista_livros, :book_lists
  end

  def down
    rename_column :lista_livros, :list_id, :lista_id
    rename_column :lista_livros, :book_id, :livro_id
    rename_table :book_lists, :lista_livros
  end
end
