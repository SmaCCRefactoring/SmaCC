versions
version203: spec
	<version: '2.0.3' imports: #('2.0-baseline')>
	spec
		for: #common
		do: [ 
			self class ensureGitFileTree.
			spec
				blessing: #development;
				author: 'ThierryGoubier';
				description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0' ]