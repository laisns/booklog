module ApplicationHelper
  def link_to_main_page
    path = current_user ? user_path(current_user.login_name) : home_path
    content_tag(:a, image_tag("booklog-logo-home.png", class: 'w-1 h-1'),
                href: path)
  end

  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end

  def form_action(object)
    return "Create New #{object.model_name.human}" unless object.persisted?
    "Edit #{object.model_name.human}"
  end
end
