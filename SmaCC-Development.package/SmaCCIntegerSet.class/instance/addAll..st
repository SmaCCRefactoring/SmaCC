adding
addAll: aCollection
	| otherData otherRun tempData |
	(self class == aCollection class and: [ start = aCollection start ])
		ifFalse: [ ^ super addAll: aCollection ].
	data == 0
		ifTrue: [ data := self copyData: aCollection data.
			run := aCollection run ]
		ifFalse: [ otherRun := aCollection run.
			otherData := aCollection data.
			[ run < otherRun ]
				whileTrue: [ run := run * self defaultRunSize.
					tempData := Array new: self defaultRunSize withAll: 0.
					tempData at: 1 put: data.
					data := tempData ].
			[ run > otherRun ]
				whileTrue: [ otherRun := otherRun * self defaultRunSize.
					tempData := Array new: self defaultRunSize withAll: 0.
					tempData at: 1 put: otherData.
					otherData := tempData ].
			data := self merge: data with: otherData ].
	normalized := false.
	^ aCollection