accessing
classDefinitions
	| defs root |
	root := self rootDefinition.
	(root isNil and: [ classDefinitions notEmpty ])
		ifTrue:
			[ SmaCCCompilationNotification new
				messageText: 'Node generation';
				tag: 'Cannot generate node classes without specifying a "%root" node.';
				signal ].
	root isNil
		ifTrue: [ ^ #() ].
	defs := classDefinitions asOrderedCollection.
	defs
		do:
			[ :each | 
			(each isRoot not and: [ each superclass isNil ])
				ifTrue: [ each superclass: root ] ].
	^ defs