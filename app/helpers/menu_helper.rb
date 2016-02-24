module MenuHelper
  def menu_group_tag(name, icon, active, &_block)
    content_tag :li, class: (active ? ' active' : nil) do
      top_content = link_to '' do
        content = content_tag(:i, nil, class: "fa fa-#{icon}")
        content << content_tag(:span, name, class: 'nav-label')
        content << content_tag(:span, nil, class: 'fa arrow')
        content
      end
      list = content_tag :ul, class: "nav nav-second-level collapse#{active ? ' active' : ''}" do
        yield
      end
      top_content << list
      top_content
    end
  end

  def menu_link_tag(name, icon, path, active, special = false)
    li_class = [
      active ? 'active' : nil,
      special ? 'special_link' : nil
    ].compact.join ' '
    content_tag :li, class: li_class do
      link_to path do
        if icon
          content = content_tag(:i, nil, class: "fa fa-#{icon}")
          content << content_tag(:span, name, class: 'nav-label')
          content
        else
          name
        end
      end
    end
  end

  def menu_top_link_tag(name, path, options = {})
    content_tag :li do
      link_to name, path, options
    end
  end
end
