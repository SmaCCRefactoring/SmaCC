actions
choose: aString from: aCollection 
	| choice |
	choice := UIManager default chooseFrom: aCollection title: aString withCRs.
	choice > 0
		ifTrue: [^ aCollection at: choice].
	^ nil