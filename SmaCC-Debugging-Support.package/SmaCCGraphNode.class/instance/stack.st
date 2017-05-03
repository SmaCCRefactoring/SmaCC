private
stack
	| stack |
	stack := previousNodes notEmpty
		ifTrue: [ previousNodes first stack ]
		ifFalse: [ OrderedCollection new ].
	stack add: state.
	^ stack