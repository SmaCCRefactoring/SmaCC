instance creation
named: aString state: anInteger parser: aSmaCCParser
	^ self new
		name: aString;
		state: anInteger;
		parser: aSmaCCParser;
		yourself