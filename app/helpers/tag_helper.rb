module TagHelper
  def title_tag(title, icon)
    content_tag :h4 do
      content = content_tag :i, nil, class: "icon #{icon}"
      content << title.upcase
      content
    end
  end

  def avatar_image_tag(avatar, version, options = {})
    non_retina = "#{avatar.url(version, :non_retina)}"
    retina = "#{avatar.url(version, :retina)} 2x"
    image_tag non_retina, options.merge(srcset: retina)
  end

  def boolean_tag(value)
    value_class = value ? 'check teal' : 'close red'
    content_tag :i, nil, class: "icon wb-#{value_class}-600"
  end

  def rights_tag(value, is_admin)
    value_class = 'lock red'
    original_title = t('pages.rights.labels.no_access')
    if is_admin || value.to_s.end_with?('_writable')
      value_class = 'pencil teal'
      original_title = t('pages.rights.labels.writable')
    elsif value.to_s.end_with?('_readable')
      value_class = 'eye orange'
      original_title = t('pages.rights.labels.readable')
    end
    content_tag :i, nil, class: "icon wb-#{value_class}-600", data: { toggle: 'tooltip', 'original-title' => original_title }
  end

  def search_form_tag(path)
    form_tag path, method: :get do
      content_tag :div, nil, class: 'input-search input-search-dark' do
        content = content_tag(:i, nil, class: 'input-search-icon wb-search', aria: { hidden: 'true' })
        content << text_field_tag(:search, params[:search], placeholder: 'Search', class: 'form-control')
        content
      end
    end
  end

  def checkbox_tag(form, field)
    content_tag :div, class: 'form-group' do
      content_tag :div, class: 'checkbox' do
        content = form.check_box field
        content << form.label(field)
        content
      end
    end
  end

  def radio_tag(form, field, value)
    content_tag :div, class: 'form-group' do
      content_tag :div, class: 'radio-custom radio-primary' do
        content = form.radio_button field, value
        content << form.label("#{field}_#{value}", t("pages.rights.radio.#{value}"))
        content
      end
    end
  end
end
