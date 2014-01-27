accessing
parseFile: aString
	| source |
	source := self sourceFor: aString.
	^self parserClass parse: source