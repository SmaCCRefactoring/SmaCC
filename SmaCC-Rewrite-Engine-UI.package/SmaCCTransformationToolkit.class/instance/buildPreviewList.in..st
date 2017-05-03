building
buildPreviewList: list in: presenter
	presenter table
		display: [ list ];
		column: 'Rewrite' evaluated: [ :each | each rewrite displayString ];
		column: 'Node' evaluated: [ :each | each nodeClass ];
		column: 'Location' evaluated: [ :each | each nodeInterval ];
		morphicSelectionAct: [ :table | self debugRewriteForNode: table selection ]
			icon: GLMUIThemeExtraIcons glamorousBug
			on: $d
			entitled: 'Debug';
		morphicSelectionAct: [ :table | self gotoRewrite: table selection rewrite ] entitled: 'Goto Rewrite'