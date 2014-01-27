private
charactersAtAndAfter: startPosition matchesToken: aSmaCCToken
	| string position |
	position := startPosition.
	position isNil ifTrue: [^false].
	string := aSmaCCToken value.
	1
		to: string size
		do:
			[:i | 
			(string at: i) = (self originalSource at: position) ifFalse: [^false].
			position := self nextIndex: position].
	^true