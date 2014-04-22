accessing
baseline: spec
	<baseline>
	spec
		for: #pharo
		do: [ 
			spec repository: 'gitfiletree://github.com/ThierryGoubier/SmaCC.git?protocol=git&branch=pharo30-dev'.
			spec
				project: 'SmaCC'
				with: [ 
					spec
						className: 'ConfigurationOfSmaCC';
						versionString: #development;
						repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main' ].
			spec package: 'SmaCC-Python' with: [ spec requires: #('SmaCC') ] ]