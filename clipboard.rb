# The question I'm dealing with in this commit is how to import format_date into
# listable.rb. I could check who's calling it, or I could attempt to look at what 
# the calling func is sending as options. The latter works only if 
# options are always sent. 
# I think the quicker is the latter and I might think of something better later.
# The current state of the function makes it a bit worthless as it's simply a 
# repeating of the code found in the two calling classes. 

# How this is done hinges on whether I can look at the symbols present in the options.

#Ideas for improvements
# check date format?
# Question an end date without start date