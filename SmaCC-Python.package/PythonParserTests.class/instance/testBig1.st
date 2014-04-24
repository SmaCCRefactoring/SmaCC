tests - programs
testBig1
	self parse: 
'import random
 
# Create a grid filled with "." representing a blank
def createGrid():
    grid=[]
    for row in range(15):
        grid.append([])
        for column in range(50):
            grid[row].append(".")
    return grid
         
# Print the grid to the screen        
def printGrid(grid):
    for row in range(len(grid)):
        for column in range(len(grid[row])):
            end=""
            print(grid[row][column],end)
        print()
         
# Try to place the word. Return True if successful
# False if it failed and we need to try again.
def tryToPlaceWord(grid,word):
    # Figure out the direction of the work. 
    # Change the 8 to a 7 if you don''t want backwards
    # words.
    direction=random.randrange(0,8)
    if( direction == 0 ):
        x_change=-1
        y_change=-1
    if( direction == 1 ):
        x_change=0
        y_change=1
    if( direction == 2 ):
        x_change=1
        y_change=-1
    if( direction == 3 ):
        x_change=1
        y_change=0
    if( direction == 4 ):
        x_change=1
        y_change=1
    if( direction == 5 ):
        x_change=0
        y_change=1
    if( direction == 6 ):
        x_change=-1
        y_change=1
    if( direction == 7 ):
        x_change=-1
        y_change=0
         
    # Find the length and height of the grid
    height=len(grid)
    width=len(grid[0])
     
    # Create a random start point
    column=random.randrange(width)
    row=random.randrange(height)
     
    # Check to make sure  the word won''t run off the edge of the grid.
    # If it does, return False. We failed.
    if( x_change < 0 and column < len(word) ):
        return False
    if( x_change > 0 and column > width-len(word) ):
        return False
    if( y_change < 0 and row < len(word) ):
        return False
    if( y_change > 0 and row > height-len(word) ):
        return False
     
    # Now check to make sure there isn''t another letter in our way
    current_column=column
    current_row=row
    for letter in word:
        # Make sure it is blank, or already the correct letter.
        if grid[current_row][current_column]==letter or grid[current_row][current_column]==''.'':
            current_row += y_change
            current_column += x_change
        else:
            # Oh! A different letter is already here. Fail.
            return False
         
    # Everything is good so far, actually place the letters.
    current_column=column
    current_row=row
    for letter in word:
        grid[current_row][current_column]=letter
        current_row += y_change
        current_column += x_change
    return True
 
# This just calls tryToPlaceWord until we succeed. It could
# repeat forever if there is no possible place to put the word.
def placeWord(grid,word):
    success=False
     
    while not(success):
        success=tryToPlaceWord(grid,word)
     
# Create an empty grid   
grid = createGrid()
 
# Place some words
placeWord(grid,"pandabear")
placeWord(grid,"fish")
placeWord(grid,"snake")
placeWord(grid,"porcupine")
placeWord(grid,"dog")
placeWord(grid,"cat")
placeWord(grid,"tiger")
placeWord(grid,"bird")
placeWord(grid,"alligator")
placeWord(grid,"ant")
placeWord(grid,"camel")
placeWord(grid,"dolphin")
 
# Print it out
printGrid(grid)

'