*SmaCC-Debugging-Support
gtInspectorSourceIn: aComposite
	<gtInspectorPresentationOrder: 40>
	aComposite text
		title: 'Source';
		display: [ self topParent completeSource ];
		initialize: [ :textPresentation | textPresentation selectionInterval: (self startPosition to: self stopPosition) ]