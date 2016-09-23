*SmaCC-Debugging-Support
gtInspectorSourceIn: aComposite inContext: aGTInspector
	<gtInspectorPresentationOrder: 40>
	aComposite text
		title: 'Source';
		when: [ (aGTInspector panes reversed collect: [ :each | (each port: #entity) value ])
				anySatisfy: [ :each | 
					(each isKindOf: SmaCCParseNode) and: [
						each topParent source notNil ] ] ];
		display: [ ((aGTInspector panes reversed collect: [ :each | (each port: #entity) value ]) 
			detect: [ :each | each isKindOf: SmaCCParseNode ]) topParent source ];
		initialize: [ :textPresentation | self startPosition ifNotNil: [ 
					textPresentation selectionInterval: (self startPosition to: self stopPosition) ] ]