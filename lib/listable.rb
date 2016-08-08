module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end
  def format_date(type, options = {})
  	#puts options
    if type == "event"
    	dates = options[:start_date].strftime("%D") if options[:start_date]
    	dates << " -- " + options[:end_date].strftime("%D") if options[:end_date]
    	dates = "N/A" if !dates
    	return dates
    end
    if type == "todo"
    	options[:due] ? options[:due].strftime("%D") : "No due date"
  	end
  end
end
