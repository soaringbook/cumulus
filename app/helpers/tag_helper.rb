module TagHelper
  def title_tag(title, icon)
    content_tag :h3, class: 'top-spacing' do
      content = content_tag :i, nil, class: "fa #{icon}"
      content << " #{title.upcase}"
      content
    end
  end

  def avatar_image_tag(avatar, version, options = {})
    non_retina = "#{avatar.url(version, :non_retina)}"
    retina = "#{avatar.url(version, :retina)} 2x"
    image_tag non_retina, options.merge(srcset: retina)
  end

  def boolean_tag(value)
    value_class = value ? 'check text-navy' : 'close text-danger'
    content_tag :i, nil, class: "fa fa-#{value_class}"
  end

  def rights_tag(value, is_admin)
    value_class = 'lock text-danger'
    original_title = t('pages.rights.labels.no_access')
    if is_admin || value.to_s.end_with?('_writable')
      value_class = 'pencil text-navy'
      original_title = t('pages.rights.labels.writable')
    elsif value.to_s.end_with?('_readable')
      value_class = 'eye text-warning'
      original_title = t('pages.rights.labels.readable')
    end
    content_tag :i, nil, class: "fa fa-#{value_class} btn-tooltip", data: { toggle: 'tooltip', 'original-title' => original_title }
  end

  def search_form_tag(path, placeholder)
    form_tag path, method: :get, class: 'navbar-form-custom' do
      content_tag :div, nil, class: 'form-group' do
        text_field_tag(:search, params[:search], placeholder: placeholder, class: 'form-control', autofocus: true)
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
      content_tag :div, class: 'radio' do
        content = form.radio_button field, value
        content << form.label("#{field}_#{value}", t("pages.rights.radio.#{value}"))
        content
      end
    end
  end
end
