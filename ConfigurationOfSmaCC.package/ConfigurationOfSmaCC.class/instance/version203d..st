versions
version203d: spec
	<version: '2.0.3' imports: #('2.0-baseline')>
	spec
		for: #'pharo3.x'
		do: [ 
			spec
				blessing: #development;
				author: 'ThierryGoubier';
				description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0'.
			spec repository: 'github://ThierryGoubier/SmaCC:pharo30-dev' ]