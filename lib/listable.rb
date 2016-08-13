module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end
  def format_date(options = {})
  	if options[:type] == "event"
    	dates = options[:start_date] ? Chronic.parse(options[:start_date]).strftime('%a %d %b %Y').to_s : ""
    	dates << " -- " + dates = Chronic.parse(options[:end_date]).strftime('%a %d %b %Y').to_s if options[:end_date]
    	dates = "N/A" if dates == ""
    	return dates
    end
    if options[:type] == "todo"
    	options[:due] ? dates = Chronic.parse(options[:due]).strftime('%a %d %b %Y').to_s : 
    	"No due date"
  	end
  end
  def format_priority(priority)
    if priority == "high"
    	return " ⇧" 
    elsif priority == "medium"
    	return " ⇨" 
    elsif priority == "low"
    	return " ⇩" 
    elsif !priority
    	return "" 
    else
    	raise UdaciListErrors::InvalidPriorityValue.new, "#{'Invalid priority value.'.magenta}"
    end
  end
  def all

  end
end