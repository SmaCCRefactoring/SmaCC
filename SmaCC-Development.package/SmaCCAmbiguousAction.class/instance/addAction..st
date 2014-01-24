accessing
addAction: aSmaCCAction
	aSmaCCAction isAmbiguous
		ifTrue: [actions addAll: aSmaCCAction actions]
		ifFalse: [super addAction: aSmaCCAction]