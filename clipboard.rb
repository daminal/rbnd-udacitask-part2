# This commit: 
# "Cleaned up App.rb, Fixed error implementation in UdaciList.delete."
# Ideas for improvements
# 
# Event.rb
#
# Udacilist.rb (a module)
# Raise error if call udacilist.rb with an improper option.
#
# Listable (creates list)
#
# 
# note.rb 
# Create a "note" type.
# 
# link.rb
# 
# 
# 
# gemfile
# 
# 
# Questions
# listable.rb: format_date: Why did I have to have "return dates" rather than just "dates"
# UdaciList.add: is there a way that in one line of code I could add an item to the correct class?
# 
# 
# 
# 
# This is how func udacilist > all will work now. 
# it is now a comsomething that determines if the list is empty and collects a hash
# with added item numbering.
# Format: {:title, :headings, :items(with numbering)}
# Sources: @title, ['', 'type', 'details'], [func item_num, Item hash from Item, 
# parsed by: Udacilist.description, Listable.format_date, Item.details.]
# It sends that hash to print_table, which just hands the hash to terminal-table.
# IOW, each Item sends over {@description, @type, @details.}
# 
# Next steps (start with simplest changes):
# XUdacilist: replace func add NoType error with InvalidType error and us in selection
# and change name in Errors::UdaciListErrors. Create func headings, func items.
# XRemove item number and item_number from all. 
# XSo all calls these: item_number, headings, Item.  
# XMove table formatting to it from print_table. Change all to take a hash from Item.
# XChange each item to send description, type, and details. 
# 
# XEach Item class (test after each step):
# XRemove format_description (then listable.format_description)
# 
# Change Udacilist.selection:
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