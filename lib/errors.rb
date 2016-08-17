module UdaciListErrors
	class InvalidType < StandardError 
	end
	class IndexExceedsListSize < StandardError
	end
	class InvalidPriorityValue < StandardError
	end
	class InvalidDateError < StandardError
	end
	class NoItemsError < StandardError
	end
end

# The question is, how do I use a module to format errors if I have a module holding 
# the classes?