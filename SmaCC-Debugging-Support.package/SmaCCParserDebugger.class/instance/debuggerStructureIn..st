building
debuggerStructureIn: browser
	browser
		row: [ :row | 
			row
				column: #stackState span: 6;
				column: #potential span: 6.
			isGLR
				ifTrue: [ row column: #glrStates ] ].
	browser
		row: [ :row | 
			row
				column: #input span: 2;
				column: #scannerState ];
		row: [ :row | 
			row
				column: #stack;
				column: #code ];
		row: #inspector span: 0