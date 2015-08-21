actions
buildTreeMenu: aMenu on: aTarget with: aRequestor
	| t |
	t := false.
	((self selectorsForProtocol: '.*tree commands') sorted: [ :a :b | a < b ])
		do: [ :e | 
			t
				ifTrue: [ aMenu addLine ]
				ifFalse: [ t := true ].
			(self perform: e) do: [ :c | (c asClass on: aTarget for: aRequestor) addItemToMenu: aMenu ] ]