module WizardHelper
  def wizard_tag(&_block)
    content_tag :div, class: 'pearls row' do
      yield
    end
  end

  def wizard_pearl_tag(title, icon, finished = false)
    done_class = finished ? ' done' : ''
    content_tag :div, class: "pearl col-xs-4 #{done_class}", aria: { expanded: 'false' } do
      content = content_tag :div, class: 'pearl-icon' do
        content_tag :i, nil, class: "icon #{icon}", aria: { hidden: 'true' }
      end
      content << content_tag(:span, title, class: 'pearl-title')
    end
  end
end
