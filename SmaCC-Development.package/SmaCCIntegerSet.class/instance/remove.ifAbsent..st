removing
remove: anInteger ifAbsent: aBlock
	(self includes: anInteger)
		ifFalse: [ ^ aBlock value ].
	data := self
		remove: anInteger
		from: data
		startingAt: start
		withRun: run.
	normalized := false.
	^ anInteger