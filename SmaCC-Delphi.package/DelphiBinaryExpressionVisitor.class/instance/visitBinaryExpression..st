visiting
visitBinaryExpression: aBinaryExpression
	| pulledUp temp parent current |
	current := aBinaryExpression.
	[ (current rightExpression isKindOf: DelphiBinaryExpressionNode)
		and:
			[ current rightExpression leftParens isEmpty
				and:
					[ self
						isPrecedenceOf: current operator value
						higherThan: current rightExpression operator value ] ] ]
		whileTrue:
			[ parent := current parent.
			pulledUp := current rightExpression.
			temp := pulledUp leftExpression.
			pulledUp leftExpression: current.
			current rightExpression: temp.
			pulledUp parent: parent.
			temp := pulledUp leftParens.
			pulledUp leftParens: pulledUp leftExpression leftParens.
			pulledUp leftExpression leftParens: temp.
			temp := pulledUp rightParens.
			pulledUp rightParens: pulledUp leftExpression rightParens.
			pulledUp leftExpression rightParens: temp.
			pulledUp removePositions.
			pulledUp leftExpression removePositions.
			1 to: pulledUp parent class instSize do:
				[ :i | 
				| var index |
				var := pulledUp parent instVarAt: i.
				var == current
					ifTrue: [ pulledUp parent instVarAt: i put: pulledUp ].
				(var isKindOf: SequenceableCollection)
					ifTrue:
						[ index := var identityIndexOf: current.
						index > 0
							ifTrue: [ var at: index put: pulledUp ] ] ].
			pulledUp removeAttributeNamed: #startPosition.
			current removeAttributeNamed: #stopPosition.
			current := pulledUp ].
	self acceptNode: current leftExpression.
	self acceptNode: current rightExpression.
	^ current