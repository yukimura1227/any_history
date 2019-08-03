# for event decorator
class EventDecorator < Draper::Decorator
  delegate_all

  def event_link
    url.present? ? h.link_to(title, url, target: '_blank') : title
  end
end
