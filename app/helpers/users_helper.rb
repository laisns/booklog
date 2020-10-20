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

  def user_total_books(user)
    user.user_books.favorite_books.size
  end

  def books_added_info(user)
    return "You haven't added any books lists yet." unless user.lists.any?
    return 'No books added yet.' unless user.user_books.any?
    "#{user_total_books(user)} books"
  end

  def avatar_icon
    image_tag ('avatar07.png'), class: 'rounded-circle w-50 h-50',
              alt: 'User profile picture'
  end

  def user_recent_activity(user)
    # user activities include: user added book x to his books. # user edited list #001
    # user edited his profile # user added tag y to his tags of interests.
    PublicActivity::Activity.order('created_at desc')
        .where(owner_type: "User", owner_id: user.id)
        .group_by { |activity| activity.updated_at.to_date }
  end
end
