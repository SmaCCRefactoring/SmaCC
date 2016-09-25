generated-reduction actions
reduceActionForCascade1: nodes
	| messages |
	(nodes at: 2) isEmpty
		ifTrue: [ ^ nodes at: 1 ].
	messages := OrderedCollection new:
		(nodes at: 2) size + 1.
	messages add: (nodes at: 1).
	(nodes at: 2)
		do: [ :each | 
			messages
				add:
					(RBMessageNode
						receiver:
							(nodes at: 1) receiver
						selector: each first contents asSymbol
						arguments: each last) ].
	^ RBCascadeNode messages: messages