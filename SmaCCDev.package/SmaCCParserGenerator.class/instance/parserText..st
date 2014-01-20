accessing
parserText: text 
	self parserCodeHolder contents: text.
	self parserCodeHolder contentsMorph setText: text.
