building
buildScannerStateIn: browser
	browser transmit
		from: #stack port: #selection;
		to: #scannerState;
		transformed: [ :context | self scannerProperties ];
		andShow:
				[ :composite | 
			composite table
				title: 'Scanner';
				column: 'Name' evaluated: [ :each | each first ];
				column: 'Value' evaluated: [ :each | each last ];
				with: [ :c | self installActionsForRootPragmas: #(#SmaCCDebuggingScannerAction) in: c ] ]