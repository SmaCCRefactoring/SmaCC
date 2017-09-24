baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec
				package: 'SmaCC-Source-Editing';
				package: 'SmaCC-Runtime';
				package: 'SmaCC-GLR-Runtime'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Debugging-Support'
					with: [ spec requires: 'SmaCC-Development-UI' ].
			spec
				package: 'SmaCC-Development'
				with: [ spec requires: 'SmaCC-GLR-Runtime' ].
			spec
				for: #Alt
				do: [ spec
						package: 'SmaCC-Alt' with: [ spec requires: 'SmaCC-Runtime' ];
						package: 'SmaCC-Development-UI'
							with: [ spec requires: #('SmaCC-Development' 'SmaCC-Alt') ] ].
			spec
				for: #NoAlt
				do: [ spec
						package: 'SmaCC-Development-UI'
						with: [ spec requires: 'SmaCC-Development' ] ].
			spec
				package: 'SmaCC-Tests'
					with: [ spec requires: 'SmaCC-Development' ];
				package: 'SmaCC-Browser' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Parse-Tree-Comparison'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Rewrite-Engine'
					with: [ spec
						requires: #('SmaCC-GLR-Runtime' 'SmaCC-Source-Editing' 'SmaCC-CSV-Parser') ];
				package: 'SmaCC-Rewrite-Engine-Tests'
					with: [ spec requires: 'SmaCC-Rewrite-Engine' ];
				package: 'SmaCC-Rewrite-Engine-Command-Line'
					with: [ spec requires: 'SmaCC-Rewrite-Engine' ];
				package: 'SmaCC-Rewrite-Server';
				package: 'SmaCC-Rewrite-Server-Worker'
					with: [ spec requires: 'SmaCC-Rewrite-Engine' ];
				package: 'SmaCC-Swift'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Smalltalk-Parser'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Generic-Smalltalk-Parser'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-C-Parser'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-CSV-Parser'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-CSharp'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Cucumber'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Javascript-Parser'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Java'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-Python' with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Python-Tests'
					with: [ spec requires: 'SmaCC-Python' ];
				package: 'SmaCC-Line-Parser'
					with: [ spec requires: 'SmaCC-Runtime' ];
				package: 'SmaCC-Delphi'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-DelphiForms'
					with: [ spec requires: 'SmaCC-GLR-Runtime' ];
				package: 'SmaCC-IDL' with: [ spec requires: 'SmaCC-Runtime' ].
			spec
				group: 'default' with: #('Tools');
				group: 'Runtime' with: #('SmaCC-GLR-Runtime');
				group: 'Rewrite' with: #('SmaCC-Rewrite-Engine');
				group: 'Rewrite-Server'
					with:
					#('SmaCC-Rewrite-Server-Worker' 'SmaCC-Rewrite-Server' 'Rewrite' 'SmaCC-Rewrite-Engine-Command-Line');
				group: 'Tools'
					with:
					#('SmaCC-Development-UI' 'Examples' 'Rewrite' 'SmaCC-Parse-Tree-Comparison');
				group: 'Debugging' with: #('SmaCC-Debugging-Support');
				group: 'Examples'
					with:
					#('SmaCC-Smalltalk-Parser' 'SmaCC-C-Parser' 'SmaCC-Java' 'SmaCC-CSV-Parser'  'SmaCC-Line-Parser');
				group: 'Examples-Extra'
					with:
					#('SmaCC-IDL' 'SmaCC-CSharp' 'SmaCC-Cucumber' 'SmaCC-Swift' 'SmaCC-Delphi' 'SmaCC-DelphiForms' 'SmaCC-Python' 'SmaCC-Javascript-Parser');
				group: 'Tests'
					with: #('SmaCC-Tests' 'SmaCC-Rewrite-Engine-Tests' 'SmaCC-Python-Tests') ]