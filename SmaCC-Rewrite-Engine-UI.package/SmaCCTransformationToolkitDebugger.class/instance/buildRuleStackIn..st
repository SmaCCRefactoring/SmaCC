building
buildRuleStackIn: browser
	browser transmit
		to: #ruleStack;
		andShow: [ :presentation | 
			| stack |
			stack := self session transformationStack.
			presentation list
				title: 'Stack';
				display: [ stack ];
				initialize: [ :list | 
					stack isEmpty
						ifFalse: [ list selection: stack first ] ];
				format: [ :each | 
					| isBlock |
					isBlock := each last isBlockContext.
					(isBlock
						ifTrue: [ '[' ]
						ifFalse: [ '' ]) , each first displayString
						,
							(isBlock
								ifTrue: [ ']' ]
								ifFalse: [ '' ]) ] ].
	browser transmit
		from: #ruleStack port: #selection;
		transformed: [ :each | each ifNotNil: [ each last ] ];
		to: #stack port: #selection