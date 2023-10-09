module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: "#{style} text-secondary text-decoration-underline fw-bold") +
      " ".html_safe + 
      (link_to "Login", new_user_session_path, class: "#{style} text-secondary text-decoration-underline fw-bold")
    else
      link_to "Logout",  destroy_user_session_path, data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }, class: "#{style} text-secondary text-decoration-underline fw-bold"
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. You are on the #{layout_name} layout."
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} text-secondary text-decoration-underline fw-bold #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active text-white" if current_page? path
  end

  def copyright_generator
    @copyright = SparkerViewTool::Renderer.copyright 'Sean Parker', 'All rights reserved'
  end
end
