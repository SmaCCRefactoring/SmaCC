view
defaultTextMorph
	^ (PluggableTextMorph
		on: self source
		text: #text
		accept: #text:
		readSelection: nil
		menu: #buildTextMenu:) font: StandardFonts codeFont