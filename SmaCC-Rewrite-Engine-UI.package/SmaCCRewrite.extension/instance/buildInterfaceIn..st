*smacc-rewrite-engine-ui
buildInterfaceIn: aPresentation
	| tabulator |
	(tabulator := aPresentation tabulator)
		row: [ :row | 
			row
				column: #label size: 75;
				column: #comment ]
			size: 25;
		row: #search;
		row: #replace.
	tabulator transmit
		to: #label;
		andShow: [ :presentation | presentation label display: 'Comment:' ].
	tabulator transmit
		to: #comment;
		andShow: [ :presentation | 
			presentation text
				display: self comment;
				onChangeOfPort: #text act: [ :text | self comment: text text asString ] ].
	tabulator updateOn: #match from: #yourself.
	tabulator updateOn: #transformation from: #yourself.
	tabulator transmit
		to: #search;
		transformed: [ :rewrite | rewrite match ];
		andShow: [ :presentation | self buildSearchIn: presentation ].
	tabulator transmit
		to: #replace;
		transformed: [ :rewrite | rewrite transformation ];
		andShow: [ :presentation | self buildReplaceIn: presentation ]