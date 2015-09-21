module TabHelper
  def tab_container(&_block)
    content_tag :div, class: 'tabs-container' do
      yield
    end
  end

  def tab_content(&_block)
    content_tag :div, class: 'tab-content' do
      yield
    end
  end

  def tabs_tag(&_bock)
    content_tag :ul, class: 'nav nav-tabs' do
      yield
    end
  end

  def tab_link_to(title, icon, content_id, active = false)
    active_class = active ? 'active' : nil
    content_tag :li, class: active_class do
      link_to "##{content_id}", data: { toggle: 'tab', url: content_id } do
        content = content_tag :i, nil, class: "fa fa-#{icon}"
        content << title
        content
      end
    end
  end

  def tab_pane(content_id, active = false, &_block)
    active_class = active ? ' active' : ''
    content_tag :div, id: content_id, class: "tab-pane #{active_class}", role: 'tabpanel' do
      content_tag :div, class: 'panel-body' do
        yield
      end
    end
  end
end
