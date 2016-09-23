SmaCCScanner is an abstract class that represents a scanner for the parser. The scanner converts its string input into SmaCCToken objects that the parser then uses for its parsing.

Subclasses must implement the following messages:
	accessing
		emptySymbolTokenId
		errorTokenId
		scanForToken

Instance Variables:
	comments	<OrderedCollection>	a collection of comment intervals (array of start position & stop position)
	currentCharacter	<Character>	the current character we are scanning
	lastMatchWasEmpty	<Boolean>	was our last scanning match an empty string -- don't allow two empty matches in a row
	lastOutputStreamMatchPosition	<Integer>	the position in the outputStream of the last match
	matchActions	<Array | Symbol>	the actions for the last match (a symbol means that the action should be performed on the scanner)
	matchEnd	<Integer>	the position of the last match in the stream (our input stream)
	outputStream	<PositionableStream>	the matched characters go in this stream. After a match is made, we take this stream's contents and create a token object.
	returnMatchBlock	<BlockClosure>	when we match a token evaluate this block with the token (hack to return from multiple levels)
	start	<Integer>	the starting position of a match in the stream
	state	<Symbol>	the state of the scanner
	stream	<Stream>	our input


