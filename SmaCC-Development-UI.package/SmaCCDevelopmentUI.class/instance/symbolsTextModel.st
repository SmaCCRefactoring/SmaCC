accessing-ui
symbolsTextModel
	^ symbolsTextModel
		ifNil: [ symbolsTextModel := RubScrolledTextModel new ]