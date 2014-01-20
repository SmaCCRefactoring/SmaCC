SmaCCStringInterval is a SmaCCInterval that represents a string that is insert into the SmaCCString.

Instance Variables:
	id	<Integer>	a unique id for the operation
	isRemoved	<Boolean>	is this interval removed?
	next	<SmaCCStringInterval>	the next interval in the string
	previous	<SmaCCStringInterval>	the previous interval in the string
	start	<Integer>	the starting location in the string
	stop	<Integer>	the ending location in the string
	string	<String>	the text that we are inserting -- we are only inserting from the start index to the stop index

