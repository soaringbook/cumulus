module PanelHelper
  def panel &block
    content_tag :div, class: 'panel' do
      yield
    end
  end

  def panel_heading title, &block
    content_tag :header, class: 'panel-heading' do
      content = content_tag(:h3, title, class: 'panel-title')
      if block_given?
        actions = content_tag :div, class: 'panel-actions' do
          yield
        end
        content << actions
      end
      content
    end
  end

  def panel_body &block
    content_tag :div, class: 'panel-body' do
      yield
    end
  end
end
