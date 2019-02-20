processing
processMatchFor: pattern and: anAstNode result: aBoolean
	(self findResultFor: pattern)
		nodes:
			(anAstNode isCollection
				ifTrue: [ anAstNode ]
				ifFalse: [ Array with: anAstNode ]);
		matched: aBoolean