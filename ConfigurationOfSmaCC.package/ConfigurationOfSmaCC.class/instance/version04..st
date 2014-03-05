versions
version04: spec
	<version: '0.4' imports: #('0.1-baseline')>
	
	spec for: #'pharo3.x' do: [
		spec
			blessing: #stable;
			author: 'ThierryGoubier';
			description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-ThierryGoubier.36'.
		
	]