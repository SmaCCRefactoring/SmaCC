private
scannerError
	| string |
	(stream atEnd and: [start == stream position]) 
		ifTrue: 
			[string := ''.
			matchActions := self eofTokenId]
		ifFalse: 
			[stream position: start.
			string := String with: stream next.
			matchActions := #(0)].
	returnMatchBlock value: (self createTokenFor: string)