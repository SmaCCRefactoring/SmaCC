class initialization
menuCommandOn: aBuilder 
	<worldMenu> 
	(aBuilder item: #'SmaCC Parser Generator')
			parent: #Tools;
			action: [ self open ]; 
			help: 'Create and test parsers with SmaCC'.