initialize-release
superclass: anObject
	superclass notNil
		ifTrue: [ superclass removeSubclass: self ].
	superclass := anObject.
	superclass notNil
		ifTrue: [ superclass addSubclass: self ]