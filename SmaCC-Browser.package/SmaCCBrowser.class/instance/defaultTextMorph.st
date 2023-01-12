view
defaultTextMorph
	^ (RubPluggableTextMorph
		on: self
		text: #text
		accept: #text:
		readSelection: #textSelectionInterval
		menu: #buildTextMenu:
		setSelection: #textSelectionInterval:) font: StandardFonts codeFont