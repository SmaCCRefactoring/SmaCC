accessing
safeMethodName
	^ self unsafeMethodName
		collect: [ :each | 
			each isAlphaNumeric
				ifTrue: [ each ]
				ifFalse: [ $_ ] ]