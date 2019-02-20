*SmaCC-Debugging-Support
debugLabelForChild: anObject
	self singularVariableSelectors
		do: [ :each | 
			(self perform: each)
				do: [ :sel | 
					(self perform: sel) == anObject
						ifTrue: [ ^ sel ] ] ].
	self compositeVariableSelectors
		do: [ :each | 
			(self perform: each)
				do: [ :sel | 
					| index |
					index := (self perform: sel) identityIndexOf: anObject.
					index > 0
						ifTrue: [ ^ index printString , ': ' , sel ] ] ].
	^ anObject class name