instance creation
on: aStream 
	^(self new)
		on: (self needsLineNumbers 
					ifTrue: [SmaCCLineNumberStream on: aStream]
					ifFalse: [aStream]);
		yourself