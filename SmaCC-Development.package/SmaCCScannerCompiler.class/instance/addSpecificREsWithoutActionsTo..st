regular expression construction
addSpecificREsWithoutActionsTo: aRegularExpression
	| dfa regex |
	regex := aRegularExpression.
	dfa := regex isNil
		ifTrue: [ nil ]
		ifFalse: [ regex asDFA ].
	self
		specificRegularExpressionsDo:
			[ :each | 
			| actions |
			actions := dfa isNil
				ifTrue: [ nil ]
				ifFalse: [ dfa actionForSpecificRegularExpression: each ].
			actions isNil
				ifTrue: [ regex := regex isNil
						ifTrue: [ each ]
						ifFalse: [ regex | each ] ] ].
	^ regex