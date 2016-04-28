accessing
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec
				package: 'SmaCC-Source-Editing';
				package: 'SmaCC-Browser';
				package: 'SmaCC-Runtime'
					with: [ spec requires: 'SmaCC-Source-Editing' ];
				package: 'SmaCC-GLR-Runtime'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Development'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Development-UI'
					with: [ spec requires: 'SmaCC-Development' ];
				package: 'SmaCC-Tests'
					with: [ spec requires: 'SmaCC-Development' ];
				package: 'SmaCC-Rewrite-Engine'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Rewrite-Engine-Tests'
					with: [ spec requires: 'SmaCC-Rewrite-Engine' ];
				package: 'SmaCC-Server-Session';
				package: 'SmaCC-Rewrite-Server'
					with: [ spec requires: 'SmaCC-Server-Session' ];
				package: 'SmaCC-Rewrite-Server-Worker'
					with: [ spec
						requires: 'SmaCC-Rewrite-Engine';
						requires: 'SmaCC-Server-Session' ];
				package: 'SmaCC-Smalltalk-Parser'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-C-Parser'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-CSV' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-CSharp'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Cucumber'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Javascript'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Java'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Python' with: [ spec requires: 'SmaCC-Runtime' ].
			spec
				group: 'default' with: #('Tools');
				group: 'Runtime' with: #('SmaCC-GLR-Runtime');
				group: 'Rewrite' with: #('SmaCC-Rewrite-Engine');
				group: 'Rewrite-Server'
					with: #('SmaCC-Rewrite-Server-Worker' 'SmaCC-Rewrite-Server' 'Rewrite');
				group: 'Tools'
					with: #('SmaCC-Development-UI' 'Examples' 'Rewrite');
				group: 'Examples'
					with:
					#('SmaCC-Smalltalk-Parser' 'SmaCC-C-Parser' 'SmaCC-CSharp' 'SmaCC-Java' 'SmaCC-Python' 'SmaCC-Javascript' 'SmaCC-CSV' 'SmaCC-Cucumber');
				group: 'Tests'
					with: #('SmaCC-Tests' 'SmaCC-Rewrite-Engine-Tests' 'SmaCC-Python') ]