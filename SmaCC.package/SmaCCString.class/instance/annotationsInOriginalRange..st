actions
annotationsInOriginalRange: range
	| first last |
	first := self intervalContaining: range start.
	last := range isEmpty ifTrue: [first] ifFalse: [self intervalContaining: range stop].
	^(first annotationsTo: last) ifNil: [(last annotationsTo: first) ifNil: [#()]]