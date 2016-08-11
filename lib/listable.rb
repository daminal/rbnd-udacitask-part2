module Listable
  def format_description(description = "Untitled List")
    "#{description}".ljust(30)
  end
  def format_date(options = {})
  	if options.has_key?(:start_date)
    	dates = Chronic.parse(options[:start_date]).to_s
    	dates << " -- " + dates = Chronic.parse(options[:end_date]).to_s if options[:end_date]
    	dates = "N/A" if !dates
    	return dates
    end
    if options.has_key?(:due)
    	options[:due] ? dates = Chronic.parse(options[:due]).to_s : "No due date"
  	end
  end
  def format_priority(priority)
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end
end