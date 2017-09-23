list
generateElements
	"generate the collection of elements to show in the inspector for the object inspected"

	| elements |
	elements := OrderedCollection new.
	self addSpecialFields: elements.
	(self object class allInstVarNames
		reject: [ :name | name = 'currentToken' or: [ name = 'errorToken' ] ])
		do: [ :name | 
			elements
				add: (InstanceVariableEyeElement host: self object instVarName: name) ].
	^ elements