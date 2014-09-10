selecting
selection: anItem
	"This is called when a node is selected in the tree. We should there select the relevant source code item / deselect as appropriate."

	| sel |
	anItem selectedNodePath notNil
		ifTrue: [ sel := anItem selectedNodePath last ].
	super selection: anItem.
	self isSelectionUpdate
		ifTrue: [ ^ self ].
	self updateTextKeymap.
	self updateTreeKeymap.
	self updateTextSelection.
	sel isNil
		ifTrue: [ 
			"Need to unselect things?"
			 ]
		ifFalse: [ 
			self history add: sel.
			sel item selectIn: self ]