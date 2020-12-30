module BooksHelper
  def books_genres_for_select
    genres = Genre.all.map { |genre| [genre.description, genre.id] }
    options_for_select(genres)
  end

  def toggle_book_status(book_list)
    link_to('To Read', '#',
            class: "dropdown-item actions-toggle #{check_selected(book_list, 0)}",
            data: { value: 0, attribute: :book_status, list: book_list.list_id,
                    id: book_list.get_user_book.id }) +
    link_to('Read', '#',
            class: "dropdown-item actions-toggle  #{check_selected(book_list, 2)}",
            data: { value: 2, attribute: :book_status, list: book_list.list_id,
                    id: book_list.get_user_book.id }) +
    link_to('Currently Reading', '#',
            class: "dropdown-item actions-toggle #{check_selected(book_list, 1)}",
            data: { value: 1, attribute: :book_status, list: book_list.list_id,
                    id: book_list.get_user_book.id })
  end

  def toggle_user_book_favorites(book_list)
    link_to('Favorite Author', '#',
            class: "dropdown-item actions-toggle #{check_favorite(book_list, 'author')}",
            data: { attribute: :favorite_author, list: book_list.list_id,
                    id: book_list.get_user_book.id }) +
    link_to('Favorite Book', '#',
            class: "dropdown-item actions-toggle #{check_favorite(book_list, 'book')}",
            data: { attribute: :favorite_book, list: book_list.list_id,
                    id: book_list.get_user_book.id })
  end

  def check_selected(book_list, status)
    books_ids = book_list.user.user_books.by_book_status(status).pluck(:book_id)
    books_ids.include?(book_list.book_id) ? 'select-attr' : ''
  end

  def check_favorite(book_list, attr)
    user = book_list.user
    if attr == 'book'
      user.favorite_books.pluck(:id).include?(book_list.book_id) ? 'select-attr' : ''
    else
      user.favorite_authors.pluck(:id).include?(book_list.author.id) ? 'select-attr' : ''
    end
  end
end
