module ApplicationHelper
  def icon(name, text)
    content_tag(:span, nil, class: "fa fa-#{name}") +
    "\n" + h(text)
  end
end
