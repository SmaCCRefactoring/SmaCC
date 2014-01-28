baselines
baseline01: spec
	<version: '0.1-baseline'>
	
	spec for: #common do: [
		spec blessing: #baseline.
		spec repository: 'http://www.squeaksource.com/SmaccDevelopment'.

		spec
			package: 'SmaCC';
			package: 'SmaCCDev' with: [ spec requires: 'SmaCC' ].
		
		spec
			group: 'default' with: #('Runtime');
			group: 'Runtime' with: #('SmaCC');
			group: 'Tools' with: #('SmaCCDev')
	]