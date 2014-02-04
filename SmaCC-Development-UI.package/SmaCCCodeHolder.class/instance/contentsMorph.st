accessing
contentsMorph
	contentsMorph isNil
		ifTrue: [ 
			contentsMorph := PluggableTextMorph
				on: self
				text: #contents
				accept: #contents:notifying:
				readSelection: nil
				menu: #contentsMenu:shifted: ].
	^ contentsMorph