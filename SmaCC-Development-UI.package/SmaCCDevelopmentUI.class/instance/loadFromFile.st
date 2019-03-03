actions
loadFromFile
	(UIManager default
		chooseFullFileNameMatching: nil
		label: 'Choose grammar file to open')
		ifNotNil: [ :result | 
			definitionTextModel setText: result asFileReference contents.
			self verifyDefinition ]