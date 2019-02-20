*smacc-debugging-support
gtChildrenOf: each
	^ (each at: 2) = #node
		ifTrue: [ each last gtInspectorItems ]
		ifFalse: [ (each at: 2) = #nodes
				ifTrue: [ self gtCollectionItems: each last type: #node ]
				ifFalse: [ (each at: 2) = #tokens
						ifTrue: [ self gtCollectionItems: each last type: #token ]
						ifFalse: [ #() ] ] ]