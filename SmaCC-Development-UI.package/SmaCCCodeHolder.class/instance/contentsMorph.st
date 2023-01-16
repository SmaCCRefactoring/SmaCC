accessing
contentsMorph

	contentsMorph ifNil: [
		contentsMorph := RubPluggableTextMorph
			                 on: self
			                 text: #contents
			                 accept: #contents:notifying:
			                 readSelection: nil
			                 menu: #contentsMenu:shifted: ].
	^ contentsMorph