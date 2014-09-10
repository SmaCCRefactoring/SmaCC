updating
updateTextSelection
	"Ok, we need to select the right item."

	self selectedNode
		ifNil: [  ]
		ifNotNil: [ :aNode | 
			textMorph
				setSelection:
					{(aNode item startPosition).
					(aNode item stopPosition)} ]