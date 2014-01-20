private
checkForKeyword: aString 
	| stateMap action |
	action := matchActions isSymbol 
				ifTrue: [matchActions]
				ifFalse: [matchActions first].
	stateMap := self class keywordMap at: action ifAbsent: [nil].
	stateMap isNil ifTrue: [^self].
	matchActions := stateMap at: (self keywordFor: aString)
				ifAbsent: [matchActions].
	matchActions isInteger 
		ifTrue: [matchActions := Array with: matchActions with: action]