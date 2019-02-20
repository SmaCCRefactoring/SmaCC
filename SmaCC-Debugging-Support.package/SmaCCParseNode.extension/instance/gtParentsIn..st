*smacc-debugging-support
gtParentsIn: aComposite
	<gtInspectorPresentationOrder: 34>
	parent isNil
		ifTrue: [ ^ self ].
	aComposite tree
		title: 'Parents';
		allExpanded;
		display: [ Array with: self ];
		format: [ :each | each class name ];
		children: [ :each | 
			(each notNil and: [ each parent notNil ])
				ifTrue: [ Array with: each parent ] ]