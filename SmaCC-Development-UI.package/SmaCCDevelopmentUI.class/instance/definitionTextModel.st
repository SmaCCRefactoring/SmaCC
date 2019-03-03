accessing-ui
definitionTextModel
	^ definitionTextModel
		ifNil: [ definitionTextModel := RubScrolledTextModel new ]