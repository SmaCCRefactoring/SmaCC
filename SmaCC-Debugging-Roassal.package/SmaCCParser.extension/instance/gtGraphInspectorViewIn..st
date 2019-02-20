*smacc-debugging-roassal
gtGraphInspectorViewIn: composite
	<gtInspectorPresentationOrder: 20>
	((Smalltalk includesKey: #RTView) not
		or: [ ((self class class whichClassIncludesSelector: #transitionTable) >> #transitionTable) methodClass = SmaCCParser class ])
		ifTrue: [ ^ nil ].
	composite roassal2
		title: 'Graph';
		initializeView: [ self roassalView ]