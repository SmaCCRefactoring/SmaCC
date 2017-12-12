private
add: anInteger to: currentData startingAt: currentStart withRun: currentRun
	| newData isBits offset value |
	currentData == 1
		ifTrue: [ ^ 1 ].
	isBits := currentRun = self byteSize.
	newData := currentData == 0
		ifTrue: [ (isBits
				ifTrue: [ ByteArray ]
				ifFalse: [ Array ]) new: self defaultRunSize withAll: 0 ]
		ifFalse: [ currentData ].
	offset := (anInteger - currentStart) // currentRun + 1.
	^ isBits
		ifTrue: [ newData at: offset put: (value := (newData at: offset) bitOr: (1 bitShift: (anInteger - currentStart) \\ currentRun)).
			(value == 16rFF and: [ newData allSatisfy: [ :each | each == 16rFF ] ])
				ifTrue: [ 1 ]
				ifFalse: [ newData ] ]
		ifFalse: [ newData
				at: offset
				put:
					(value := self
						add: anInteger
						to: (newData at: offset)
						startingAt: currentStart + ((offset - 1) * currentRun)
						withRun: (self nextRunFrom: currentRun)).
			(value == 1 and: [ newData allSatisfy: [ :each | each == 1 ] ])
				ifTrue: [ 1 ]
				ifFalse: [ newData ] ]