module ListsHelper
  def recent_lists(user)
    user.lists.last(3)
  end

  def create_edit_title

  end
end
