module UsersHelper
  def birth_date_helper
    options_for_select((1850..1911).to_a)
  end

  def logged_user
    current_user.name
  end
end
