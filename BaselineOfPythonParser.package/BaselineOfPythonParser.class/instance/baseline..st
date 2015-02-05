accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'SmaCC-Source-Editing';
				package: 'SmaCC-Runtime' with: [ spec requires: 'SmaCC-Source-Editing' ];
				package: 'SmaCC-Python' with: [ spec requires: 'SmaCC-Runtime' ];
				group: 'default' with: #('SmaCC-Python') ]