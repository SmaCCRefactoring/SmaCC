private
add: anInteger to: currentData startingAt: currentStart withRun: currentRun
	| newData isBits offset |
	currentData == 1
		ifTrue: [ ^ 1 ].
	isBits := currentRun = self byteSize.
	newData := currentData == 0
		ifTrue:
			[ (isBits
				ifTrue: [ ByteArray ]
				ifFalse: [ Array ]) new: self defaultRunSize withAll: 0 ]
		ifFalse: [ currentData ].
	offset := (anInteger - currentStart) // currentRun + 1.
	^ isBits
		ifTrue:
			[ newData
				at: offset
				put:
					((newData at: offset)
						bitOr: (1 bitShift: (anInteger - currentStart) \\ currentRun)).
			(newData allSatisfy: [ :each | each == 16rFF ])
				ifTrue: [ 1 ]
				ifFalse: [ newData ] ]
		ifFalse:
			[ newData
				at: offset
				put:
					(self
						add: anInteger
						to: (newData at: offset)
						startingAt: currentStart + ((offset - 1) * currentRun)
						withRun: (self nextRunFrom: currentRun)).
			(newData allSatisfy: [ :each | each == 1 ])
				ifTrue: [ 1 ]
				ifFalse: [ newData ] ]