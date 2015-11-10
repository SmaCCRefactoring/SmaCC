updating
updateTextSelection
	"Ok, we need to select the right item."

	self selectedNode
		ifNil: [  ]
		ifNotNil: [ :aNode | 
			aNode item startPosition
				ifNotNil: [ :startPosition | 
					aNode item stopPosition
						ifNotNil: [ :stopPosition | 
							textMorph
								setSelection:
									{startPosition.
									stopPosition} ] ] ]
