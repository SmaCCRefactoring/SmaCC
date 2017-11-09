initialization
buildParserClassMorph
	^ parserClassMorph := (EditableDropListMorph
		on: self
		list: #parserClasses
		selected: nil
		changeSelected: #updateParserClass:
		useIndex: false
		addToList: #addParserClass:
		class: String
		getEnabled: nil) hResizing: #spaceFill