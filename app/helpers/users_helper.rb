module UsersHelper
  def birth_date_helper
    options_for_select((1850..1911).to_a)
  end

  def user_total_lists(user)
    user.lists.any? ? user.lists.size : 'no lists yet!'
  end

  def user_favorite_authors(user)
    user.user_books.favorite_authors.size
  end

  def user_favorite_books(user)
    user.user_books.favorite_books.size
  end

  def user_total_books(user)
    user.user_books.size
  end

  def books_added_info(user)
    return "You haven't added any books lists yet." unless user.lists.any?
    return 'No books added yet.' unless user.user_books.any?
    "#{user_total_books(user)} books"
  end

  def avatar_icon
    image_tag ('avatar07.png'), class: 'rounded-circle profile-picture',
              alt: 'User profile picture'
  end
end
