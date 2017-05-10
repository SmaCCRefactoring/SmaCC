private
indexForLiteralOrVariableNode: aRBProgramNode
	| index |
	(aRBProgramNode isVariable or: [ aRBProgramNode isLiteralNode ])
		ifFalse: [ ^ nil ].
	aRBProgramNode isVariable
		ifTrue: [ ^ rhs indexOfVariable: aRBProgramNode name ].
	aRBProgramNode value isString
		ifFalse: [ ^ nil ].
	(aRBProgramNode value allSatisfy: [ :each | each isDigit ])
		ifTrue: [ index := Integer readFrom: (ReadStream on: aRBProgramNode value).
			(index between: 1 and: rhs size)
				ifTrue: [ ^ index ] ].
	^ nil