compiling
expression
	^transitionObjects size = 1 
		ifTrue: ['state == #' , transitionObjects asArray first]
		ifFalse: ['(' , transitionObjects asArray storeString , ' includes: state)']