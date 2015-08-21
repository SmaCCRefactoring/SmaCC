actions
doubleClickOn: aMorphTreeNodeMorph in: anAlTreeModel
	"Handle a double click on the current node: toggle the expanded state by default, or do something else."

	aMorphTreeNodeMorph toggleExpandedState.
	anAlTreeModel treeMorph adjustSubmorphPositions