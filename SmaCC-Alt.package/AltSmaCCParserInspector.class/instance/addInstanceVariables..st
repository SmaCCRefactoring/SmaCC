list
addInstanceVariables: elements
	"generate the collection of elements to show in the inspector for the object inspected"

	(self object class allInstVarNames
		reject: [ :name | name = 'currentToken' or: [ name = 'errorToken' ] ])
		do: [ :name | 
			elements
				add: (AltInstanceVariableEyeElement host: self object instVarName: name) ].
	^ elements