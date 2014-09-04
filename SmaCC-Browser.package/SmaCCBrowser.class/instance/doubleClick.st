user actions
doubleClick
	"Delegate the double click to the selected node, if any."

	self selectedNode notNil
		ifTrue: [ self selectedNode doubleClickIn: self ]