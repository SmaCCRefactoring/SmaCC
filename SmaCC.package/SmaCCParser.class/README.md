SmaCCParser is an abstract class that defines most of the parsing actions. Subclasses will define methods that specify their transitions and reduction actions. These are normally defined automatically when compiling the parser.

Subclasses must implement the following messages:
	accessing
		emptySymbolTokenId
		reduceTable
		transitionTable

Instance Variables:
	currentToken	<SmaCCToken>	the token last returned by the scanner that has not been shifted (reduce actions leave the current token alone)
	nodeStack	<OrderedCollection>	collection of items on stack. These items are specific to the parser and can be any object. 
	scanner	<SmaCCScanner>	our scanner
	stateStack	<OrderedCollection of: Integer>	the stack of states for our parser (standard LR state stack)

