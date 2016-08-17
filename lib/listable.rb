module Listable
  def format_description(description)
    "#{description}"#.ljust(30)
  end
  def format_date(options = {})
  	if options[:type] == "event"
    	dates = options[:start_date] ? Chronic.parse(options[:start_date]).strftime('%a %d %b %Y').to_s : ""
    	dates << " -- " + dates = Chronic.parse(options[:end_date]).strftime('%a %d %b %Y').to_s if options[:end_date]
    	dates = "N/A" if dates == ""
    	return "Dates: #{dates}"
    end
    if options[:type] == "todo"
    	if options[:due] 
    		date = Chronic.parse(options[:due]).strftime('%a %d %b %Y').to_s
    		Date.today.strftime('%a %d %b %Y').to_s > date ? date = date.red : date = date
    	else
    		date = "No due date"
    	end
    	return "Due: #{date}"
  	end
  end
  def format_priority(priority)
    if priority == "high"
    	return " ⇧".light_red 
    elsif priority == "medium"
    	return " ⇨".light_yellow
    elsif priority == "low"
    	return " ⇩".light_blue
    elsif !priority
    	return "" 
    else
    	raise UdaciListErrors::InvalidPriorityValue.new, 'Invalid priority value.'.magenta
    end
  end
end