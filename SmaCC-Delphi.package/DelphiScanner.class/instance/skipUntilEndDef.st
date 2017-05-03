private
skipUntilEndDef
	| value entry |
	entry := Array with: start + 1 with: nil.
	ifDefs add: entry.
	comments add: (Array with: start + 1 with: matchEnd).
	ifDefCount := 1.
	[ value := self next.
	ifDefCount > 0 ] whileTrue.
	^ value