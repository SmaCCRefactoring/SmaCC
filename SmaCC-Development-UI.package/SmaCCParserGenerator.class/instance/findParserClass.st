actions
findParserClass
	| class subclasses |
	self isModified
		ifTrue: [ self promptToSaveChanges
				ifFalse: [ ^ self ] ].
	subclasses := (SmaCCParser allSubclasses asSortedCollection: [ :a :b | a name < b name ]) asArray.
	class := UIManager default
		chooseFrom: (subclasses collect: [ :each | each name ])
		values: subclasses
		message: 'What class do you want to use?'.
	class isNil
		ifTrue: [ ^ self ].
	self parserClassName: class name.
	self updateDefinitionFor: class.
	self markAsUnmodified