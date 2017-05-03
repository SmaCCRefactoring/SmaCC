building
compose
	| tabulator file |
	tabulator := self tabulator.
	tabulator
		column: #rewrites;
		column: #rule span: 3.
	tabulator transmit
		to: #rewrites;
		transformed: [ :rewriteFile | 
			"Hack to get the value since sometimes it passes the wrong value"
			file := (rewriteFile isKindOf: SmaCCTransformationToolkitModel)
				ifTrue: [ rewriteFile rewrites ]
				ifFalse: [ rewriteFile ].
			Array with: file ];
		andShow: [ :presentation | 
			| tree |
			tree := presentation tree.
			tree
				title: 'Rewrites';
				updateOn: #display from: [ file announcer ];
				act: [ :t | self deleteRule: t selection ] icon: GLMUIThemeExtraIcons glamorousTrash entitled: 'Delete';
				act: [ :t | self addRuleTo: t selection ] icon: GLMUIThemeExtraIcons glamorousAdd entitled: 'Add Rule';
				act: [ :t | self addFileRuleTo: t selection ] entitled: 'Add File';
				act: [ :t | self addMethodRuleTo: t selection ] entitled: 'Add Method';
				act: [ :t | self addPropertyRuleTo: t selection ] entitled: 'Add Property';
				allExpanded;
				filterOn: [ :text :each | each matches: text ];
				format: [ :rewrite | rewrite displayString ];
				children: [ :rewrite | rewrite rewrites ].
			treeInitializer value: tree ].
	tabulator transmit
		from: #rewrites port: #selection;
		to: #rule;
		andShow: [ :presentation :rewrite | 
			rewrite notNil
				ifTrue: [ rewrite buildInterfaceIn: presentation ] ].
	tabulator transmit
		fromOutsidePort: #rewriteToSelect;
		to: #rewrites port: #selection