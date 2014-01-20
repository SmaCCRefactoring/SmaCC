accessing
convertToDFA: aSmaCCNode 
	"Returns an equivalent DFA from the NFA specified by aSmaCCNode -- the NFA must not contain epsilon edges."

	^self new convertToDFA: aSmaCCNode