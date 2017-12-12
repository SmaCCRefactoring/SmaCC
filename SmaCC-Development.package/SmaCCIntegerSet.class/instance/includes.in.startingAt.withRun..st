private
includes: anInteger in: currentData startingAt: currentStart withRun: currentRun
	| isBits offset |
	currentData == 1
		ifTrue: [ ^ true ].
	currentData == 0
		ifTrue: [ ^ false ].
	isBits := currentRun = self byteSize.
	offset := (anInteger - currentStart) // currentRun + 1.
	^ isBits
		ifTrue: [ ((currentData at: offset) bitAnd: (1 bitShift: (anInteger - currentStart) \\ currentRun)) ~~ 0 ]
		ifFalse: [ self
				includes: anInteger
				in: (currentData at: offset)
				startingAt: currentStart + ((offset - 1) * currentRun)
				withRun: (self nextRunFrom: currentRun) ]