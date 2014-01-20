private
startingNodeWithoutUnnecessaryDefaultTransition
	| edge |
	self transitions size = 1 ifFalse: [^self].
	edge := self transitions first.
	(edge includes: #default) ifTrue: [^edge to].
	^self