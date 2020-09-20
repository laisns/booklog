class AddFavoriteToUserBook < ActiveRecord::Migration[6.0]
  def change
    add_column :user_books, :favorite_book, :boolean
    add_column :user_books, :favorite_author, :boolean
    change_column_default :user_books, :book_status, 0
  end
end
