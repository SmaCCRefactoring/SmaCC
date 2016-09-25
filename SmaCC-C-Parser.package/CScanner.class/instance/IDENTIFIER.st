scanning
IDENTIFIER
	| name |
	name := outputStream contents.
	matchActions := (typeNames includes: name)
		ifTrue: [ Array with: self TypeNameId ]
		ifFalse: [ Array with: self IDENTIFIERId ].
	outputStream reset.
	^ SmaCCToken value: name start: start ids: matchActions