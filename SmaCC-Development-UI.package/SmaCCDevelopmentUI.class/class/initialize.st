class initialization
initialize
	ShowPrecedenceConflicts:=false.
"	(TheWorldMenu respondsTo: #registerOpenCommand:) ifTrue: [
		TheWorldMenu unregisterOpenCommand: 'SmaCC'.
		TheWorldMenu registerOpenCommand: {'SmaCC Generator'. {self. #open}}]
"