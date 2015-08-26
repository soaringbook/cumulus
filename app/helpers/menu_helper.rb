module MenuHelper
  def menu_group_tag name
    content_tag :li, name, class: 'site-menu-category'
  end

  def menu_link_tag name, icon, path, active
    content_tag :li, class: "site-menu-item#{active ? ' active' : ''}" do
      link_to path do
        content = content_tag(:i, nil, class: "site-menu-icon #{icon}", 'aria-hidden' => 'true')
        content << content_tag(:span, name, class: 'site-menu-title')
        content
      end
    end
  end
end
