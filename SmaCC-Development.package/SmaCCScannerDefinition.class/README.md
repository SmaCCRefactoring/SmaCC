SmaCCScannerDefinition is the parsed representation of the scanner. It contains the tokens and states for the scanner.

Instance Variables:
	excludeStates	<Collection>	exclusive states (when we are in one of these, then we shouldn't try to parse the default tokens)
	states	<Collection>	states in the scanner -- if no states are specified, then this will only contain #default
	tokens	<Dictionary>	dictionary mapping token names to their regular expressions

