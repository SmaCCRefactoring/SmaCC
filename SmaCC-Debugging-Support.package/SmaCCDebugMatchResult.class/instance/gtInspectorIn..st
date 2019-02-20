inspector
gtInspectorIn: aComposite
	<gtInspectorPresentationOrder: 1>
	| tabulator |
	tabulator := aComposite tabulator.
	tabulator
		title: 'Pattern matching';
		column: [ :c | 
			c
				row: #patternTree;
				row: #patternSource ];
		column: [ :c | 
			c
				row: #nodeTree;
				row: #nodeSource ].
	tabulator transmit
		to: #patternTree;
		andShow: [ :p | 
			p fastTreeTable
				title: 'Pattern';
				display: [ Array with: self ];
				children: [ :each | each allPatternChildren ];
				allExpanded;
				column: 'Variable' evaluated: [ :each | self patternLabelFor: each ];
				column: 'Type' evaluated: [ :each | '' ] tags: [ :each | {each patternNode class name} ] ].
	tabulator transmit
		to: #patternSource;
		andShow: [ :p | p text display: [ patternNode topParent completeSource ifNil: [ '' ] ] ].
	tabulator transmit
		from: #patternTree port: #selection;
		to: #patternSource port: #selectionInterval;
		transformation: [ :e | 
			e isNil
				ifTrue: [ 1 to: 0 ]
				ifFalse: [ e patternNode startPosition to: e patternNode stopPosition ] ].
	tabulator transmit
		to: #nodeTree;
		andShow: [ :p | 
			p fastTreeTable
				beMultiple;
				title: 'AST';
				display: [ matchedNodes ];
				children: [ :each | each matchResult allNodeChildren ];
				allExpanded;
				column: 'Variable' evaluated: [ :each | self nodeLabelFor: each ];
				column: 'Type' evaluated: [ :each | '' ] tags: [ :each | {each node class name} ] ].
	tabulator transmit
		to: #nodeSource;
		andShow: [ :p | 
			p text
				display: [ matchedNodes isEmpty
						ifTrue: [ '' ]
						ifFalse: [ matchedNodes first node topParent completeSource ifNil: [ '' ] ] ] ].
	tabulator transmit
		from: #patternTree port: #selection;
		to: #nodeTree port: #selection;
		transformation: [ :e | 
			e isNil
				ifTrue: [ #() ]
				ifFalse: [ e matchedNodes ] ].
	tabulator transmit
		from: #nodeTree port: #selection;
		to: #nodeSource port: #selectionInterval;
		transformation: [ :e | 
			| start end |
			start := SmallInteger maxVal.
			end := 0.
			e
				do: [ :each | 
					start := start min: each node startPosition.
					end := end max: each node stopPosition ].
			start = SmallInteger maxVal
				ifTrue: [ start := 1 ].
			start to: end ]