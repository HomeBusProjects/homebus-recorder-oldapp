module SamplesHelper
  def nav_class(topic)
    if topic == @active_topic
      'nav-link active'
    else
      'nav-link'
    end
  end
end
