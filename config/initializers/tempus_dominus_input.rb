class TempusDominusInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group date', data: { target_input: 'nearest' }, id: "#{object_name}_#{attribute_name}") do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat div_button
    end
  end

  def input_html_options
    super.merge({class: 'form-control datetimepicker-input'})
  end

  def div_button
    template.content_tag(:div, class: 'input-group-append', data: {target: "##{object_name}_#{attribute_name}", toggle: 'datetimepicker'} ) do
      template.concat span_button
    end
  end

  def span_button
    template.content_tag(:span, class: 'input-group-btn') do
      template.concat calendar_button
    end
  end

  def calendar_button
    template.button_tag(class: 'btn btn-primary', :type => 'button') do
      template.concat icon_table
    end
  end

  def icon_remove
    "<i class='glyphicon glyphicon-remove'></i>".html_safe
  end

  def icon_table
    "<i class='fa fa-calendar'></i>".html_safe
  end
end