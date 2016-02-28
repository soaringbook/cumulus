module ModalHelper
  def modal_button_tag(identifier, title)
    link_to title, '#', class: 'btn btn-white', data: { target: "##{identifier}", toggle: 'modal' }
  end

  def modal_body_tag(&_block)
    content_tag :div, class: 'modal-body' do
      yield if block_given?
    end
  end

  def modal_footer_tag(with_close_button=true)
    content_tag :div, class: 'modal-footer' do
      content_tag :button, t('global.links.close'), class: 'btn btn-white', data: { dismiss: 'modal' }
    end
  end
end
