compiling
timesRepeatRewriter
	^ RBParseTreeRewriter new
		replace:
				'`@.StmtsBefore.
				`@.Common.
				`@a ifTrue: 
					[`@.Common.
					`@a ifTrue: [`@.After].
					`@.CommonAfter.
					^self reportLastMatch].
				`@.CommonAfter'
			with:
				'`@.StmtsBefore.
				2 timesRepeat: [
					`@.Common.
					`@a ifFalse: [`@.CommonAfter. ^self reportLastMatch]].
				`@.After';
		replace:
				'`@.StmtsBefore.
				`@.Common.
				`@a ifTrue: 
					[`@.Common.
					`@a ifTrue: [`@.After].
					`@.CommonAfter].
				`@.CommonAfter'
			with:
				'`@.StmtsBefore.
				2 timesRepeat: [
					`@.Common.
					`@a ifFalse: [`@.CommonAfter. `{(`@.CommonAfter notEmpty and: [`@.CommonAfter last isReturn]) ifTrue: [#()] ifFalse: [Array with: (RBParser parseExpression: ''^self reportLastMatch'')]}]].
				`@.After';
		replace:
				'`@.StmtsBefore.
				`#l timesRepeat: [
					`@.Common.
					`@a ifFalse: [`@.CommonAfter. ^self reportLastMatch]].
				`@.Common.
				`@a ifTrue: [`@.After].
				`@.CommonAfter'
			with:
				'`@.StmtsBefore.
				`{RBLiteralNode value: `#l value + 1} timesRepeat: [
					`@.Common.
					`@a ifFalse: [`@.CommonAfter. ^self reportLastMatch]].
				`@.After';
		replace:
				'`@.StmtsBefore.
				`#l timesRepeat: [
					`@.Common.
					`@a ifFalse: [`@.CommonAfter]].
				`@.Common.
				`@a ifTrue: [`@.After].
				`@.CommonAfter'
			with:
				'`@.StmtsBefore.
				`{RBLiteralNode value: `#l value + 1} timesRepeat: [
					`@.Common.
					`@a ifFalse: [`@.CommonAfter]].
				`@.After';
		replace:
				'`@.StmtsBefore.
				`#l1 timesRepeat: `@b.
				`#l2 timesRepeat: `@b.
				`@.StmtsAfter'
			with:
				'`@.StmtsBefore.
				`{RBLiteralNode value: `#l1 value + `#l2 value} timesRepeat: `@b.
				`@.StmtsAfter';
		yourself