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
      if object.public_send(column).boolean?
        content << content_tag(:td, boolean_tag(object.public_send(column)))
      else
        content << content_tag(:td, object.public_send(column))
      end
    end
    content.html_safe
  end
end
