module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end
  def format_date(options = {})
  	if options[:type] == "event"
    	dates = options[:start_date] ? Chronic.parse(options[:start_date]).to_s : ""
    	dates << " -- " + dates = Chronic.parse(options[:end_date]).to_s if options[:end_date]
    	dates = "N/A" if dates == ""
    	return dates
    end
    if options[:type] == "todo"
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