error
errorType
	| sortedActions |
	sortedActions := self sortedActions.
	^sortedActions first class = sortedActions last class ifTrue: ['Reduce/Reduce Conflict'] ifFalse: ['Shift/Reduce Conflict']