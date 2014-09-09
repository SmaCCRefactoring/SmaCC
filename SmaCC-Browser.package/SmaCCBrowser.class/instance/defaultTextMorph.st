view
defaultTextMorph
	^ (PluggableTextMorph
		on: self
		text: #text
		accept: #text:
		readSelection: nil
		menu: #buildTextMenu:) font: StandardFonts codeFont