accessing
history
	history isNil
		ifTrue: [ 
			history := NavigationHistory new.
			history maxSize: 50 ].
	^ history