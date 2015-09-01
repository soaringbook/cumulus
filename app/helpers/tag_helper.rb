module TagHelper
  def boolean_tag value
    value_class = value ? 'check teal' : 'close red'
    content_tag :i, nil, class: "icon wb-#{value_class}-600"
  end

  def search_form_tag path
    form_tag path, method: :get do
      content_tag :div, nil, class: 'input-search input-search-dark' do
        content = content_tag(:i, nil, class: 'input-search-icon wb-search', aria: { hidden: 'true'})
        content << text_field_tag(:search, params[:search], placeholder: 'Search', class: 'form-control', autofocus: true)
        content
      end
    end
  end
end
