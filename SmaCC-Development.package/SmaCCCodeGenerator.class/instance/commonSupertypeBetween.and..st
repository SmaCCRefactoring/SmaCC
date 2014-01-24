accessing
commonSupertypeBetween: modelClass and: anotherModelClass
	^(anotherModelClass includesClass: modelClass)
		ifTrue: [modelClass]
		ifFalse:
			[(modelClass includesClass: anotherModelClass)
				ifTrue: [anotherModelClass]
				ifFalse: [self commonSupertypeBetween: modelClass superclass and: anotherModelClass]]