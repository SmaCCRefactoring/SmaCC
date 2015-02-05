accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'SmaCC-Python'
				with: [ 
					spec
						baseline: 'SmaCC';
						import: 'SmaCC-Runtime' ] ]