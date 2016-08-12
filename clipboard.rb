#This commit: udacilist.rb: created list.filter('type'); event.rb: reenabled no due date and created self.all; link.rb: made default site name and created self.all; todo.rb: created self.all; listable.rb: created default value for start_date of ''. WHY?
#
# Ideas for improvements
# 
# Event
# Raise error an end date without start date, as it's actually a todo item.
# Repaired default of N/A for event dates
# 
#
# Udacilist (a module)
# Raise error if call udacilist.rb with an improper option.
# Make default contents "empty"
# There are a few places I could put the option to have no dates resulting in N/A. 
# 1. In type.initialize, 2. in listable::format_date, or in 3. udacilist.filter. 
#
# Listable (creates list)
# Check date format
# 
# note.rb 
# Create a "note" type.
# 
# link.rb
# Created a default for :site_name
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 