*smacc-debugging-support
gtInspectorTreeIn: aComposite
	<gtInspectorPresentationOrder: 30>
	aComposite tabulator
		with: [ :browser | 
			browser title: 'Tree'.
			browser row: #variables.
			browser transmit
				from: #variables;
				toOutsidePort: #selection;
				transformed: [ :each | each ifNotNil: [ each last ] ].
			browser transmit
				to: #variables;
				andShow: [ :composite | 
					composite table
						display: [ Array with: (Array with: 'self' with: #node with: self) ];
						children: [ :each | self gtChildrenOf: each ];
						format: [ :each | each first ];
						column: 'Variable' evaluated: [ :each | each first ];
						column: 'Type'
							evaluated: [ :each | 
							(each at: 2) = #node
								ifTrue: [ each last class name ]
								ifFalse: [ '' ] ]
							tags: [ :each | Array with: (each at: 2) ] ] ]