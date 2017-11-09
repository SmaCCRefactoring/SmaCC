accessing
lineAndColFor: anIntegerPosition
	"answers the line and column position as a point."
	| ln col |
	ln := self lineNumberFor: anIntegerPosition.
	col := anIntegerPosition - (eolPositions at: ln) + 1.
	^ ln @ col