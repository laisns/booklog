module ListsHelper
  def recent_lists(user)
    user.lists.last(3)
  end

  def create_edit_title
  end

  def button_style
    'btn btn-danger bg-gradient-danger btn-lg btn-block text-left'
  end

  def fa_plus_icon
    '<i class="fas fa-plus"></i> Add Books to List'.html_safe
  end
end
