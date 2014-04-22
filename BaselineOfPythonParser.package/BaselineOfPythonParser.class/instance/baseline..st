accessing
baseline: spec
	<baseline>
	spec
		for: #pharo
		do: [ 
			spec repository: 'github://ThierryGoubier/SmaCC:pharo30-dev'.
			spec
				project: 'SmaCC'
				with: [ 
					spec
						className: 'ConfigurationOfSmaCC';
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main' ].
			spec package: 'SmaCC-Python' with: [ spec requires: #('SmaCC') ] ]