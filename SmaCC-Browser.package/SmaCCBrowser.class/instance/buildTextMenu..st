menus
buildTextMenu: aMenu
	self selectedNode notNil
		ifTrue: [ self selectedNode buildTextMenu: aMenu on: textMorph with: self ].
	^ aMenu