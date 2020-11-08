module BooksHelper
  def books_genres_for_select
    genres = Genre.all.map { |genre| [genre.description, genre.id] }
    options_for_select(genres)
  end
end
