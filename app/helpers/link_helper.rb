module LinkHelper
  def add_link_to(path)
    link_to path, class: 'btn btn-sm btn-icon btn-flat btn-default', data: { toggle: 'tooltip', 'original-title' => t('global.links.new') } do
      content_tag :i, nil, class: 'icon wb-plus', aria: { hidden: 'true' }
    end
  end

  def edit_link_to(path)
    link_to path, class: 'btn btn-sm btn-icon btn-flat btn-default', data: { toggle: 'tooltip', 'original-title' => t('global.links.edit') } do
      content_tag :i, nil, class: 'icon wb-wrench', aria: { hidden: 'true' }
    end
  end

  def delete_link_to(path)
    link_to path, method: :delete, class: 'btn btn-sm btn-icon btn-flat btn-default', data: { confirm: t('global.labels.delete_confirmation'), toggle: 'tooltip', 'original-title' => t('global.links.edit') } do
      content_tag :i, nil, class: 'icon wb-close', aria: { hidden: 'true' }
    end
  end

  def edit_action_link_to(path)
    link_to path, class: 'btn btn-sm btn-icon btn-inverse btn-round', data: { toggle: 'tooltip', 'original-title' => t('global.links.edit') } do
      content_tag :i, nil, class: 'icon wb-wrench', aria: { hidden: 'true' }
    end
  end

  def show_action_link_to(path)
    link_to path, class: 'btn btn-sm btn-icon btn-inverse btn-round', data: { toggle: 'tooltip', 'original-title' => t('global.links.edit') } do
      content_tag :i, nil, class: 'icon wb-eye', aria: { hidden: 'true' }
    end
  end

  def export_tag(&_block)
    content_tag :div, class: 'dropdown' do
      content = link_to '#', class: 'dropdown-toggle btn btn-sm btn-icon btn-flat btn-default', data: { toggle: 'dropdown' } do
        content_tag :i, nil, class: 'icon wb-download'
      end
      list = content_tag :ul, class: 'dropdown-menu bullet dropdown-menu-right' do
        yield
      end
      content << list
      content
    end
  end

  def export_pdf_to(path)
    content_tag :li do
      link_to path do
        content = content_tag :i, nil, class: 'icon wb-file'
        content << t('global.links.export.pdf')
        content
      end
    end
  end

  def export_xls_to(path)
    content_tag :li do
      link_to path do
        content = content_tag :i, nil, class: 'icon wb-table'
        content << t('global.links.export.xls')
        content
      end
    end
  end
end
