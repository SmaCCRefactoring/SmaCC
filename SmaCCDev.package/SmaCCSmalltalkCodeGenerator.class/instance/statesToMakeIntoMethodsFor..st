compiling
statesToMakeIntoMethodsFor: aSmaCCNode
	"Adding a case to be able to cut methods which are too long for Pharo Smalltalk to handle."

	| allStates incoming |
	allStates := aSmaCCNode allStates.
	incoming := Dictionary new.
	allStates
		do: [ :each | 
			each transitions
				do: [ :edge | 
					each ~= edge to
						ifTrue: [ (incoming at: edge to ifAbsentPut: [ Set new ]) add: each ] ] ].
	^ (allStates asOrderedCollection
		select: [ :each | 
			aSmaCCNode = each
				or: [ each isTerminalNode not and: [ (incoming at: each ifAbsent: [ #() ]) size > 1 or: [ each needsSeparateMethod ] ] ] ])
		asSortedCollection: [ :a :b | a id < b id ]