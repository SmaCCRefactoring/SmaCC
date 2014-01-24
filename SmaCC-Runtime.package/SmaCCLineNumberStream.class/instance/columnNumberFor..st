accessing
columnNumberFor: anInteger 
	^anInteger - (eolPositions at: (self lineNumberFor: anInteger)) + 1