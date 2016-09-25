private
checkForKeyword: aString
	| stateMap action oldActions entry |
	action := matchActions isSymbol
		ifTrue: [ matchActions ]
		ifFalse: [ matchActions first ].
	stateMap := self class keywordMap at: action ifAbsent: [ nil ].
	stateMap isNil
		ifTrue: [ ^ self ].
	oldActions := matchActions.
	entry := stateMap at: (self keywordFor: aString) ifAbsent: [ nil ].
	entry isNil
		ifTrue: [ ^ self ].
	entry isInteger
		ifTrue: [ matchActions := entry ]
		ifFalse:
			[ (entry last includes: state)
				ifFalse: [ ^ self ].
			matchActions := entry first ].
	matchActions isInteger
		ifTrue: [ matchActions := (Array with: matchActions) , oldActions ]