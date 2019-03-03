accessing-ui
itemsTextModel
	^ itemsTextModel
		ifNil: [ itemsTextModel := RubScrolledTextModel new ]