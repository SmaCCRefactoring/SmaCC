private
typesForTree: aRBProgramNode
	aRBProgramNode isReturn
		ifTrue: [ ^ self typesForTree: aRBProgramNode value ].
	(aRBProgramNode isSequence and: [ aRBProgramNode statements notEmpty ])
		ifTrue: [ 
			| types |
			types := Set withAll: (self typesForTree: aRBProgramNode statements last).
			aRBProgramNode
				nodesDo: [ :each | 
					each isReturn
						ifTrue: [ types addAll: (self typesForTree: each value) ] ].
			^ types asArray ].
	aRBProgramNode isLiteralNode
		ifTrue: [ ^ Array with: (self model classFor: aRBProgramNode value class) ].
	^ Array with: (self model classFor: Object)