building
debuggerStructureIn: browser
	browser
		row: [ :row | 
			row
				column: #ruleStack span: 1;
				column: #ruleSource span: 3 ];
		row: [ :row | 
			row
				column: #originalSource;
				column: #newSource ];
		row: [ :row | 
			row
				column: #stack;
				column: #code ]
			size: 0;
		row: #inspector