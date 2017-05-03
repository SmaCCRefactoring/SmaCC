*smacc-rewrite-engine-ui
buildSearchIn: aPresentation
	| browser types |
	browser := aPresentation tabulator.
	browser
		row: #type size: 25;
		row: #value.
	types := self matchTypes.
	browser transmit
		to: #type;
		andShow: [ :presentation | 
			presentation dropDownList
				display: [ types ];
				selectedIndex: (types indexOf: self match class type);
				onChangeOfPort: #selection act: [ :list | self changedSearchTo: list selection ] ].
	browser transmit
		to: #value;
		andShow: [ :presentation | 
			presentation dynamic
				updateOn: #match from: [ self announcer ];
				display: [ | composite |
					composite := GLMCompositePresentation new.
					match buildInterfaceIn: composite.
					composite startOn: match.
					composite ] ]