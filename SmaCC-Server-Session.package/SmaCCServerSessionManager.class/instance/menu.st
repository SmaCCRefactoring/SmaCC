public
menu
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu add: 'exit' action: #close.
	^ menu