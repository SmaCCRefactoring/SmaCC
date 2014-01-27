generated
reduceActionForinit_declaration1: nodes
	(nodes at: 1) first value = 'typedef'
		ifTrue:
			[1
				to: (nodes at: 2) size
				by: 2
				do: [:i | self addTypeName: ((nodes at: 2) at: i) value]].
	^self reduceFor: nodes