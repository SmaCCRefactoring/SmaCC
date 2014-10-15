compiling
statesToMakeIntoMethodsFor: aSmaCCNode
	"Adding a case to be able to cut methods which are too long for Pharo Smalltalk to handle."

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
"	allStates
		do: [ :each | 
			(each allTransitionsWith: selectedStates) > self class maxTransitionsInScanMethod
				ifTrue: [ 
					| ts |
					selectedStates add: each.
					ts := (each transitions collect: [ :e | e to ])
						asSortedCollection: [ :a :b | (a allTransitionsWith: selectedStates) > (b allTransitionsWith: selectedStates) ].
					[ ts notEmpty and: [ (each allTransitionsWith: selectedStates) > self class maxTransitionsInScanMethod ] ]
						whileTrue: [ selectedStates add: ts removeFirst ] ] ]."
	^ selectedStates asSortedCollection: [ :a :b | a id < b id ]