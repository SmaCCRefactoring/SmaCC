*smacc-debugging-support
gtInspectorSourceIn: aComposite
	<gtInspectorPresentationOrder: 40>
	aComposite text
		title: 'Source';
		withLineNumbers: true;
		display: [ self topParent completeSource ];
		initialize: [ :textPresentation | textPresentation selectionInterval: (self startPosition to: self stopPosition) ]