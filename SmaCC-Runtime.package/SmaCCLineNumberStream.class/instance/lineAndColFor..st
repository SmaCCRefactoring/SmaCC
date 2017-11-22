accessing
lineAndColFor: anIntegerPosition
	"answers the line and column position as a point."
	| ln col |
	ln := self lineNumberFor: anIntegerPosition.
	col := anIntegerPosition - (eolPositions at: ln).
	" it is not correct to add 1 here; if the newline is at position 7 and the current position is 8
	then we are at column 1."
	^ ln @ col