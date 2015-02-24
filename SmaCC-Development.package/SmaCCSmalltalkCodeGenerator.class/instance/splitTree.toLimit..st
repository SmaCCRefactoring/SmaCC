private
splitTree: aTree toLimit: aTargetSize
	"This code split long methods by generating methods with names such as scanSplitX (normal scan approach) and scanSplitSeqX (splitting inside sequences)."
	
	"The algorithm uses the number of literal nodes in the tree as a proxy for the length and for the fact that a method with more than 64 literals in the bytecode won't be jitted in Cog. It first tries to find a direct split (usually a `@Cond ifTrue: [`@.Stmts] where the `@.Stmts ends with a return) and extract that to a scanSplit method, then it tries to cut long sequences (a `@.Stmts ending with a return larger than the target) to replace the end with a scanSplitSeq."
	
	"It routinely makes jit-able methods except in a few cases where it fails (just slightly larger), gaining 20 to 30% on parsers benchmarks for the StParser and PythonParser2, and making sure they do compile at all."

	| allChildren callTargets splitSeqTargets newMethod |
	aTree nodesDo: [ :e | e propertyAt: #numLiterals ifAbsentPut: [ (e allChildren select: #isLiteralNode) size ] ].
	allChildren := aTree allChildren.
	callTargets := allChildren
		select: [ :e | 
			e isSequence
				and: [ 
					e lastIsReturn
						and: [ e parent ~~ aTree and: [ (e propertyAt: #numLiterals) > 45 and: [ (e propertyAt: #numLiterals) < aTargetSize ] ] ] ] ].
	splitSeqTargets := allChildren
		select: [ :e | e isSequence and: [ e lastIsReturn and: [ (e propertyAt: #numLiterals) > aTargetSize and: [ e temporaries isEmpty ] ] ] ].
	callTargets := callTargets sorted: [ :a :b | (a propertyAt: #numLiterals) > (b propertyAt: #numLiterals) ].
	splitSeqTargets := splitSeqTargets sorted: [ :a :b | (a propertyAt: #numLiterals) > (b propertyAt: #numLiterals) ].
	newMethod := nil.
	[ callTargets notEmpty and: [ newMethod isNil ] ]
		whileTrue: [ 
			| current |
			current := callTargets removeFirst.
			splitIndex := splitIndex + 1.
			newMethod := ('scanSplit' , splitIndex printString) -> current.
			current replaceWith: (RBParser parseExpression: '^ self scanSplit' , splitIndex printString) ].
	[ newMethod isNil and: [ splitSeqTargets notEmpty ] ]
		whileTrue: [ 
			| current sz |
			current := splitSeqTargets removeFirst.
			(sz := current children last propertyAt: #numLiterals) < aTargetSize
				ifTrue: [ 
					| j currentChild currentCopy oldSz |
					j := current children size.
					[ sz < aTargetSize and: [ j > 2 ] ]
						whileTrue: [ 
							j := j - 1.
							oldSz := sz.
							sz := sz + ((current children at: j) propertyAt: #numLiterals) ].
					currentChild := current children at: j + 1.
					oldSz > 25
						ifTrue: [ 
							splitIndex := splitIndex + 1.
							currentCopy := current copy.
							currentCopy statements: (currentCopy statements copyFrom: j + 1 to: currentCopy statements size).
							newMethod := ('scanSplitSeq' , splitIndex printString) -> currentCopy.
							currentChild replaceWith: (RBParser parseExpression: '^ self scanSplitSeq' , splitIndex printString).
							((j + 2 to: current statements size) collect: [ :k | current statements at: k ])
								do: [ :e | current removeNode: e ] ] ] ].
	^ newMethod notNil
		ifTrue: [ 
			self compile: newMethod key inside: newMethod value.
			true ]
		ifFalse: [ false ]