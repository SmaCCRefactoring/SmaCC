*smacc-debugging-support
roassalViewForStack: stack
	| shape nodes es root view |
	root := self graphForStack: stack.
	nodes := root allNodes.
	view := (Smalltalk at: #RTView) new.
	shape := (Smalltalk at: #RTEllipse) new
		color: Color white;
		borderColor: Color black;
		width: 25;
		height: 25;
		yourself.
	view add: (shape elementOn: root).
	shape := ((Smalltalk at: #RTRoundedBox) new
		borderRadius: [ :n | 
			('<"' includes: n name first)
				ifTrue: [ 0 ]
				ifFalse: [ 10 ] ];
		color: Color white;
		borderColor: [ :n | 
			n success
				ifTrue: [ Color green ]
				ifFalse: [ n isFollowed
						ifTrue: [ Color black ]
						ifFalse: [ Color lightGray ] ] ];
		yourself)
		+
			((Smalltalk at: #RTLabel) new
				color: [ :n | 
					n success
						ifTrue: [ Color green ]
						ifFalse: [ n isFollowed
								ifTrue: [ Color black ]
								ifFalse: [ Color lightGray ] ] ];
				text: [ :n | n name ];
				yourself).
	shape allOfSameSizeWithPadding.
	es := shape
		elementsOn:
			(nodes copy
				remove: root;
				yourself).
	view addAll: es.
	shape := (Smalltalk at: #RTMultiLine) new.
	shape orthoHorizontal.
	shape color: Color black.
	shape attachPoint: (Smalltalk at: #RTHorizontalAttachPoint) instance.
	(Smalltalk at: #RTEdgeBuilder) new
		view: view;
		objects: nodes;
		shape: shape;
		connectTo: [ :n | n followed ].
	shape := (Smalltalk at: #RTMultiLine) new.
	shape orthoHorizontal.
	shape color: Color lightGray.
	shape attachPoint: (Smalltalk at: #RTHorizontalAttachPoint) instance.
	(Smalltalk at: #RTEdgeBuilder) new
		view: view;
		objects: nodes;
		shape: shape;
		connectToAll: [ :n | n directLinks ].
	view elements @ ((Smalltalk at: #RTPopup) text: [ :n | n description ]).
	view @ (Smalltalk at: #RTDraggableView).
	self layout: view from: root position: 0 @ 0.
	^ view