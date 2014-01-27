accessing
parserClass
	^parent notNil ifTrue: [parent parserClass] ifFalse: [nil]