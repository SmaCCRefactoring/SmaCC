SmaCCTokens are used as the interface objects between scanner and parser. They hold the string that was scanned and its position information. Also, included in the token is its id. The id specifies what type of token it is.

Instance Variables:
	id	<Array of: Integer>	the list of possible token types this represents. There can be overlapping tokens, so we list all of the id here. The default parser only looks at the first id, but we can redefine this behavior in a subclass to look at all possibilities until we find a valid token.
	start	<Integer>	the starting position of the token in the original input
	value	<Object>	the value of our token (normally a string, but could be anything)

