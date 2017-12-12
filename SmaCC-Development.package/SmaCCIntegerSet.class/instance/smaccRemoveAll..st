removing
smaccRemoveAll: aCollection
	| otherRun otherData tempData |
	self class == aCollection class
		ifFalse: [ ^ super smaccRemoveAll: aCollection ].
	data == 0
		ifTrue: [ ^ self ].
	otherRun := aCollection run.
	otherData := aCollection data.
	[ run < otherRun ]
		whileTrue: [ otherRun := self nextRunFrom: otherRun.
			otherData := self reduceData: otherData ].
	[ run > otherRun ]
		whileTrue: [ otherRun := otherRun * self defaultRunSize.
			tempData := Array new: self defaultRunSize withAll: 0.
			tempData at: 1 put: otherData.
			otherData := tempData ].
	data := self removeData: otherData from: data.
	normalized := false.
	^ aCollection