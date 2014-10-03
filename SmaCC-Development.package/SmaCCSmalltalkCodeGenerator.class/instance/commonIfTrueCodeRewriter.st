compiling
commonIfTrueCodeRewriter
	^ RBParseTreeRewriter new
		replace:
				'``@.Stmts1.
				(`@a ifTrue: ``@block) `{:node :dictionary | | index myStatements |
						index := node parent statements indexOf: node.
						myStatements := node parent statements.
						dictionary at: #size put: ``@block body statements size - (myStatements size - index).
						index ~~  myStatements size and: [``@block body statements size >= (myStatements size - index) and: [
							(index + 1 to: myStatements size) allSatisfy: [:each | 
								(myStatements at: each) = (``@block body statements at: ``@block body statements size - (myStatements size - each))]]]
						}.
				``@.Stmts3'
			with:
				'``@.Stmts1.
				`{:dictionary | RBMessageNode receiver: `@a selector: #ifTrue: arguments: (Array with: (RBBlockNode body: (RBSequenceNode statements: (``@block body statements copyFrom: 1 to: (dictionary at: #size)))))}.
				``@.Stmts3';
		yourself