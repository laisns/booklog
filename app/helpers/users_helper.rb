module UsersHelper
  def birth_date_helper
    options_for_select((1850..1911).to_a)
  end

  def user_total_lists(user)
    user.lists.any? ? user.lists.size : 'no lists yet!'
  end

  def avatar_icon
    image_tag ('avatar07.png'), class: 'rounded-circle w-50 h-50',
              alt: 'User profile picture'
  end
end

