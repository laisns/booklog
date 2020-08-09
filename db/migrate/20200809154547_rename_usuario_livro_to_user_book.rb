class RenameUsuarioLivroToUserBook < ActiveRecord::Migration[6.0]
  def up
    rename_column :usuarios_livros, :status_livro, :book_status
    rename_column :usuarios_livros, :usuario_id, :user_id
    rename_column :usuarios_livros, :livro_id, :book_id
    rename_table :usuarios_livros, :user_books
  end

  def down
    rename_column :user_books, :book_status, :status_livro
    rename_column :usuarios_livros, :user_id, :usuario_id
    rename_column :usuarios_livros, :book_id, :livro_id
    rename_table :user_books, :usuarios_livros
  end
end
