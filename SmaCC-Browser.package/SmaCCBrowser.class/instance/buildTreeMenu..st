menus
buildTreeMenu: aMenu
	"Ask the selection for builidng a menu, otherwise create a default one."

	self selectedNode notNil
		ifTrue: [ self selectedNode item buildTreeMenu: aMenu on: self treeMorph with: self ]
		ifFalse: [ 
			| t |
			t := false.
			(Pragma allNamed: #treeAreaCommand from: self class to: self class)
				do: [ :e | 
					t
						ifTrue: [ aMenu addLine ]
						ifFalse: [ t := true ].
					(self perform: e selector) do: [ :c | (c on: self treeMorph for: self) addItemToMenu: aMenu ] ] ].
	^ aMenu