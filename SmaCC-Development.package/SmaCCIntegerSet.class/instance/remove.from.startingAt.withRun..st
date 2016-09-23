private
remove: anInteger from: currentData startingAt: currentStart withRun: currentRun
	| newData isBits offset |
	currentData == 0
		ifTrue: [ ^ 0 ].
	isBits := currentRun = self byteSize.
	newData := currentData == 1
		ifTrue:
			[ isBits
				ifTrue: [ ByteArray new: self defaultRunSize withAll: 16rFF ]
				ifFalse: [ Array new: self defaultRunSize withAll: 1 ] ]
		ifFalse: [ currentData ].
	offset := (anInteger - currentStart) // currentRun + 1.
	isBits
		ifTrue:
			[ newData
				at: offset
				put:
					((newData at: offset)
						bitAt: (anInteger - currentStart) \\ currentRun + 1
						put: 0) ]
		ifFalse:
			[ newData
				at: offset
				put:
					(self
						remove: anInteger
						from: (newData at: offset)
						startingAt: currentStart + ((offset - 1) * currentRun)
						withRun: (self nextRunFrom: currentRun)) ].
	^ (newData allSatisfy: [ :each | each == 0 ])
		ifTrue: [ 0 ]
		ifFalse: [ newData ]