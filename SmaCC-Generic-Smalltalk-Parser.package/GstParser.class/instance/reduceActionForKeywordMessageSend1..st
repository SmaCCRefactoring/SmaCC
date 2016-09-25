generated-reduction actions
reduceActionForKeywordMessageSend1: nodes
	| result |
	result := GstMessageSendNode new.
	result receiver: ((nodes at: 1) at: 1).
	result message: ((nodes at: 1) at: 2).
	^ result