gitfiletree support
ensureGitFileTree
	"And all related dependencies."

	Smalltalk
		at: #MCFileTreeGitRepository
		ifAbsent: [ 
			Gofer new
				url: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo30/main';
				configurationOf: 'GitFileTree';
				loadDevelopment ]