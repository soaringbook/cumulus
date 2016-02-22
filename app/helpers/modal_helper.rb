module ModalHelper
  def modal_button_tag(identifier, title)
    content_tag :button, title, class: 'btn btn-white', data: { target: "##{identifier}", toggle: 'modal' }
  end

  def modal_container(identifier, icon, title, subtitle, &_block)
    content_tag :div, id: identifier, class: 'modal inmodal', role: 'dialog', tabindex: '-1' do
      content_tag :div, class: 'modal-dialog' do
        content_tag :div, class: 'modal-content animated bounceInRight' do
          content = content_tag :div, class: 'modal-header' do
            inner_content = content_tag :i, nil, class: "fa fa-#{icon} modal-icon"
            inner_content << content_tag(:h4, title, class: 'modal-title')
            inner_content << content_tag(:small, subtitle, class: 'small font-bold')
            inner_content
          end
          if block_given?
            body = content_tag :div, class: 'modal-body' do
              yield
            end
            content << body
          end
          footer = content_tag :div, class: 'modal-footer' do
            content_tag :button, t('global.links.close'), class: 'btn btn-white', data: { dismiss: 'modal' }
          end
          content << footer
          content
        end
      end
    end
  end
end
