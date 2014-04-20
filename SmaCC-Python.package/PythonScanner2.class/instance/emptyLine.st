private
emptyLine
	"An empty line should reset the indent stack and not generate a NEWLINE."

	[ self indentStack last > 0 ]
		whileTrue: [ 
			matchActions := Array with: self DEDENTId.
			self tokenStack add: (self createTokenFor: 'Dedent').
			self indentStack removeLast ].
	^ self next