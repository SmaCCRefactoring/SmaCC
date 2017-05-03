actions
annotationsInOriginalRange: range
	| first last |
	first := self intervalContaining: range first.
	last := range isEmpty
		ifTrue: [ first ]
		ifFalse: [ self intervalContaining: range last ].
	^ (first annotationsTo: last) ifNil: [ (last annotationsTo: first) ifNil: [ #() ] ]