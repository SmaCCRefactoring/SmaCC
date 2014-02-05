baselines
baseline20: spec
	<version: '2.0-baseline'>
	
	self class ensureGitFileTree.
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec repository: 'gitfiletree://github.com/ThierryGoubier/Smacc.git?protocol=git'.
			spec
				package: 'SmaCC-Source-Editing';
				package: 'SmaCC-Runtime' with: [ spec requires: 'SmaCC-Source-Editing' ];
				package: 'SmaCC-GLR-Runtime' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Development' with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Development-UI' with: [ spec requires: 'SmaCC-Development' ];
				package: 'SmaCC-Tests' with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Rewrite-Engine' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Rewrite-Engine-Tests' with: [ spec requires: 'SmaCC-Rewrite-Engine' ];
				package: 'SmaCC-Server-Session';
				package: 'SmaCC-Rewrite-Server' with: [ spec requires: 'SmaCC-Server-Session' ];
				package: 'SmaCC-Rewrite-Server-Worker'
					with: [ 
							spec
								requires: 'SmaCC-Rewrite-Engine';
								requires: 'SmaCC-Server-Session' ];
				package: 'SmaCC-Smalltalk-Parser' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-C-Parser' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-CSharp' with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Java' with: [ spec requires: 'SmaCC-GLR-Runtime' ].
			spec
				group: 'default' with: #('Tools');
				group: 'Runtime' with: #('SmaCC-GLR-Runtime');
				group: 'Rewrite' with: #('SmaCC-Rewrite-Server-Worker' 'SmaCC-Rewrite-Server');
				group: 'Tools' with: #('SmaCC-Development-UI' 'Examples');
				group: 'Examples' with: #('SmaCC-Smalltalk-Parser' 'SmaCC-C-Parser' 'SmaCC-CSharp' 'SmaCC-Java') ]