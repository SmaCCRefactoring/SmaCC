SmaCCLineNumberStream is a wrapper for streams that calculates line numbers.

Instance Variables:
	eolPositions	<OrderedCollection of: Integer>	the positions of each end of line
	lastPosition	<Integer>	the position of the last character that we have calculated the end of line information for (we know the line number for all characters before this position and don't know anything about the characters after this position)
	previousWasCR	<Boolean>	was the previous character a CR. This is used for CR LF streams. A CR LF combination should only increment the line counter by 1
	sourceStream	<Stream>	the stream that we are wrapping
