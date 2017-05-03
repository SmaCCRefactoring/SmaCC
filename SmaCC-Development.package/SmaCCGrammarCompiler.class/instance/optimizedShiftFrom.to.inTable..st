action table
optimizedShiftFrom: row to: stateIndex inTable: anArray
	| items action reduceEntry otherAction |
	items := (anArray at: stateIndex) asSet.
	items remove: SmaCCRejectAction id ifAbsent: [  ].
	items size ~= 1
		ifTrue: [ ^ nil ].
	action := items asArray first.
	(action bitAnd: 2r11) = SmaCCReduceAction id
		ifFalse: [ ^ nil ].
	reduceEntry := reduceTable at: (action bitShift: -2).
	reduceEntry last = #liftFirstValue:
		ifFalse: [ ^ nil ].
	reduceEntry second = 1
		ifFalse: [ ^ nil ].
	otherAction := row at: reduceEntry first.
	^ (self
		optimizedShiftFrom: row
		to: (otherAction bitShift: -2)
		inTable: anArray) ifNil: [ otherAction ]