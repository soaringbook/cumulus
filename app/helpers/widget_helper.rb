module WidgetHelper
  def widget &block
    content_tag :div, class: 'widget widget-shadow text-center' do
      yield
    end
  end

  def widget_header &block
    content_tag :div, class: 'widget-header' do
      content_tag :div, class: 'widget-header-content' do
        yield
      end
    end
  end

  def widget_footer &block
    content_tag :div, class: 'widget-footer' do
      yield
    end
  end
end
