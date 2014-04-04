versions
version203: spec
	<version: '2.0.3' imports: #('2.0-baseline')>
	spec
		for: #'pharo3.x'
		do: [ 
			spec repository: 'gitfiletree://github.com/ThierryGoubier/SmaCC.git?protocol=git&branch=pharo30-dev'.
			spec
				blessing: #development;
				author: 'ThierryGoubier';
				description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0' ]