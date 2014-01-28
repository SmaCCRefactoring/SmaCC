versions
version01: spec
	<version: '0.1' imports: #('0.1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #stable;
			author: 'topa';
			description: 'Make SmaCC available via Metacello'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-AlainPlantec.25'.
		
	]