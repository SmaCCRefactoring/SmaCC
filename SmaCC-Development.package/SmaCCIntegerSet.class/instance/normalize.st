converting
normalize
	normalized
		ifTrue: [ ^ self ].
	normalized := true.
	data := self normalizeData: data.
	[ data = 0
		ifTrue: [ ^ run := self defaultRunSize ].
	data = 1
		ifTrue: [ ^ self ].
	run > self defaultRunSize
		ifFalse: [ ^ self ].
	2 to: data size do: [ :i | 
		(data at: i) = 0
			ifFalse: [ ^ self ] ].
	data := data first.
	run := self nextRunFrom: run ] repeat