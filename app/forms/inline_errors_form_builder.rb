class InlineErrorsFormBuilder < ActionView::Helpers::FormBuilder
  def inline_errors(attribute)
    return unless @object.errors.include?(attribute)

    @template.content_tag(:ul, class: 'field-inline-errors') do
      @object.errors.full_messages_for(attribute).map do |message|
        @template.content_tag(:li, message, class: 'field-inline-error')
      end.join.html_safe
    end
  end

  def inline_errors_categories
    return unless @object.errors.include?(:category_ids)

    message = @object.errors.generate_message(:category_ids, :blank)
    @template.content_tag(:ul, class: 'field-inline-errors') do
      @template.content_tag(:li, message, class: 'field-inline-error')
    end
  end
end
