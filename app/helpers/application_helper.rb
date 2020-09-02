module ApplicationHelper
  def link_to_main_page
    path = current_user ? user_path(current_user.login_name) : home_path
    link_to("BookLog", path, class: 'navbar-brand')
    # <h2 style="font-family: Pacifico; font-size: 200%">BookLog</h2>
    #TODO: adicionar fonte no layotu de application
  end
end
