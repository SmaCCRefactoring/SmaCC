accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'SmaCC';
				import: 'SmaCC-Runtime'.
			spec package: 'SmaCC-Python' ]