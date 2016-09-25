compiling-scanner
splitIfTrueBranchFrom: aParseTree usingName: aSelector into: modelClass
	| blocks |
	blocks := SortedCollection sortBlock: [ :a :b | a key > b key ].
	aParseTree body
		nodesDo:
			[ :each | 
			(each isBlock
				and:
					[ each parent isMessage
						and:
							[ each parent selector = #ifTrue:
								and: [ each body lastIsReturn or: [ each containsReturn not ] ] ] ])
				ifTrue:
					[ | literalCount |
					literalCount := self countLiteralsIn: each.
					literalCount > 2
						ifTrue: [ blocks add: literalCount -> each ] ] ].
	blocks notEmpty
		ifTrue:
			[ | blockToExtract method body |
			blockToExtract := blocks first value.
			method := RBMethodNode
				selector: aSelector
				body: blockToExtract body copy.
			body := RBMessageNode
				receiver: (RBVariableNode named: 'self')
				selector: aSelector.
			blockToExtract containsReturn
				ifTrue: [ body := RBReturnNode value: body ].
			blockToExtract
				replaceNode: blockToExtract body
				withNode: (RBSequenceNode statements: (OrderedCollection with: body)).
			self compileScannerTree: method into: modelClass.
			^ true ].
	^ false