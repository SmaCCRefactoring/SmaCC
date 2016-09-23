private
updateOptionsMenu
	(self menuItemFor: #setScannerClass)
		contents:
			'Scanner Class'
				,
					(scannerClassName isEmpty
						ifTrue: [ '' ]
						ifFalse: [ ' (' , scannerClassName , ')' ]) , '...'.
	(self menuItemFor: #setParserClass)
		contents:
			'Parser Class'
				,
					(parserClassName isEmpty
						ifTrue: [ '' ]
						ifFalse: [ ' (' , parserClassName , ')' ]) , '...'.
	self updateMenuItem: #useUnicode checked: self isUnicode.
	self updateMenuItem: #setLALR1 checked: self isLALR1.
	self updateMenuItem: #setLR1 checked: self isLR1