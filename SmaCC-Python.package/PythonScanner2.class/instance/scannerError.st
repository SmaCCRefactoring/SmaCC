private
scannerError
	"Override to be able to reset indents at end of file."

	(stream atEnd and: [ start == stream position and: [ self indentStack last > 0 ] ])
		ifTrue: [ 
			[ self indentStack last > 0 ]
				whileTrue: [ 
					matchActions := Array with: self DEDENTId.
					self tokenStack add: (self createTokenFor: 'Dedent').
					self indentStack removeLast ].
			returnMatchBlock value: self tokenStack removeFirst ].
	super scannerError