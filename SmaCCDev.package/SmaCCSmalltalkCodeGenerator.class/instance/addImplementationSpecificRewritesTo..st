private
addImplementationSpecificRewritesTo: rewriter
	rewriter
"		replace:
				'`{:node :dict | (node isLiteralNode and: [(node value isKindOf: Character) and: [(node value codePoint between: 32 and: 126) not]]) ifTrue: [dict at: ''literal'' put: node. true] ifFalse: [false]}'
			with: '##(Character value: `{:dict | RBLiteralNode value: (dict at: ''literal'') value codePoint})';
"		replace:
				'``@.Stmts1.
				(`@a ifTrue: [``@.Stmts2]) `{:node :dictionary | | index myStatements |
						index := node parent statements indexOf: node.
						myStatements := node parent statements.
						dictionary at: #size put: ``@.Stmts2 size - (myStatements size - index).
						index ~~  myStatements size and: [``@.Stmts2 size >= (myStatements size - index) and: [
							(index + 1 to: myStatements size) allSatisfy: [:each | 
								(myStatements at: each) = (``@.Stmts2 at: ``@.Stmts2 size - (myStatements size - each))]]]
						}.
				``@.Stmts3'
			with:
				'``@.Stmts1.
				`{:dictionary | RBMessageNode receiver: `@a selector: #ifTrue: arguments: (Array with: (RBBlockNode body: (RBSequenceNode statements: (``@.Stmts2 copyFrom: 1 to: (dictionary at: #size)))))}.
				``@.Stmts3';
		replace: 'currentCharacter == `#l1 or: [currentCharacter == `#l2]'
			with: '`{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)} includes: currentCharacter';
		replace: 'currentCharacter == `#l1 or: [currentCharacter == `#l2 or: `@a]'
			with: '(`{RBLiteralNode value: (String with: `#l1 value with: `#l2 value)} includes: currentCharacter) or: `@a';
		replace: '(`#l1 includes: currentCharacter) or: [currentCharacter == `#l2]'
			with: '`{RBLiteralNode value: `#l1 value , (String with: `#l2 value)} includes: currentCharacter';
		replace: '(`#l1 includes: currentCharacter) or: [currentCharacter == `#l2 or: `@a]'
			with: '(`{RBLiteralNode value: `#l1 value , (String with: `#l2 value)} includes: currentCharacter) or: `@a';
		replace:
				'`@.Stmts1.
				currentCharacter isLiteral ifTrue: [`@.Stmts2].
				`@.Stmts3'
			with:
				'`@.Stmts1.
				`@.Stmts2'