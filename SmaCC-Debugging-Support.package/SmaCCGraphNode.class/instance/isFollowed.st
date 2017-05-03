testing
isFollowed
	^ previousNodes isEmpty or: [ previousNodes anySatisfy: [ :each | each followed == self ] ]