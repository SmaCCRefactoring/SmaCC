private
emptyLine
	"An empty line should reset the indent stack"

	self state: #lineBegin.
	[ self indentStack last > 0 ]
		whileTrue: [ 
			matchActions := Array with: self DEDENTId.
			self tokenStack add: (self createTokenFor: 'Dedent').
			self indentStack removeLast ].
	matchActions := Array with: self NEWLINEId.
	self tokenStack add: (self createTokenFor: '<cr>').
	^ self next