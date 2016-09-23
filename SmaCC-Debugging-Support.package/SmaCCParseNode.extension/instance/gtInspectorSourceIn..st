*SmaCC-Debugging-Support
gtInspectorSourceIn: aComposite
	<gtInspectorPresentationOrder: 40>
	aComposite text
		title: 'Source';
		display: [ self topParent source ];
		initialize: [ :textPresentation | textPresentation selectionInterval: (self startPosition to: self stopPosition) ]