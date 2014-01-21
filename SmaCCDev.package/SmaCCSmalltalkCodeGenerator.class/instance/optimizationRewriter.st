compiling
optimizationRewriter
	| rewriter |
	rewriter := ParseTreeRewriter new.
	self addTimesRepeatOptimizationTo: rewriter.
	rewriter
		replace:
				'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				currentCharacter == `#l ifTrue: [`@.Stmts3. ^`@r3].
				`@.Stmts4'
			with:
				'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				`@.Stmts3. ^`@r3';
		replace:
				'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				currentCharacter == `#l ifTrue: [`@.Stmts3].
				`@.Stmts4'
			with:
				'`@.Stmts1.
				[`@.Stmts2.
				currentCharacter ~~ `#l] whileTrue.
				`@.Stmts3. 
				`@.Stmts4';
		replaceMethod:
				'`name
					`@.Stmts1.
					`@a ifTrue: [^self `name].
					`@.Stmts3'
			with:
				'`name
					[`@.Stmts1.
					`@a] whileTrue.
					`@.Stmts3';
		replaceMethod:
				'`name
					`@.Stmts1.
					`@a ifTrue: [`@.Stmts2.
							^self `name].
					`@.Stmts3'
			with:
				'`name
					[`@.Stmts1.
					`@a] whileTrue: [`@.Stmts2].
					`@.Stmts3';
		replace:
				'`@.Stmts1.
				currentCharacter isLiteral ifTrue: [`@.Stmts2].
				`@.Stmts3'
			with:
				'`@.Stmts1.
				`@.Stmts2';
		replace:
				'`@.Stmts1.
				`.Stmt.
				`@.Stmts.
				`@a ifTrue: [self step. `.Stmt. `@.Stmts].
				`@.Stmts2'
			with:
				'`@.Stmts1.
				`@a ifTrue: [self step].
				`.Stmt.
				`@.Stmts.
				`@.Stmts2';
		replace:
				'`@.Stmts1.
				true ifTrue: [`@.Stmts2. ^`@obj].
				`@.Stmts3'
			with:
				'`@.Stmts1.
				`@.Stmts2.
				^`@obj';
		replace:
				'`@.Stmts1.
				[`@.Stmts2. true] whileTrue.
				`@.Stmts3'
			with:
				'`@.Stmts1.
				[`@.Stmts2] repeat'.
	self addImplementationSpecificRewritesTo: rewriter.
	^rewriter