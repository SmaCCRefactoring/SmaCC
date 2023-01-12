accessing
contentsMorph
	contentsMorph isNil
		ifTrue: [ 
			contentsMorph := RubPluggableTextMorph
				on: self
				text: #contents
				accept: #contents:notifying:
				readSelection: nil
				menu: #contentsMenu:shifted: ].
	^ contentsMorph