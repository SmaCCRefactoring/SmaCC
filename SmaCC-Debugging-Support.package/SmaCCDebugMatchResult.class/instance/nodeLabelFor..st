inspector
nodeLabelFor: each
	| text |
	text := (each matchResult parent isNil
		ifTrue: [ 'aNode' ]
		ifFalse: [ each matchResult parent nodeLabelForChild: each node ]) asText.
	self formatText: text matched: each matchResult matched.
	^ text