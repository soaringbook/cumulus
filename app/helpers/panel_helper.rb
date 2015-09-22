module PanelHelper
  def panel(&_block)
    content_tag :div, class: 'panel' do
      yield
    end
  end

  def panel_heading(&_block)
    content_tag :header, class: 'panel-heading' do
      actions = content_tag :div, class: 'panel-actions' do
        yield
      end
    end
  end

  def panel_body(&_block)
    content_tag :div, class: 'panel-body' do
      yield
    end
  end
end
