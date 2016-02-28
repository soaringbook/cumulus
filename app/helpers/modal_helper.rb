module ModalHelper
  def modal_button_tag(identifier, title)
    link_to title, '#', class: 'btn btn-white', data: { target: "##{identifier}", toggle: 'modal' }
  end

  def modal_close_tag
    link_to(t('global.links.close'), '#', class: 'btn btn-white', data: { dismiss: 'modal' })
  end

  def modal_body_tag(&_block)
    content_tag :div, class: 'modal-body' do
      yield if block_given?
    end
  end

  def modal_footer_tag(&_block)
    content_tag :div, class: 'modal-footer' do
      yield if block_given?
    end
  end
end
