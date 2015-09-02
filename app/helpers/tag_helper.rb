module TagHelper
  def title_tag(title, icon)
    content_tag :h4 do
      content = content_tag :i, nil, class: "icon #{icon}"
      content << title.upcase
      content
    end
  end

  def avatar_image_tag(avatar, version, options = {})
    non_retina = "#{avatar.url(version, :non_retina)} 1x"
    retina = "#{avatar.url(version, :retina)} 2x"
    image_tag non_retina, options.merge(srcset: retina, class: 'img img-rounded')
  end

  def boolean_tag(value)
    value_class = value ? 'check teal' : 'close red'
    content_tag :i, nil, class: "icon wb-#{value_class}-600"
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
      content_tag :div, class: 'checkbox-custom checkbox-primary' do
        content = form.check_box field
        content << form.label(field)
        content
      end
    end
  end
end
