enumerating
do: aBlock over: currentData startingAt: currentStart withRun: currentRun
	| index offset nextRun |
	currentData = 0
		ifTrue: [ ^ self ].
	currentData = 1
		ifTrue: [ ^ currentStart to: currentStart + (currentRun * self defaultRunSize) - 1 do: [ :i | aBlock value: i ] ].
	index := currentStart.
	currentRun = self byteSize
		ifTrue: [ 
			currentData
				do: [ :each | 
					| bits |
					bits := each.
					offset := 0.
					[ bits = 0 ]
						whileFalse: [ 
							bits odd
								ifTrue: [ aBlock value: offset + index ].
							offset := offset + 1.
							bits := bits bitShift: -1 ].
					index := index + currentRun ].
			^ self ].
	nextRun := self nextRunFrom: currentRun.
	currentData
		do: [ :each | 
			self
				do: aBlock
				over: each
				startingAt: index
				withRun: nextRun.
			index := index + currentRun ]