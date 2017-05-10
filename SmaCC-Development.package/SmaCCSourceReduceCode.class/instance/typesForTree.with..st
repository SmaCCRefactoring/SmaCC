private
typesForTree: aRBProgramNode with: aSet
	"The set is important when dealing with variables or number literals being returned."

	aRBProgramNode isReturn
		ifTrue: [ ^ self typesForTree: aRBProgramNode value with: aSet ].
	(aRBProgramNode isSequence
		and: [ aRBProgramNode statements notEmpty ])
		ifTrue: [ | types |
			types := Set
				withAll: (self typesForTree: aRBProgramNode statements last with: aSet).
			aRBProgramNode
				nodesDo: [ :each | 
					each isReturn
						ifTrue: [ types addAll: (self typesForTree: each value with: aSet) ] ].
			^ types asArray ].
	(self indexForLiteralOrVariableNode: aRBProgramNode)
		ifNotNil: [ :i | ^ self basicModelTypes: aSet forIndex: i ].
	aRBProgramNode isLiteralNode
		ifTrue: [ ^ Array with: (self model classFor: aRBProgramNode value class) ].
	(aRBProgramNode isMessage
		and: [ aRBProgramNode receiver isVariable
				and: [ aRBProgramNode receiver name = 'SmaCCToken' ] ])
		ifTrue: [ ^ Array with: (self model classFor: SmaCCToken) ].
	^ Array with: (self model classFor: Object)