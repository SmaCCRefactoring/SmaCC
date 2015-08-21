actions
buildTextMenu: aMenu on: aTarget with: aRequestor
	"Ok, now I work with protocols."

	| t |
	t := false.
	((self selectorsForProtocol: '.*text commands') sorted: [ :a :b | a < b ])
		do: [ :p | 
			t
				ifTrue: [ aMenu addLine ]
				ifFalse: [ t := true ].
			(self perform: p) do: [ :c | (c asClass on: aTarget for: aRequestor) addItemToMenu: aMenu ] ]