I apply an action from the debugger. I iterate as long as a test block isn't false.

Beware: I may deadlock the image if the block I'm using to move from one instruction to another never returns false.