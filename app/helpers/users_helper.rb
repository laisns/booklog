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

  def avatar_icon(user)
    if user.avatar.attached?
      image_tag (user.avatar), class: 'rounded-circle profile-picture',
                                  alt: 'User profile picture'
    else
      image_tag ('avatars/avatar_default.png'), class: 'rounded-circle profile-picture',
                alt: 'User profile picture'
    end
  end

  def interest_tags(user_tags)
    content_tag(:p, class: 'text-muted') do
      user_tags.each do |tag|
        concat content_tag(:span, tag.name, class: random_badge_bg_color)
      end
    end
  end
end
