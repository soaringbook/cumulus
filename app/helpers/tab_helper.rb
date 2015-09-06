module TabHelper
  def tabs_tag &bock
    content_tag :div, class: 'nav-tabs-horizontal' do
      content_tag :ul, class: 'nav nav-tabs nav-tabs-line', data: { plugin: 'nav-tabs' }, role: 'tablist' do
        yield
      end
    end
  end

  def tab_link_to title, icon, content_id, active = false
    active_class = active ? 'active' : nil
    content_tag :li, role: 'presentation', class: active_class do
      link_to "##{content_id}", data: { toggle: 'tab' }, aria: { controls: content_id, expanded: active } do
        content = content_tag :i, nil, class: "icon wb-#{icon}"
        content << title
        content
      end
    end
  end

  def tab_content &block
    content_tag :div, class: 'tab-content padding-top-20' do
      yield
    end
  end

  def tab_pane content_id, active = false, &block
    active_class = active ? ' active' : ''
    content_tag :div, id: content_id, class: "tab-pane #{active_class}", role: 'tabpanel' do
      yield
    end
  end
end
