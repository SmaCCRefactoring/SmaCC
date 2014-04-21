private
scannerError
	"Override to be able to reset indents at end of file. And also if it is necessary to create a NEWLINE token."

	(stream atEnd and: [ start == stream position ])
		ifTrue: [ 
			lastLineStart = start
				ifFalse: [ 
					matchActions := Array with: self NEWLINEId.
					self tokenStack add: (self createTokenFor: '<cr>').
					lastLineStart := start ].
			[ self indentStack last > 0 ]
				whileTrue: [ 
					matchActions := Array with: self DEDENTId.
					self tokenStack add: (self createTokenFor: 'Dedent').
					self indentStack removeLast ].
			self tokenStack notEmpty
				ifTrue: [ returnMatchBlock value: self tokenStack removeFirst ] ].
	super scannerError