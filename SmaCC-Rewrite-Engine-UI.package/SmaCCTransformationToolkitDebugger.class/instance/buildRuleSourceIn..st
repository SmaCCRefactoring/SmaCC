building
buildRuleSourceIn: browser
	browser transmit
		from: #ruleStack port: #selection;
		when: [ :selection | selection notNil and: [ selection first isKindOf: SmaCCRewrite ] ];
		to: #ruleSource;
		andShow: [ :presentation :selection | 
			presentation pharoScript
				title:
					(selection isNil
						ifTrue: [ 'Source' ]
						ifFalse: [ (self codeObjectForSelection: selection) title ]);
				morphicSelectionAct: [ :text | self saveRule: text text asString in: selection ] entitled: 'Save';
				display: [ :each | self sourceForSelection: each ];
				smalltalkClass: [ selection ifNotNil: [ selection last methodClass ] ];
				doItReceiver: [ selection ifNotNil: [ selection last receiver ] ];
				doItContext: [ selection ifNotNil: [ selection last ] ];
				initialize: [ :text | text selectionInterval: (self sourceSelectionIntervalFor: selection) ];
				with: [ :text | self installActionsForRootPragmas: #(#SmaCCTransformationStack) in: text ] ].
	browser transmit
		from: #ruleStack port: #selection;
		when: [ :selection | selection notNil and: [ selection first isKindOf: SmaCCRewriteMethodDefinition ] ];
		to: #ruleSource;
		andShow: [ :presentation :selection | 
			presentation pharoMethod
				title: 'Method';
				morphicSelectionAct: [ :text | self saveMethod: text text asString in: selection ] entitled: 'Save';
				display: [ :each | self sourceForSelection: each ];
				smalltalkClass: [ selection ifNotNil: [ selection last methodClass ] ];
				doItReceiver: [ selection ifNotNil: [ selection last receiver ] ];
				doItContext: [ selection ifNotNil: [ selection last ] ];
				initialize: [ :text | text selectionInterval: (selection last method sourceNodeForPC: selection last pc) debugHighlightRange ];
				with: [ :text | self installActionsForRootPragmas: #(#SmaCCTransformationStack) in: text ] ]