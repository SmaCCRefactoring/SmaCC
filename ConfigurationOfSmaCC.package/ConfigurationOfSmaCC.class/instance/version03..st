versions
version03: spec
	<version: '0.3' imports: #('0.1-baseline')>
	
	spec for: #'pharo2.x' do: [
		spec
			blessing: #stable;
			author: 'ThierryGoubier';
			description: 'SmaCC Smalltalk Compiler Compiler for Pharo 2.0'.
		spec
			package: 'SmaCC' with: 'SmaCC-lr.14';
			package: 'SmaCCDev' with: 'SmaCCDev-ThierryGoubier.34'.
		
	]