regular expression construction
addSpecificREsWithoutActionsTo: aRegularExpression 
	| dfa regex |
	regex := aRegularExpression.
	dfa := regex isNil ifTrue: [nil] ifFalse: [regex asDFA].
	self specificRegularExpressionsDo: 
			[:each | 
			| actions |
			actions := dfa isNil 
						ifTrue: [nil]
						ifFalse: [dfa actionForSpecificRegularExpression: each].
			actions isNil 
				ifTrue: [regex isNil ifTrue: [regex := each] ifFalse: [regex := regex | each]]].
	^regex