private
charactersAtAndBefore: stopPosition matchesToken: aSmaCCToken
	| string position |
	position := stopPosition.
	position isNil ifTrue: [^false].
	string := aSmaCCToken value.
	string size
		to: 1
		do:
			[:i | 
			(string at: i) = (self originalSource at: position) ifFalse: [^false].
			position := self previousIndex: position].
	^true