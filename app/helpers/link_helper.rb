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
end
