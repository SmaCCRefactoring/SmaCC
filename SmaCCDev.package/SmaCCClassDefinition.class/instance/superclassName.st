accessing
superclassName
	^self isRoot ifTrue: [self rootClassName] ifFalse: [superclass fullName]