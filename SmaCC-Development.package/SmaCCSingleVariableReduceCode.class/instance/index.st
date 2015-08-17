accessing
index
	^ indices isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ indices first ]