private
sizeOf: currentData withRun: currentRun
	| nextRun |
	currentData == 0
		ifTrue: [ ^ 0 ].
	currentData == 1
		ifTrue: [ ^ currentRun * self defaultRunSize ].
	currentRun == self byteSize
		ifTrue: [ ^ currentData inject: 0 into: [ :sum :each | sum + (self countBits: each) ] ]
		ifFalse: [ nextRun := self nextRunFrom: currentRun.
			^ currentData inject: 0 into: [ :sum :each | sum + (self sizeOf: each withRun: nextRun) ] ]