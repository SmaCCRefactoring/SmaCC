initialization
buildPackageMorph
	^ packageMorph := (EditableDropListMorph
		on: self
		list: #packages
		selected: nil
		changeSelected: nil
		useIndex: false
		addToList: #addPackage:
		class: String
		getEnabled: nil)
		hResizing: #spaceFill;
		updateContentMorphWith: 'SmaCC-Tutorial'