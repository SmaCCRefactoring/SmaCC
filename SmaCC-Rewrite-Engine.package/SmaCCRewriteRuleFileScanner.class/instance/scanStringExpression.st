private
scanStringExpression
	| string |
	string := stream upToAll: '<<<'.
	stream skip: -3.
	^string