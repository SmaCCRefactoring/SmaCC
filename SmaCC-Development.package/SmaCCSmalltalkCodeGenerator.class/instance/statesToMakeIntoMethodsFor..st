compiling
statesToMakeIntoMethodsFor: aSmaCCNode
	"Fun fact about this method: it protects from infinite recursions in the code generation part (but may generate smaller than optimal methods)."
	
	"In the case of Pharo and Smalltalk overall, we optimize code generation afterwards."

	| allStates incoming selectedStates |
	allStates := aSmaCCNode allStates.
	incoming := Dictionary new.
	allStates
		do: [ :each | 
			each transitions
				do: [ :edge | 
					each ~= edge to
						ifTrue: [ (incoming at: edge to ifAbsentPut: [ Set new ]) add: each ] ] ].
	selectedStates := allStates
		select: [ :each | aSmaCCNode = each or: [ each isTerminalNode not and: [ (incoming at: each ifAbsent: [ #() ]) size > 1 ] ] ].
	^ selectedStates asSortedCollection: [ :a :b | a id < b id ]