Extension { #name : #SmaCCToken }

{ #category : #'*SmaCC-Debugging-Support' }
SmaCCToken class >> gtExampleSimple [
	<gtExample>
	^ self value: 'simple'
]

{ #category : #'*smacc-debugging-support' }
SmaCCToken >> gtInspectorSourceIn: aComposite inContext: aGTInspector [
	<gtInspectorPresentationOrder: 40>
	aComposite text
		title: 'Source';
		when: [ (aGTInspector panes reversed collect: [ :each | (each port: #entity) value ])
				anySatisfy: [ :each | (each isKindOf: SmaCCParseNode) and: [ each topParent completeSource notNil ] ] ];
		display: [ ((aGTInspector panes reversed collect: [ :each | (each port: #entity) value ])
				detect: [ :each | each isKindOf: SmaCCParseNode ]) topParent completeSource ];
		initialize:
				[ :textPresentation | self startPosition ifNotNil: [ textPresentation selectionInterval: (self startPosition to: self stopPosition) ] ]
]
