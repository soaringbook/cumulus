module LinkHelper
  def add_link_to(path)
    link_to path, class: 'btn btn-primary' do
      content = content_tag :i, nil, class: 'fa fa-plus'
      content << " #{t('global.links.new')}"
      content
    end
  end

  def edit_link_to(path)
    link_to path, class: 'btn btn-primary btn-sm btn-tooltip', data: { toggle: 'tooltip', 'original-title' => t('global.links.edit') } do
      content_tag :i, nil, class: 'fa fa-wrench'
    end
  end

  def delete_link_to(path)
    link_to path, method: :delete, class: 'btn btn-danger btn-sm btn-tooltip', data: { confirm: t('global.labels.delete_confirmation'), toggle: 'tooltip', 'original-title' => t('global.links.delete') } do
      content_tag :i, nil, class: 'fa fa-trash'
    end
  end

  def edit_action_link_to(path)
    link_to path, class: 'btn btn-primary vertical-align btn-circle' do
      content_tag :i, nil, class: 'fa fa-pencil'
    end
  end

  def show_action_link_to(path)
    link_to path, class: 'btn btn-primary vertical-align btn-circle' do
      content_tag :i, nil, class: 'fa fa-eye'
    end
  end

  def import_link_to(path)
    link_to path, class: 'btn btn-primary' do
      content = content_tag :i, nil, class: 'fa fa-upload'
      content << " #{t('global.links.import')}"
      content
    end
  end

  def export_tag(&_block)
    content_tag :div, class: 'dropdown' do
      content = link_to '#', class: 'dropdown-toggle btn btn-success', data: { toggle: 'dropdown' } do
        inner_content = content_tag :i, nil, class: 'fa fa-download'
        inner_content << " #{t('global.links.export_dropdown')} "
        inner_content << content_tag(:span, nil, class: 'caret')
        inner_content
      end
      list = content_tag :ul, class: 'dropdown-menu pull-right' do
        yield
      end
      content << list
      content
    end
  end

  def export_xls_to(path)
    content_tag :li do
      link_to path do
        content = content_tag :i, nil, class: 'fa fa-table'
        content << " #{t('global.links.export.xls')}"
        content
      end
    end
  end
end
