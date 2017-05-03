private
equivalentNodeTo: aNode in: otherTree
	| equivParent nodeIndex equivNode |
	aNode isMethod
		ifTrue: [ ^ otherTree ].
	(aNode parent isReturn and: [ aNode parent parent parent isMethod ])
		ifTrue: [ "Hack to handle the inserted return statements"
			equivNode := otherTree isSequence
				ifTrue: [ otherTree statements last ]
				ifFalse: [ otherTree ].
			^ equivNode isReturn
				ifTrue: [ equivNode value ]
				ifFalse: [ equivNode ] ].
	aNode parent isMethod
		ifTrue: [ otherTree isSequence
				ifTrue: [ ^ otherTree ]
				ifFalse: [ ^ otherTree parent ] ].
	equivParent := self equivalentNodeTo: aNode parent in: otherTree.
	equivParent isNil
		ifTrue: [ ^ nil ].
	nodeIndex := aNode parent children identityIndexOf: aNode.
	^ equivParent children at: nodeIndex ifAbsent: [ nil ]