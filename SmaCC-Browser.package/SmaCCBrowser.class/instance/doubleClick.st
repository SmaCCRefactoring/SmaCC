user action
doubleClick
	"Delegate the double click to the selected node, if any."

	self treeMorph selectedMorph ifNotNil: [ :aMorph | aMorph complexContents doubleClickOn: aMorph in: self ]