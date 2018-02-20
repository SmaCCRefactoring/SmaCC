private
actionLabelFor: anInteger
	| type |
	type := anInteger bitAnd: host actionMask.
	type = host acceptAction
		ifTrue: [ ^ 'Accept' ].
	type = host shiftAction
		ifTrue: [ ^ 'Shift' ].
	type = host reduceAction
		ifTrue: [ ^ self reduceActionName: (anInteger bitShift: -2) ].
	^ 'Multiple'