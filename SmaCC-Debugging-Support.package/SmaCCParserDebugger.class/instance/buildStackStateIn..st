building
buildStackStateIn: browser
	browser transmit
		from: #stack port: #selection;
		to: #stackState;
		transformed: [ :context | self parserStack ];
		andShow: [ :composite | 
			composite table
				title: 'Parser Stack';
				column: 'Symbol' evaluated: [ :each | each first ];
				column: 'Value' evaluated: [ :each | each last ];
				morphicSelectionAct: [ :list | list selection last inspect ]
					icon: GLMUIThemeExtraIcons glamorousInspect
					on: $i
					entitled: 'Inspect';
				with: [ :c | self installActionsForRootPragmas: #(#SmaCCDebuggingParserAction) in: c ] ]