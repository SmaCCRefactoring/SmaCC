versions
version05: spec
	<version: '0.5' imports: #('2.0-baseline')>
	spec
		for: #'pharo3.x'
		do: [ 
			spec
				blessing: #stable;
				author: 'ThierryGoubier';
				description: 'SmaCC Smalltalk Compiler Compiler for Pharo 3.0'.
			spec repository: 'github://ThierryGoubier/SmaCC:master'.
			spec
				package: 'SmaCC-C-Parser' with: 'SmaCC-C-Parser-ThierryGoubier.2';
				package: 'SmaCC-CSharp' with: 'SmaCC-CSharp-ThierryGoubier.3';
				package: 'SmaCC-Development' with: 'SmaCC-Development-ThierryGoubier.14';
				package: 'SmaCC-Development-UI' with: 'SmaCC-Development-UI-ThierryGoubier.15';
				package: 'SmaCC-Examples-Tests' with: 'SmaCC-Examples-Tests-ThierryGoubier.13';
				package: 'SmaCC-GLR-Runtime' with: 'SmaCC-GLR-Runtime-ThierryGoubier.2';
				package: 'SmaCC-Java' with: 'SmaCC-Java-ThierryGoubier.4';
				package: 'SmaCC-Rewrite-Engine' with: 'SmaCC-Rewrite-Engine-ThierryGoubier.3';
				package: 'SmaCC-Rewrite-Engine-Tests' with: 'SmaCC-Rewrite-Engine-Tests-ThierryGoubier.1';
				package: 'SmaCC-Runtime' with: 'SmaCC-Runtime-ThierryGoubier.2';
				package: 'SmaCC-Smalltalk-Parser' with: 'SmaCC-Smalltalk-Parser-ThierryGoubier.2';
				package: 'SmaCC-Source-Editing' with: 'SmaCC-Source-Editing-ThierryGoubier.1';
				package: 'SmaCC-Tests' with: 'SmaCC-Tests-ThierryGoubier.9';
				package: 'SmaCC-Rewrite-Server' with: 'SmaCC-Rewrite-Server-ThierryGoubier.2';
				package: 'SmaCC-Rewrite-Server-Worker' with: 'SmaCC-Rewrite-Server-Worker-ThierryGoubier.1';
				package: 'SmaCC-Server-Session' with: 'SmaCC-Server-Session-ThierryGoubier.2' ]