*smacc-rewrite-engine-ui
buildReplaceIn: aPresentation
	| browser types |
	browser := aPresentation tabulator.
	browser
		row: #type size: 25;
		row: #value.
	types := self transformationTypes.
	browser transmit
		to: #type;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ types ];
				selectedIndex: (types indexOf: self transformation class type);
				onChangeOfPort: #selection act: [ :list | self changedReplaceTo: list selection ] ].
	browser transmit
		to: #value;
		andShow: [ :presentation | 
			presentation dynamic
				updateOn: #transformation from: [ self announcer ];
				display: [ | composite |
					composite := GLMCompositePresentation new.
					transformation buildInterfaceIn: composite.
					composite startOn: match.
					composite ] ]