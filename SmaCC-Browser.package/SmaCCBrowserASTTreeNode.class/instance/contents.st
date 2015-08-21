accessing
contents
	^ item sortedChildren collect: [ :e | SmaCCBrowserASTTreeNode with: e parent: self ]