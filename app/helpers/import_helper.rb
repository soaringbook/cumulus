module ImportHelper
  def header_columns_for(class_name)
    content = ''
    class_name.importable_display_columns.each do |column|
      content << content_tag(:th, class_name.human_attribute_name(column))
    end
    content.html_safe
  end

  def data_columns_for(class_name, object)
    content = ''
    class_name.importable_display_columns.each do |column|
      value = object.public_send(column)
      content << if value.boolean?
                   content_tag(:td, boolean_tag(value))
                 else
                   content_tag(:td, value)
                 end
    end
    content.html_safe
  end
end
