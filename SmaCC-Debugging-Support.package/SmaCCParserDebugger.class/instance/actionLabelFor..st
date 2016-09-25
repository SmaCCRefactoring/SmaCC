building
actionLabelFor: anInteger
	| type parser |
	parser := self parser.
	type := anInteger bitAnd: parser actionMask.
	type = parser acceptAction
		ifTrue: [ ^ 'Accept' ].
	type = parser shiftAction
		ifTrue: [ ^ 'Shift' ].
	type = parser reduceAction
		ifTrue: [ ^ self reduceActionName: (anInteger bitShift: -2) ].
	^ 'Multiple'