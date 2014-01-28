public
menu
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu text: 'Server'.
	menu add: 'exit' action: #exit.
	^ menu