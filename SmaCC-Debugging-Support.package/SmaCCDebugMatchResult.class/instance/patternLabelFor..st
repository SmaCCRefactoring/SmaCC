inspector
patternLabelFor: each
	| text |
	text := (each parent isNil
		ifTrue: [ 'self' ]
		ifFalse: [ each parent patternNode debugLabelForChild: each patternNode ]) asText.
	self formatText: text matched: each matched.
	^ text