versions
version02: spec
	<version: '0.2' imports: #('0.1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #stable;
			author: 'ThierryGoubier';
			description: 'SmaCC Smalltalk Compiler Compiler for Pharo 1.4'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-ThierryGoubier.31'.
		
	]