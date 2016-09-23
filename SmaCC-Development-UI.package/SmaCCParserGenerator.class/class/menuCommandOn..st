world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'SmaCC Parser Generator')
		parent: #Tools;
		order: 0.55;
		action: [ self open ].
	aBuilder withSeparatorAfter