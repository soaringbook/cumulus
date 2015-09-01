module FlashHelper
  def flashes
    if flash[:notice]
      flash_tag flash[:notice], true
    elsif flash[:alert]
      flash_tag flash[:alert], false
    end
  end

  def flash_tag text, success = true
    icon_class = success ? 'check' : 'close'
    alert_class = success ? 'success' : 'danger'
    content_tag :div, class: "alert alert-icon alert-#{alert_class} alert-dismissible", role: 'alert' do
      content = button_tag type: :button, class: 'close', data: { dismiss: 'alert' } do
        content_tag :span, 'x'
      end
      content << content_tag(:i, nil, class: "icon wb-#{icon_class}")
      content << text
      content
    end
  end
end
