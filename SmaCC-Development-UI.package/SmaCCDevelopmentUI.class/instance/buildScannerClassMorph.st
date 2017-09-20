initialize-release
buildScannerClassMorph
	^ scannerClassMorph := (EditableDropListMorph
		on: self
		list: #scannerClasses
		selected: nil
		changeSelected: #updateScannerClass:
		useIndex: false
		addToList: #addScannerClass:
		class: String
		getEnabled: nil) hResizing: #spaceFill