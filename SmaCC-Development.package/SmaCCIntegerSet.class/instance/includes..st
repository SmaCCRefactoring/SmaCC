testing
includes: anInteger
	anInteger < start
		ifTrue: [ ^ false ].
	self defaultRunSize * run + start <= anInteger
		ifTrue: [ ^ false ].
	^ self
		includes: anInteger
		in: data
		startingAt: start
		withRun: run