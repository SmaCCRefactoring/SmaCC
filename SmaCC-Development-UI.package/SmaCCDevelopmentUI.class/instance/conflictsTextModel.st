accessing-ui
conflictsTextModel
	^ conflictsTextModel
		ifNil: [ conflictsTextModel := RubScrolledTextModel new ]