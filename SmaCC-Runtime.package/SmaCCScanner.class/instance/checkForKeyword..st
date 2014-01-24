private
checkForKeyword: aString
	| stateMap action oldActions |
	action := matchActions isSymbol ifTrue: [matchActions] ifFalse: [matchActions first].
	stateMap := self class keywordMap at: action ifAbsent: [nil].
	stateMap isNil ifTrue: [^self].
	oldActions := matchActions.
	matchActions := stateMap at: (self keywordFor: aString) ifAbsent: [matchActions].
	matchActions isInteger ifTrue: [matchActions := (Array with: matchActions) , oldActions]