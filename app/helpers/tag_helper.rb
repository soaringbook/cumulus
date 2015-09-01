module TagHelper
  def boolean_tag value
    value_class = value ? 'check teal' : 'close red'
    content_tag :i, nil, class: "icon wb-#{value_class}-600"
  end
end
