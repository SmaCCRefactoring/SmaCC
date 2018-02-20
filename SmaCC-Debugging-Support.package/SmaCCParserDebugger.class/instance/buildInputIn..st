building
buildInputIn: browser
	browser transmit
		fromOutsideEntityPort;
		to: #input;
		andShowIfNone: [ :composite | 
			| text |
			text := composite text.
			text
				title: 'Input';
				display: [ self inputText ].
			text
				with:
					[ :c | self installActionsForRootPragmas: #(#SmaCCDebuggingInputAction) in: c ] ].
	browser transmit
		from: #stack port: #selection;
		to: #input port: #selectionInterval;
		transformed: [ :each | self inputSelectionInterval ].
	browser transmit
		from: #stackState port: #selection;
		to: #input port: #selectionInterval;
		transformed: [ :each | 
			each notNil
				ifTrue: [ (self tokenIntervalFor: each last)
						ifNil: [ self inputSelectionInterval ] ] ]