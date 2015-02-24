private
splitSpecificRewriter
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'`@.Stmts1.
				(`@a ifTrue: [ `@.Stmts2 ]) `{:node :dictionary | `@.Stmts2 notEmpty and: [ `@.Stmts2 last isReturn not ] }.
				^ `@ret'
		with:
			'`@.Stmts1.
				`@a ifTrue: [ `@.Stmts2. ^ `@ret ].
				^ `@ret'.
	^ rewriter