module ApplicationHelper
  def link_to_main_page
    path = current_user ? user_path(current_user.login_name) : home_path
    content_tag(:a, image_tag("booklog-logo.png", class: 'w-1 h-1'),
                href: path)
  end

  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end
end
