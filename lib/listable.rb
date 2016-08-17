module Listable
  def format_date
  	if type == "event"
    	dates = self.start_date ? 
    			Chronic.parse(self.start_date).strftime('%a %d %b %Y').to_s : ''
    	dates << ' -- '
    	dates <<  Chronic.parse(self.end_date).strftime('%a %d %b %Y').to_s if self.end_date
    	dates = "N/A" if dates == ' -- '
    	return 'Dates: ' + dates
    end
    if type == "todo"
    	if self.due
    		date = Chronic.parse(self.due).strftime('%a %d %b %Y').to_s
    		date = date.red if Date.today.strftime('%a %d %b %Y').to_s > date 
    	else
    		date = 'No due date'
    	end
    	return 'Due: '+ date
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