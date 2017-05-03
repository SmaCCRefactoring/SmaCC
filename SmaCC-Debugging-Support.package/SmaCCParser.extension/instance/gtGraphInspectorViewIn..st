*smacc-debugging-support
gtGraphInspectorViewIn: composite
	<gtInspectorPresentationOrder: 20>
	((Smalltalk includesKey: #RTView) not or: [ (self class >> #transitionTable) methodClass = SmaCCParser ])
		ifTrue: [ ^ nil ].
	composite roassal2
		title: 'Graph';
		initializeView: [ self roassalView ]