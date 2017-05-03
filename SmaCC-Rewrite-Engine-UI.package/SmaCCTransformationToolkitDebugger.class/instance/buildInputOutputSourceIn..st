building
buildInputOutputSourceIn: browser
	browser transmit
		to: #originalSource;
		andShow: [ :presentation | 
			presentation text
				title: 'Original Source';
				wrapped: false;
				withLineNumbers: true;
				display: self session originalSource;
				with: [ :text | self installActionsForRootPragmas: #(#SmaCCTransformationInput) in: text ] ].
	browser transmit
		to: #newSource;
		andShow: [ :presentation | 
			presentation text
				title: 'New Source';
				wrapped: false;
				withLineNumbers: true;
				display: self session newSource ].
	browser transmit
		from: #ruleStack port: #selection;
		transformed: [ :selection | self inputSelectionIntervalFor: selection ];
		to: #originalSource port: #selectionInterval.
	browser transmit
		from: #ruleStack port: #selection;
		transformed: [ :selection | self outputSelectionIntervalFor: selection ];
		to: #newSource port: #selectionInterval