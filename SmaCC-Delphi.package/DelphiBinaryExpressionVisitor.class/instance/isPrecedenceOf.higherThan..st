testing
isPrecedenceOf: op1String higherThan: op2String
	| index1 index2 |
	index1 := self precedenceOf: op1String.
	index2 := self precedenceOf: op2String.
	^ index1 notNil
		and:
			[ index2 notNil
				and:
					[ index1 > index2
						or: [ index1 = index2 and: [ self isLeftAssociative: op1String ] ] ] ]