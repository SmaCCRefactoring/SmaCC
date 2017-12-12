private
privateIntersect: aCollection
	| otherRun otherData |
	otherRun := aCollection run.
	otherData := aCollection data.
	[ run > otherRun ]
		whileTrue: [ run := self nextRunFrom: run.
			data := self reduceData: data ].
	[ otherRun > run ]
		whileTrue: [ otherRun := self nextRunFrom: otherRun.
			otherData := self reduceData: otherData ].
	data := self intersect: data with: otherData.
	normalized := false.
	^ self