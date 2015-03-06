accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec baseline: 'AlTreeMorph' with: [ spec repository: 'github://ThierryGoubier/AltBrowser:pharo3.0' ].
			spec
				baseline: 'SmaCC' with: [ spec repository: 'github://ThierryGoubier/SmaCC' ];
				import: 'SmaCC'.
			spec package: 'SmaCC-Browser' with: [ spec requires: #('SmaCC-Runtime' 'AlTreeMorph') ].
			spec group: 'default' with: #('SmaCC-Browser') ]