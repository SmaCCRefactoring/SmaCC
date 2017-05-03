*smacc-rewrite-engine-ui
buildInterfaceIn: aPresentation
	| tabulator |
	(tabulator := aPresentation tabulator)
		row: [ :row | 
			row
				column: #label size: 75;
				column: #comment ]
			size: 25;
		row: #source.
	tabulator transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'Comment:' ].
	tabulator transmit
		to: #comment;
		andShow: [ :presentation | 
			presentation text
				display: self comment;
				onChangeOfPort: #text act: [ :text | self comment: text text asString ] ].
	tabulator updateOn: #source from: #yourself.
	tabulator transmit
		to: #source;
		andShow: [ :presentation | 
			presentation pharoMethod
				title: 'Source';
				smalltalkClass: [ self contextClass ];
				display: self source;
				onChangeOfPort: #text act: [ :text | self source: text text asString ];
				morphicSelectionAct: [ :text | 
						text
							text: (RBParser parseMethod: text text asString) formattedCode;
							update ]
					icon: GLMUIThemeExtraIcons glamorousPlay
					on: $t
					entitled: 'Format' ]