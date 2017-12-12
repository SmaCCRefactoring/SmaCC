comparing
< aSmaCCIntegerCollection
	| otherData otherRun myData myRun compare |
	self isEmpty
		ifTrue: [ ^ aSmaCCIntegerCollection isEmpty not ].
	aSmaCCIntegerCollection isEmpty
		ifTrue: [ ^ false ].
	self normalize.
	aSmaCCIntegerCollection normalize.
	otherData := aSmaCCIntegerCollection data.
	otherRun := aSmaCCIntegerCollection run.
	myData := data.
	myRun := run.
	[ myRun < otherRun ]
		whileTrue: [ otherRun := self nextRunFrom: otherRun.
			otherData := self reduceData: otherData ].
	[ otherRun < myRun ]
		whileTrue: [ myRun := self nextRunFrom: myRun.
			myData := self reduceData: myData ].
	compare := self
		compareData: myData
		to: otherData
		hasMore: [ :isMine | 
			isMine
				ifTrue: [ run > aSmaCCIntegerCollection run ]
				ifFalse: [ run < aSmaCCIntegerCollection run ] ].
	compare = 0
		ifTrue: [ ^ run < aSmaCCIntegerCollection run ].
	compare < 0
		ifTrue: [ ^ true ].
	^ false