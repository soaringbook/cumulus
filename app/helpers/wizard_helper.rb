module WizardHelper
  def wizard_tag(&_block)
    content_tag :div, class: 'pearls row' do
      yield
    end
  end

  def wizard_step_tag(title, icon, finished = false)
    done_class = finished ? ' done' : ''
    step_content = content_tag :h1, title
    content = content_tag :div, class: "step-content #{done_class}" do
      content = content_tag :div, class: 'm-t-md' do
        content_tag :i, nil, class: "icon #{icon}", aria: { hidden: 'true' }
      end
      content << content_tag(:span, title, class: 'pearl-title')
    end
    step_content << content
    step_content
  end
end
