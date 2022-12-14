Class {
	#name : #PythonParserTests,
	#superclass : #TestCase,
	#category : 'SmaCC-Python-Tests'
}

{ #category : #resources }
PythonParserTests >> codeBig1 [
	^
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
]

{ #category : #accessing }
PythonParserTests >> parse: aSource [
	| parser |
	parser := self parserClass on: (ReadStream on: aSource).
	^ parser parse
]

{ #category : #accessing }
PythonParserTests >> parserClass [
	^ PythonParser2
]

{ #category : #resources }
PythonParserTests >> sourceBig2 [
	^ '"""
 Show how to bounce a ball with a paddle in Pygame.
 This program assumes there are two joysticks plugged in.
  
 Sample Python/Pygame Programs
 Simpson College Computer Science
 http://programarcadegames.com/
 http://simpson.edu/computer-science/
"""
import pygame
import random
 
black = (0, 0, 0)
white = (255, 255, 255)
blue =  (0, 0, 255)
 
class Player(pygame.sprite.Sprite):
    """ This class represents the paddles on either side of the screen
        It derives from the "Sprite" class in Pygame """
 
    # Class Attributes
    width = 10
    height = 75
    my_joystick = None
     
    # Constructor. Pass in the color of the block, and its x and y position
    def __init__(self, x, y, joystick_no):
        # Call the parent class (Sprite) constructor
        pygame.sprite.Sprite.__init__(self) 
 
        # Variables to hold the height and width of the block
 
        # Create an image of the ball, and fill it with a color.
        # This could also be an image loaded from the disk.
        self.image = pygame.Surface([self.width, self.height])
        self.image.fill(white)
 
        # Fetch the rectangle object that has the dimensions of the image
        self.rect = self.image.get_rect()
         
        # Set initial position of sprite to 100,100
        self.rect.x = x
        self.rect.y = y
         
        # Count the joysticks the computer has
        joystick_count = pygame.joystick.get_count()
        if joystick_count < joystick_no+1:
            # No joysticks!
            print ("Error, I didn''t find enough joysticks. Found ", joystick_count)
        else:
            # Use joystick #0 and initialize it
            self.my_joystick = pygame.joystick.Joystick(joystick_no)
            self.my_joystick.init()
         
 
    def update(self):
        """ Update the player''s position. """
        # As long as there is a joystick
        if self.my_joystick != None:
         
            # This gets the position of the axis on the game controller
            # It returns a number between -1.0 and +1.0
            vert_axis_pos = self.my_joystick.get_axis(1)   
             
            # Move x according to the axis. 
            # We multiply by 10 to speed up the movement.
            self.rect.y = self.rect.y+vert_axis_pos*10
             
            # If the user moves past the top/bottom of the screen, set the position
            # to the edge.
            if self.rect.y < 0:
                self.rect.y = 0
            if self.rect.y > screen_height - self.height:
                self.rect.y = screen_height - self.height
 
class Wall(pygame.sprite.Sprite):
    """ This class represents the wall at the top and bottom of the
        screen. """
 
    # Constructor function
    def __init__(self, x, y, width, height):
        # Call the parent''s constructor
        pygame.sprite.Sprite.__init__(self)
 
        # Make a blue wall, of the size specified in the parameters
        self.image = pygame.Surface([width, height])
        self.image.fill((blue))
 
        # Make our top-left corner the passed-in location.
        self.rect = self.image.get_rect()
        self.rect.y = y
        self.rect.x = x
         
class Ball(pygame.sprite.Sprite):
    """ This class represents the ball that bounces around. """
 
    # Set speed vector
    change_x = 0
    change_y = 0
    walls = None
     
    # Constructor function
    def __init__(self, x, y, walls):
        # Call the parent''s constructor
        pygame.sprite.Sprite.__init__(self)
  
        # Set height, width
        self.image = pygame.Surface([15, 15])
        self.image.fill(white)
 
        # Make our top-left corner the passed-in location.
        self.rect = self.image.get_rect()
        self.rect.y = y
        self.rect.x = x
         
        self.walls = walls
         
    def update(self):
        """ Updat the ball''s position. """
        # Get the old position, in case we need to go back to it
        old_x = self.rect.x
        new_x = old_x + self.change_x
        self.rect.x = new_x
         
        # Did this update cause us to hit a wall?
        collide = pygame.sprite.spritecollide(self, self.walls, False)
        if collide:
            # Whoops, hit a wall. Go back to the old position
            self.rect.x = old_x
            self.change_x *= -1
 
        old_y = self.rect.y
        new_y = old_y + self.change_y
        self.rect.y = new_y
         
        # Did this update cause us to hit a wall?
        collide = pygame.sprite.spritecollide(self, self.walls, False)
        if collide:
            # Whoops, hit a wall. Go back to the old position
            self.rect.y = old_y
            self.change_y *= -1
             
        if self.rect.x < -20 or self.rect.x > screen_width + 20:
            self.change_x = 0
            self.change_y = 0
 
             
# Call this function so the Pygame library can initialize itself
pygame.init()
 
# Create an 800x600 sized screen
screen_width = 800
screen_height = 600
 
screen = pygame.display.set_mode([screen_width, screen_height])
 
# Set the title of the window
pygame.display.set_caption(''Test'')
 
# Create a surface we can draw on
background = pygame.Surface(screen.get_size())
 
# Used for converting color maps and such
background = background.convert()
 
# Fill the screen with a black background
background.fill(black)
 
# All sprite lists
wall_list = pygame.sprite.Group()
all_sprites = pygame.sprite.Group()
movingsprites = pygame.sprite.Group()
 
# Create the players
player1 = Player(10, screen_height / 2, 0)
all_sprites.add(player1)
wall_list.add(player1)
movingsprites.add(player1)
 
player2 = Player(screen_width - 20, screen_height / 2, 1)
all_sprites.add(player2)
wall_list.add(player2)
movingsprites.add(player2)
 
# Make the walls. (x_pos, y_pos, width, height)
# Top wall
wall = Wall(0, 0, screen_width, 10) 
wall_list.add(wall)
all_sprites.add(wall)
 
# Bottom wall
wall = Wall(0, screen_height - 10, screen_width, screen_height) 
wall_list.add(wall)
all_sprites.add(wall)
 
# Create the ball
ball = Ball( -50, -50, wall_list )
movingsprites.add(ball)
all_sprites.add(ball)
 
clock = pygame.time.Clock()
 
done = False
 
# Main program loop
while not done:
     
    # Loop through any window events
    for event in pygame.event.get():
        # The user clicked ''close'' or hit Alt-F4
        if event.type == pygame.QUIT:
            done = True
             
        # The user clicked the mouse button
        # or pressed a key
        elif event.type == pygame.MOUSEBUTTONDOWN or event.type == pygame.KEYDOWN:
             
            # Is the ball not moving?
            if ball.change_y == 0:
                 
                # Start in the middle of the screen at a random y location
                ball.rect.x = screen_width/2
                ball.rect.y = random.randrange(10, screen_height - 0)
                 
                # Set a random vector
                ball.change_y = random.randrange(-5, 6)
                ball.change_x =  random.randrange(5, 10)
                 
                # Is the ball headed left or right? Select randomly
                if( random.randrange(2) == 0 ):
                    ball.change_x *= -1
 
                 
    # Update the ball position. Pass it the list of stuff it can bounce off of
    movingsprites.update()
     
    # Clear the screen
    screen.fill(black)
     
    # Draw the sprites
    all_sprites.draw(screen)
 
    # Display the screen
    pygame.display.flip()
 
    clock.tick(30)
 
# All done, shut down Pygame            
pygame.quit()

'
]

{ #category : #resources }
PythonParserTests >> sourceBig3 [
	^ '"""
Use sprites to collect blocks.
 
Sample Python/Pygame Programs
Simpson College Computer Science
http://programarcadegames.com/
http://simpson.edu/computer-science/
 
Explanation video: http://youtu.be/4W2AqUetBi4
"""
import pygame
import random
 
# Define some colors
BLACK = (  0,   0,   0)
WHITE = (255, 255, 255)
RED   = (255,   0,   0)
 
class Block(pygame.sprite.Sprite):
    """
    This class represents the ball.
    It derives from the "Sprite" class in Pygame.
    """
    # Constructor. Pass in the color of the block,
    # and its x and y position
    def __init__(self, color, width, height):
        # Call the parent class (Sprite) constructor
        pygame.sprite.Sprite.__init__(self)
 
        # Create an image of the block, and fill it with a color.
        # This could also be an image loaded from the disk.
        self.image = pygame.Surface([width, height])
        self.image.fill(color)
 
        # Fetch the rectangle object that has the dimensions of the image
        # image.
        # Update the position of this object by setting the values
        # of rect.x and rect.y
        self.rect = self.image.get_rect()
 
# Initialize Pygame
pygame.init()
 
# Set the height and width of the screen
screen_width = 700
screen_height = 400
screen = pygame.display.set_mode([screen_width, screen_height])
 
# This is a list of ''sprites.'' Each block in the program is
# added to this list. The list is managed by a class called ''Group.''
block_list = pygame.sprite.Group()
 
# This is a list of every sprite. All blocks and the player block as well.
all_sprites_list = pygame.sprite.Group()
 
for i in range(50):
    # This represents a block
    block = Block(BLACK, 20, 15)
 
    # Set a random location for the block
    block.rect.x = random.randrange(screen_width)
    block.rect.y = random.randrange(screen_height)
 
    # Add the block to the list of objects
    block_list.add(block)
    all_sprites_list.add(block)
 
# Create a RED player block
player = Block(RED, 20, 15)
all_sprites_list.add(player)
 
#Loop until the user clicks the close button.
done = False
 
# Used to manage how fast the screen updates
clock = pygame.time.Clock()
 
score = 0
 
# -------- Main Program Loop -----------
while not done:
    for event in pygame.event.get(): # User did something
        if event.type == pygame.QUIT: # If user clicked close
            done = True # Flag that we are done so we exit this loop
 
    # Clear the screen
    screen.fill(WHITE)
 
    # Get the current mouse position. This returns the position
    # as a list of two numbers.
    pos = pygame.mouse.get_pos()
 
    # Fetch the x and y out of the list,
       # just like we''d fetch letters out of a string.
    # Set the player object to the mouse location
    player.rect.x = pos[0]
    player.rect.y = pos[1]
 
    # See if the player block has collided with anything.
    blocks_hit_list = pygame.sprite.spritecollide(player, block_list, True)
 
    # Check the list of collisions.
    for block in blocks_hit_list:
        score += 1
        print(score)
 
    # Draw all the spites
    all_sprites_list.draw(screen)
 
    # Limit to 60 frames per second
    clock.tick(60)
 
    # Go ahead and update the screen with what we''ve drawn.
    pygame.display.flip()
 
pygame.quit()

'
]

{ #category : #resources }
PythonParserTests >> sourceCommentAtEnd [
	^ '__import__("pkg_resources").declare_namespace(__name__)
##############################################################
# End of file
##############################################################'
]

{ #category : #resources }
PythonParserTests >> sourceFor1 [
	^ '
#http://programarcadegames.com/python_examples/show_file.php?file=for_loop_examples.py
# Sample Python/Pygame Programs
# Simpson College Computer Science
# http://programarcadegames.com/
# http://simpson.edu/computer-science/
 
# Print ''Hi'' 10 times
for i in range(10):
    print ("Hi")
     
# Print ''Hello'''' 5 times and ''There'' once
for i in range(5):
    print ("Hello")
print ("There")
  
# Print ''Hello'' ''There'' 5 times
for i in range(5):
    print ("Hello")
    print ("There")
  
# Print the numbers 0 to 9
for i in range(10):
    print (i)
     
# Two ways to print the numbers 1 to 10
for i in range(1,11):
    print (i)
     
for i in range(10):
    print (i+1)
     
# Two ways to print the even numbers 2 to 10
for i in range(2,12,2):
    print (i)
     
for i in range(5):
    print ((i+1)*2)
     
# Count down from 10 down to 1 (not zero)
for i in range(10,0,-1):
    print(i)
     
# Print numbers out of a list
for i in [2,6,4,2,4,6,7,4]:
    print(i)
     
# What does this print? Why?
for i in range(3):
    print ("a")
    for j in range(3):
        print ("b")
 
# What is the value of a?
a=0
for i in range(10):
    a=a+1
print(a)
 
# What is the value of a?
a=0
for i in range(10):
    a=a+1
for j in range(10):
    a=a+1
print(a)
 
# What is the value of a?
a=0
for i in range(10):
    a=a+1
    for j in range(10):
        a=a+1
print(a)     
 
# What is the value of sum?
sum=0
for i in range(1,101):
    sum = sum + i
'
]

{ #category : #resources }
PythonParserTests >> sourceIf1 [
	^ '
#http://programarcadegames.com/python_examples/show_file.php?file=if_statement_examples.py
# Sample Python/Pygame Programs
# Simpson College Computer Science
# http://programarcadegames.com/
# http://simpson.edu/computer-science/
 
# Explanation video: http://youtu.be/pDpNSck2aXQ
 
# Variables used in the example if statements
a = 4
b = 5
c = 6
 
# Basic comparisons
if a < b:
    print("a is less than b")
 
if a > b:
    print("a is greater than than b")
 
if a <= b:
    print("a is less than or equal to b")
 
if a >= b:
    print("a is greater than or equal to b")
 
# NOTE: It is very easy to mix when to use == and =.
# Use == if you are asking if they are equal, use =
# if you are assigning a value.
if a == b:
    print("a is equal to b")
    
# Not equal 
if a != b:
  print("a and b are not equal")
     
# And
if a < b and a < c:
    print("a is less than b and c")
  
# Non-exclusive or   
if a < b or a < c:
    print("a is less than either a or b (or both)")
 
     
# Boolean data type. This is legal!
a = True
if a:
    print("a is true")
     
if not a:
    print("a is false")
 
a = True
b = False
 
if a and b:
    print("a and b are both true")
     
a = 3
b = 3
c = a == b
print(c)
 
# These are also legal and will trigger as being true because
# the values are not zero:
if 1:
    print("1")
if "A":
    print("A")
 
# This will not trigger as true because it is zero.
if 0:
    print("Zero")
     
# Comparing variables to multiple values.
# The first if statement appears to work, but it will always 
# trigger as true even if the variable a is not equal to b.
# This is because "b" by itself is considered true.
a = "c"
if a == "B" or "b":
    print("a is equal to b. Maybe.")
     
# This is the proper way to do the if statement.
if a == "B" or a == "b":
    print("a is equal to b.")
 
# Example 1: If statement
temperature = int(input("What is the temperature in Fahrenheit? "))
if temperature > 90:
    print("It is hot outside")
print("Done")
 
# Example 2: Else statement
temperature = int(input("What is the temperature in Fahrenheit? "))
if temperature > 90:
    print("It is hot outside")
else:
    print("It is not hot outside")
print("Done")
 
#Example 3: Else if statement
temperature = int(input("What is the temperature in Fahrenheit? "))
if temperature > 90:
    print("It is hot outside")
elif temperature < 30:
    print("It is cold outside")
else:
    print("It is not hot outside")
print("Done")
 
# Example 4: Ordering of statements
# Something with this is wrong. What?
temperature = int(input("What is the temperature in Fahrenheit? "))
if temperature > 90:
    print("It is hot outside")
elif temperature > 110:
    print("Oh man, you could fry eggs on the pavement!")
elif temperature < 30:
    print("It is cold outside")
else:
    print("It is ok outside")
print("Done")
 
# Comparisons using string/text
# Note, this example does not work when running under Eclipse
# because the input will contain an extra carriage return at the
# end. It works fine under IDLE.
userName = input("What is your name? ")
if userName == "Paul":
    print("You have a nice name.")
else:
    print("Your name is ok.") 
'
]

{ #category : #resources }
PythonParserTests >> sourceLambda1 [
	^ 'def make_incrementor (n): return lambda x: x + n
'
]

{ #category : #resources }
PythonParserTests >> sourceLambda2 [
	^ '
foo = [2, 18, 9, 22, 17, 24, 8, 12, 27]
print filter(lambda x: x % 3 == 0, foo)
print map(lambda x: x * 2 + 10, foo)
print reduce(lambda x, y: x + y, foo)
'
]

{ #category : #resources }
PythonParserTests >> sourceLibDummyThreading [
	^ '"""Faux ``threading`` version using ``dummy_thread`` instead of ``thread``.

The module ``_dummy_threading`` is added to ``sys.modules`` in order
to not have ``threading`` considered imported.  Had ``threading`` been
directly imported it would have made all subsequent imports succeed
regardless of whether ``_thread`` was available which is not desired.

"""
from sys import modules as sys_modules

import _dummy_thread

# Declaring now so as to not have to nest ``try``s to get proper clean-up.
holding_thread = False
holding_threading = False
holding__threading_local = False

try:
    # Could have checked if ``_thread`` was not in sys.modules and gone
    # a different route, but decided to mirror technique used with
    # ``threading`` below.
    if ''_thread'' in sys_modules:
        held_thread = sys_modules[''_thread'']
        holding_thread = True
    # Must have some module named ``_thread`` that implements its API
    # in order to initially import ``threading``.
    sys_modules[''_thread''] = sys_modules[''_dummy_thread'']

    if ''threading'' in sys_modules:
        # If ``threading`` is already imported, might as well prevent
        # trying to import it more than needed by saving it if it is
        # already imported before deleting it.
        held_threading = sys_modules[''threading'']
        holding_threading = True
        del sys_modules[''threading'']

    if ''_threading_local'' in sys_modules:
        # If ``_threading_local`` is already imported, might as well prevent
        # trying to import it more than needed by saving it if it is
        # already imported before deleting it.
        held__threading_local = sys_modules[''_threading_local'']
        holding__threading_local = True
        del sys_modules[''_threading_local'']

    import threading
    # Need a copy of the code kept somewhere...
    sys_modules[''_dummy_threading''] = sys_modules[''threading'']
    del sys_modules[''threading'']
    sys_modules[''_dummy__threading_local''] = sys_modules[''_threading_local'']
    del sys_modules[''_threading_local'']
    from _dummy_threading import *
    from _dummy_threading import __all__

finally:
    # Put back ``threading`` if we overwrote earlier

    if holding_threading:
        sys_modules[''threading''] = held_threading
        del held_threading
    del holding_threading

    # Put back ``_threading_local`` if we overwrote earlier

    if holding__threading_local:
        sys_modules[''_threading_local''] = held__threading_local
        del held__threading_local
    del holding__threading_local

    # Put back ``thread`` if we overwrote, else del the entry we made
    if holding_thread:
        sys_modules[''_thread''] = held_thread
        del held_thread
    else:
        del sys_modules[''_thread'']
    del holding_thread

    del _dummy_thread
    del sys_modules
'
]

{ #category : #resources }
PythonParserTests >> sourceNoReturnAtEnd [
	^ '__import__("pkg_resources").declare_namespace(__name__)'
]

{ #category : #resources }
PythonParserTests >> sourceParameterWithAssign1 [
	^ '
f(end="")
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram1 [
	^ 'print ''Hello, world!''
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram10 [
	^ 'from time import localtime

activities = {8: ''Sleeping'',
              9: ''Commuting'',
              17: ''Working'',
              18: ''Commuting'',
              20: ''Eating'',
              22: ''Resting'' }

time_now = localtime()
hour = time_now.tm_hour

for activity_time in sorted(activities.keys()):
    if hour < activity_time:
        print activities[activity_time]
        break
else:
    print ''Unknown, AFK or sleeping!''
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram10b [
	^ 'from time import localtime

activities = {8: ''Sleeping'',\
              9: ''Commuting'',\
              17: ''Working'',\
              18: ''Commuting'',\
              20: ''Eating'',\
              22: ''Resting'' }

time_now = localtime()
hour = time_now.tm_hour

for activity_time in sorted(activities.keys()):
    if hour < activity_time:
        print activities[activity_time]
        break
else:
    print ''Unknown, AFK or sleeping!''
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram11 [
	^ 'REFRAIN = ''''''
%d bottles of beer on the wall,
%d bottles of beer,
take one down, pass it around,
%d bottles of beer on the wall!
''''''
bottles_of_beer = 99
while bottles_of_beer > 1:
    print REFRAIN % (bottles_of_beer, bottles_of_beer,
        bottles_of_beer - 1)
    bottles_of_beer -= 1
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram12 [
	^ 'class BankAccount(object):
    def __init__(self, initial_balance=0):
        self.balance = initial_balance
    def deposit(self, amount):
        self.balance += amount
    def withdraw(self, amount):
        self.balance -= amount
    def overdrawn(self):
        return self.balance < 0
my_account = BankAccount(1)
my_account.withdraw(''t'')
print my_account.balance
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram13 [
	^ 'import unittest
def median(pool):
    copy = sorted(pool)
    size = len(copy)
    if size % 2 == 1:
        return copy[(size - 1) / 2]
    else:
        return (copy[size/2 - 1] + copy[size/2]) / 2
class TestMedian(unittest.TestCase):
    def testMedian(self):
        self.failUnlessEqual(median([2, 9, 9, 7, 9, 2, 4, 5, 8]), 7)
if __name__ == ''__main__'':
    unittest.main()

'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram14 [
	^ 'def median(pool):
    ''''''Statistical median to demonstrate doctest.
    >>> median([2, 9, 9, 7, 9, 2, 4, 5, 8])
    7
    ''''''
    copy = sorted(pool)
    size = len(copy)
    if size % 2 == 1:
        return copy[(size - 1) / 2]
    else:
        return (copy[size/2 - 1] + copy[size/2]) / 2
if __name__ == ''__main__'':
    import doctest
    doctest.testmod()
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram15 [
	^ 'from itertools import groupby
lines = ''''''
This is the
first paragraph.

This is the second.
''''''.splitlines()
# Use itertools.groupby and bool to return groups of
# consecutive lines that either have content or don''t.
for has_chars, frags in groupby(lines, bool):
    if has_chars:
        print '' ''.join(frags)
# PRINTS:
# This is the first paragraph.
# This is the second.
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram16 [
	^ 'import csv

# write stocks data as comma-separated values
writer = csv.writer(open(''stocks.csv'', ''wb'', buffering=0))
writer.writerows([
    (''GOOG'', ''Google, Inc.'', 505.24, 0.47, 0.09),
    (''YHOO'', ''Yahoo! Inc.'', 27.38, 0.33, 1.22),
    (''CNET'', ''CNET Networks, Inc.'', 8.62, -0.13, -1.49)
])

# read stocks data, print status messages
stocks = csv.reader(open(''stocks.csv'', ''rb''))
status_labels = {-1: ''down'', 0: ''unchanged'', 1: ''up''}
for ticker, name, price, change, pct in stocks:
    status = status_labels[cmp(float(change), 0.0)]
    print ''%s is %s (%s%%)'' % (name, status, pct)
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram17 [
	^ 'BOARD_SIZE = 8

def under_attack(col, queens):
    left = right = col

    for r, c in reversed(queens):
        left, right = left - 1, right + 1

        if c in (left, col, right):
            return True
    return False

def solve(n):
    if n == 0:
        return [[]]

    smaller_solutions = solve(n - 1)

    return [solution+[(n,i+1)]
        for i in xrange(BOARD_SIZE)
            for solution in smaller_solutions
                if not under_attack (i+1, solution) ]

for answer in solve(BOARD_SIZE):
    print answer
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram18 [
	^ 'import itertools

def iter_primes():
     # an iterator of all numbers between 2 and +infinity
     numbers = itertools.count(2)

     # generate primes forever
     while True:
         # get the first number from the iterator (always a prime)
         prime = numbers.next()
         yield prime

         # this code iteratively builds up a chain of
         # filters...slightly tricky, but ponder it a bit
         numbers = itertools.ifilter(prime.__rmod__, numbers)

for p in iter_primes():
    if p > 1000:
        break
    print p
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram19 [
	^ 'dinner_recipe = ''''''<html><body><table>
<tr><th>amt</th><th>unit</th><th>item</th></tr>
<tr><td>24</td><td>slices</td><td>baguette</td></tr>
<tr><td>2+</td><td>tbsp</td><td>olive oil</td></tr>
<tr><td>1</td><td>cup</td><td>tomatoes</td></tr>
<tr><td>1</td><td>jar</td><td>pesto</td></tr>
</table></body></html>''''''

# In Python 2.5 or from http://effbot.org/zone/element-index.htm
import xml.etree.ElementTree as etree
tree = etree.fromstring(dinner_recipe)

# For invalid HTML use http://effbot.org/zone/element-soup.htm
# import ElementSoup, StringIO
# tree = ElementSoup.parse(StringIO.StringIO(dinner_recipe))

pantry = set([''olive oil'', ''pesto''])
for ingredient in tree.getiterator(''tr''):
    amt, unit, item = ingredient
    if item.tag == "td" and item.text not in pantry:
        print "%s: %s %s" % (item.text, amt.text, unit.text)

'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram1b [
	^ 'pass
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram1c [
	^ 'a
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram2 [
	^ 'name = raw_input(''What is your name?\n'')
print ''Hi, %s.'' % name
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram20 [
	^ '
BOARD_SIZE = 8

class BailOut(Exception):
    pass

def validate(queens):
    left = right = col = queens[-1]
    for r in reversed(queens[:-1]):
        left, right = left-1, right+1
        if r in (left, col, right):
            raise BailOut

def add_queen(queens):
    for i in range(BOARD_SIZE):
        test_queens = queens + [i]
        try:
            validate(test_queens)
            if len(test_queens) == BOARD_SIZE:
                return test_queens
            else:
                return add_queen(test_queens)
        except BailOut:
            pass
    raise BailOut

queens = add_queen([])
print queens
print "\n".join(". "*q + "Q " + ". "*(BOARD_SIZE-q-1) for q in queens)
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram21 [
	^ '
import random

guesses_made = 0

name = raw_input(''Hello! What is your name?\n'')

number = random.randint(1, 20)
print ''Well, {0}, I am thinking of a number between 1 and 20.''.format(name)

while guesses_made < 6:

    guess = int(raw_input(''Take a guess: ''))

    guesses_made += 1

    if guess < number:
        print ''Your guess is too low.''

    if guess > number:
        print ''Your guess is too high.''

    if guess == number:
        break

if guess == number:
    print ''Good job, {0}! You guessed my number in {1} guesses!''.format(name, guesses_made)
else:
    print ''Nope. The number I was thinking of was {0}''.format(number)
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram3 [
	^ 'friends = [''john'', ''pat'', ''gary'', ''michael'']
for i, name in enumerate(friends):
    print "iteration {iteration} is {name}".format(iteration=i, name=name)
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram4 [
	^ 'parents, babies = (1, 1)
while babies < 100:
    print ''This generation has {0} babies''.format(babies)
    parents, babies = (babies, parents + babies)
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram5 [
	^ 'def greet(name):
    print ''Hello'', name
greet(''Jack'')
greet(''Jill'')
greet(''Bob'')
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram6 [
	^ 'import re
for test_string in [''555-1212'', ''ILL-EGAL'']:
    if re.match(''^\d{3}-\d{4}$'', test_string):
        print test_string, ''is a valid US local phone number''
    else:
        print test_string, ''rejected''
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram7a [
	^ 'prices = {''apple'': 0.40, ''banana'': .50}
my_purchase = {
    ''apple'': 1,
    ''banana'': 6}
grocery_bill = sum(prices[fruit] * my_purchase[fruit]
                   for fruit in my_purchase)
print ''I owe the grocer $%.2f'' % grocery_bill
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram7b [
	^ 'prices = {''apple'': 40, ''banana'': 50}
my_purchase = {
    ''apple'': 1,
    ''banana'': 6}
grocery_bill = sum(prices[fruit] * my_purchase[fruit]
                   for fruit in my_purchase)
print ''I owe the grocer $%.2f'' % grocery_bill
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram8 [
	^ '# This program adds up integers in the command line
import sys
try:
    total = sum(int(arg) for arg in sys.argv[1:])
    print ''sum ='', total
except ValueError:
    print ''Please supply integer arguments''
'
]

{ #category : #resources }
PythonParserTests >> sourceSimpleProgram9 [
	^ '# indent your Python code to put into an email
import glob
# glob supports Unix style pathname extensions
python_files = glob.glob(''*.py'')
for file_name in sorted(python_files):
    print ''    ------'' + file_name

    with open(file_name) as f:
        for line in f:
            print ''    '' + line.rstrip()

    print
'
]

{ #category : #resources }
PythonParserTests >> sourceString1 [
	^ 't_PLUS    = r''a''
'
]

{ #category : #resources }
PythonParserTests >> sourceString2 [
	^ 't_PLUS    = r''\a''
'
]

{ #category : #resources }
PythonParserTests >> sourceString3 [
	^ 't_PLUS    = r''\+a''
'
]

{ #category : #resources }
PythonParserTests >> sourceString4 [
	^ 't_PLUS    = r''\^''
'
]

{ #category : #resources }
PythonParserTests >> sourceString5 [
	^ 't_CCONST = r''(L)?\''([^\\\n]|(\\.))*?\''''
'
]

{ #category : #resources }
PythonParserTests >> sourceString6 [
	^ '[ ''\\'' , ''\n'', ''\'''', ''"'']
'
]

{ #category : #resources }
PythonParserTests >> sourceVarArgs [
	^ 'def runcall(foo, *args):
	pass
'
]

{ #category : #resources }
PythonParserTests >> sourceWhileLoop1 [
	^ '
#http://programarcadegames.com/python_examples/show_file.php?file=while_loop_examples.py

# Sample Python/Pygame Programs
# Simpson College Computer Science
# http://programarcadegames.com/
# http://simpson.edu/computer-science/
 
# A while loop can be used anywhere a for loop is used:
i = 0
while i < 10:
    print(i)
    i = i + 1
 
# This is the same as:
for i in range(10):
    print(i)
 
# It is possible to short hand the code:
# i=i+1
# With the following:
# i += 1
# This can be done with subtraction, and multiplication as well.
i = 0
while i < 10:
    print(i)
    i += 1
 
# What would this print?
i = 1
while i <= 2**32:
    print(i)
    i *= 2
 
     
 
# A very common operation is to loop until the user performs
# a request to quit
quit = "n"
while quit == "n":
    quit = input ("Do you want to quit? ")
 
     
# There may be several ways for a loop to quit. Using a boolean
# to trigger the event is a way of handling that.
done = False
while not done:
    quit = input ("Do you want to quit? ")
    if quit == "y":
        done = True;
         
    attack = input ("Does your elf attach the dragon? ")
    if attack == "y":
        print("Bad choice, you died.")
        done = True;
     
value = 0
increment = 0.5
while value < 0.999:
    value += increment
    increment *= 0.5
    print(value)
     
 
# -- Common problems with while loops --
 
# The programmer wants to count down from 10
# What is wrong and how to fix it?
i = 10
while i == 0:
    print (i)
    i -= 1
     
# What is wrong with this loop that tries 
# to count to 10? What will happen when it is run? 
i = 1
while i < 10:
    print (i)
'
]

{ #category : #resources }
PythonParserTests >> source_CppHeaderParser [
	^ '
#!/usr/bin/python
#
# Author: Jashua R. Cloutier (contact via https://bitbucket.org/senex)
# Project: http://senexcanis.com/open-source/cppheaderparser/
#
# Copyright (C) 2011, Jashua R. Cloutier
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in
#   the documentation and/or other materials provided with the
#   distribution.
#
# * Neither the name of Jashua R. Cloutier nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.  Stories,
#   blog entries etc making reference to this project may mention the
#   name Jashua R. Cloutier in terms of project originator/creator etc.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
#
# The CppHeaderParser.py script is written in Python 2.4 and released to
# the open source community for continuous improvements under the BSD
# 2.0 new license, which can be found at:
#
#   http://www.opensource.org/licenses/bsd-license.php
#
"""Parse C++ header files and generate a data structure
representing the class
"""

import ply.lex as lex
import os
import sys
import re

import inspect

def lineno():
    """Returns the current line number in our program."""
    return inspect.currentframe().f_back.f_lineno

version = __version__ = "2.4.1"

tokens = [
    ''NUMBER'',
    ''NAME'',
    ''OPEN_PAREN'',
    ''CLOSE_PAREN'',
    ''OPEN_BRACE'',
    ''CLOSE_BRACE'',
    ''OPEN_SQUARE_BRACKET'',
    ''CLOSE_SQUARE_BRACKET'',
    ''COLON'',
    ''SEMI_COLON'',
    ''COMMA'',
    ''TAB'',
    ''BACKSLASH'',
    ''PIPE'',
    ''PERCENT'',
    ''EXCLAMATION'',
    ''CARET'',
    ''COMMENT_SINGLELINE'',
    ''COMMENT_MULTILINE'',
    ''PRECOMP_MACRO'',
    ''PRECOMP_MACRO_CONT'', 
    ''ASTERISK'',
    ''AMPERSTAND'',
    ''EQUALS'',
    ''MINUS'',
    ''PLUS'',  
    ''DIVIDE'', 
    ''CHAR_LITERAL'', 
    ''STRING_LITERAL'',
    ''NEW_LINE'',
    ''SQUOTE'',
]

t_ignore = " \r.?@\f"
t_NUMBER = r''[0-9][0-9XxA-Fa-f]*''
t_NAME = r''[<>A-Za-z_~][A-Za-z0-9_]*''
t_OPEN_PAREN = r''\(''
t_CLOSE_PAREN = r''\)''
t_OPEN_BRACE = r''{''
t_CLOSE_BRACE = r''}''
t_OPEN_SQUARE_BRACKET = r''\[''
t_CLOSE_SQUARE_BRACKET = r''\]''
t_SEMI_COLON = r'';''
t_COLON = r'':''
t_COMMA = r'',''
t_TAB = r''\t''
t_BACKSLASH = r''\\''
t_PIPE = r''\|''
t_PERCENT = r''%''
t_CARET = r''\^''
t_EXCLAMATION = r''!''
t_PRECOMP_MACRO = r''\#.*''
t_PRECOMP_MACRO_CONT = r''.*\\\n''
def t_COMMENT_SINGLELINE(t):
    r''\/\/.*\n''
    global doxygenCommentCache
    if t.value.startswith("///") or t.value.startswith("//!"):
        if doxygenCommentCache:
            doxygenCommentCache += "\n"
        if t.value.endswith("\n"):
            doxygenCommentCache += t.value[:-1]
        else:
            doxygenCommentCache += t.value
    t.lexer.lineno += len([a for a in t.value if a=="\n"])
t_ASTERISK = r''\*''
t_MINUS = r''\-''
t_PLUS = r''\+''
t_DIVIDE = r''/(?!/)''
t_AMPERSTAND = r''&''
t_EQUALS = r''=''
t_CHAR_LITERAL = "''.''"
t_SQUOTE = "''"
#found at http://wordaligned.org/articles/string-literals-and-regular-expressions
#TODO: This does not work with the string "bla \" bla"
t_STRING_LITERAL = r''"([^"\\]|\\.)*"''
#Found at http://ostermiller.org/findcomment.html
def t_COMMENT_MULTILINE(t):
    r''/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/''
    global doxygenCommentCache
    if t.value.startswith("/**") or t.value.startswith("/*!"):
        #not sure why, but get double new lines
        v = t.value.replace("\n\n", "\n")
        #strip prefixing whitespace
        v = re.sub("\n[\s]+\*", "\n*", v)
        doxygenCommentCache += v
    t.lexer.lineno += len([a for a in t.value if a=="\n"])
def t_NEWLINE(t):
    r''\n+''
    t.lexer.lineno += len(t.value)

def t_error(v):
    print(( "Lex error: ", v ))

lex.lex()
# Controls error_print
print_errors = 1
# Controls warning_print
print_warnings = 1
# Controls debug_print
debug = 0
# Controls trace_print
debug_trace = 0

def error_print(arg):
    if print_errors: print(("[%4d] %s"%(inspect.currentframe().f_back.f_lineno, arg)))

def warning_print(arg):
    if print_warnings: print(("[%4d] %s"%(inspect.currentframe().f_back.f_lineno, arg)))

def debug_print(arg):
    global debug
    if debug: print(("[%4d] %s"%(inspect.currentframe().f_back.f_lineno, arg)))

def trace_print(*arg):
    global debug_trace
    if debug_trace:
        sys.stdout.write("[%s] "%(inspect.currentframe().f_back.f_lineno))
        for a in arg: sys.stdout.write("%s "%a)
        sys.stdout.write("\n")

supportedAccessSpecifier = [
    ''public'',
    ''protected'', 
    ''private''
]

#Symbols to ignore, usually special macros
ignoreSymbols = [
    ''Q_OBJECT'',
]

doxygenCommentCache = ""

#Track what was added in what order and at what depth
parseHistory = []

def is_namespace(nameStack):
    """Determines if a namespace is being specified"""
    if len(nameStack) == 0:
        return False
    if nameStack[0] == "namespace":
        return True
    return False

def is_enum_namestack(nameStack):
    """Determines if a namestack is an enum namestack"""
    if len(nameStack) == 0:
        return False
    if nameStack[0] == "enum":
        return True
    if len(nameStack) > 1 and nameStack[0] == "typedef" and nameStack[1] == "enum":
        return True
    return False

def is_fundamental(s):
    for a in s.split():
        if a not in ["size_t", "struct", "union", "unsigned", "signed", "bool", "char", "short", "int", "float", "double", "long", "void", "*"]: return False
    return True

def is_function_pointer_stack(stack):
    """Count how many non-nested paranthesis are in the stack.  Useful for determining if a stack is a function pointer"""
    paren_depth = 0
    paren_count = 0
    star_after_first_paren = False
    last_e = None
    for e in stack:
        if e == "(":
            paren_depth += 1
        elif e == ")" and paren_depth > 0:
            paren_depth -= 1
            if paren_depth == 0:
                paren_count += 1
        elif e == "*" and last_e == "(" and paren_count == 0 and paren_depth == 1:
            star_after_first_paren = True
        last_e = e
        
    if star_after_first_paren and paren_count == 2:
        return True
    else:
        return False

def is_method_namestack(stack):
    r = False
    if ''('' not in stack: r = False
    elif stack[0] == ''typedef'': r = False    # TODO deal with typedef function prototypes
    #elif ''='' in stack and stack.index(''='') < stack.index(''('') and stack[stack.index(''='')-1] != ''operator'': r = False    #disabled July6th - allow all operators
    elif ''operator'' in stack: r = True    # allow all operators
    elif ''{'' in stack and stack.index(''{'') < stack.index(''(''): r = False    # struct that looks like a method/class
    elif ''('' in stack and '')'' in stack:
        if ''{'' in stack and ''}'' in stack: r = True
        elif stack[-1] == '';'':
            if is_function_pointer_stack(stack):
                r = False
            else:
                r = True
        elif ''{'' in stack: r = True    # ideally we catch both braces... TODO
    else: r = False
    #Test for case of property set to something with parens such as "static const int CONST_A = (1 << 7) - 1;"
    if r and "(" in stack and "=" in stack and ''operator'' not in stack:
        if stack.index("=") < stack.index("("): r = False
    return r

def is_property_namestack(nameStack):
    r = False
    if ''('' not in nameStack and '')'' not in nameStack: r = True
    elif "(" in nameStack and "=" in nameStack and nameStack.index("=") < nameStack.index("("): r = True
    #See if we are a function pointer
    if not r and is_function_pointer_stack(nameStack): r = True
    return r

def detect_lineno(s):
    """Detect the line number for a given token string"""
    try:
        rtn = s.lineno()
        if rtn != -1:
            return rtn
    except: pass
    global curLine
    return curLine 

def filter_out_attribute_keyword(stack):
    """Strips __attribute__ and its parenthetical expression from the stack"""
    if "__attribute__" not in stack: return stack
    try:
        debug_print("Stripping __attribute__ from %s"% stack)
        attr_index = stack.index("__attribute__")
        attr_end = attr_index + 1 #Assuming not followed by parenthetical expression which wont happen
        #Find final paren
        if stack[attr_index + 1] == ''('':
            paren_count = 1
            for i in range(attr_index + 2, len(stack)):
                elm = stack[i]
                if elm == ''('':
                    paren_count += 1
                elif elm == '')'':
                    paren_count -= 1
                    if paren_count == 0:
                        attr_end = i + 1
                        break
        new_stack = stack[0:attr_index] + stack[attr_end:]
        debug_print("stripped stack is %s"% new_stack)
        return new_stack
    except:
        return stack
    

class TagStr(str):
    """Wrapper for a string that allows us to store the line number associated with it"""
    lineno_reg = {}
    def __new__(cls,*args,**kw):
        new_obj =  str.__new__(cls,*args)
        if "lineno" in kw:
            TagStr.lineno_reg[id(new_obj)] = kw["lineno"]
        return new_obj
    
    def __del__(self):
        try:
            del TagStr.lineno_reg[id(self)]
        except: pass
    
    def lineno(self):
        return TagStr.lineno_reg.get(id(self), -1)

class CppParseError(Exception): pass
    
class CppClass(dict):
    """Takes a name stack and turns it into a class
    
    Contains the following Keys:
    self[''name''] - Name of the class
    self[''doxygen''] - Doxygen comments associated with the class if they exist
    self[''inherits''] - List of Classes that this one inherits where the values
        are of the form {"access": Anything in supportedAccessSpecifier
                                  "class": Name of the class
    self[''methods''] - Dictionary where keys are from supportedAccessSpecifier
        and values are a lists of CppMethod''s
    self[''properties''] - Dictionary where keys are from supportedAccessSpecifier
        and values are lists of CppVariable''s 
    self[''enums''] - Dictionary where keys are from supportedAccessSpecifier and
        values are lists of CppEnum''s
    self[''structs''] - Dictionary where keys are from supportedAccessSpecifier and
        values are lists of nested Struct''s
    
    An example of how this could look is as follows:
    #self =
    {
        ''name'': ""
        ''inherits'':[]
        ''methods'':
        {
            ''public'':[],
            ''protected'':[], 
            ''private'':[]
        }, 
        ''properties'':
        {
            ''public'':[],
            ''protected'':[], 
            ''private'':[]
        },
        ''enums'':
        {
            ''public'':[],
            ''protected'':[], 
            ''private'':[]
        }
    }
    """

    def get_all_methods(self):
        r = []
        for typ in supportedAccessSpecifier: r += self[''methods''][typ]
        return r

    def get_all_method_names( self ):
        r = []
        for typ in supportedAccessSpecifier: r += self.get_method_names(typ)        # returns list
        return r

    def get_all_pure_virtual_methods( self ):
        r = {}
        for typ in supportedAccessSpecifier: r.update(self.get_pure_virtual_methods(typ))        # returns dict
        return r


    def get_method_names( self, type=''public'' ): return [ meth[''name''] for meth in self[''methods''][ type ] ]

    def get_pure_virtual_methods( self, type=''public'' ):
        r = {}
        for meth in self[''methods''][ type ]:
            if meth[''pure_virtual'']: r[ meth[''name''] ] = meth
        return r

    def __init__(self, nameStack):
        self[''nested_classes''] = []
        self[''parent''] = None
        self[''abstract''] = False
        self._public_enums = {}
        self._public_structs = {}
        self._public_typedefs = {}
        self._public_forward_declares = []
        self[''namespace''] = ""

        debug_print( "Class:   %s"%nameStack )
        if (len(nameStack) < 2):
            nameStack.insert(1, "")#anonymous struct
        global doxygenCommentCache
        if len(doxygenCommentCache):
            self["doxygen"] = doxygenCommentCache
            doxygenCommentCache = ""
        
        if "::" in "".join(nameStack):
            #Re-Join class paths (ex  [''class'', ''Bar'', '':'', '':'', ''Foo''] -> [''class'', ''Bar::Foo''] 
            try:
                new_nameStack = []
                for name in nameStack:
                    if len(new_nameStack) == 0: 
                        new_nameStack.append(name)
                    elif name == ":" and new_nameStack[-1].endswith(":"):
                        new_nameStack[-1] += name
                    elif new_nameStack[-1].endswith("::"):
                        new_nameStack[-2] += new_nameStack[-1] + name
                        del new_nameStack[-1]
                    else:
                        new_nameStack.append(name)
                trace_print("Convert from namestack\n %s\nto\n%s"%(nameStack, new_nameStack))
                nameStack = new_nameStack
            except: pass
        
        self["name"] = nameStack[1]
        self["line_number"] = detect_lineno(nameStack[0])
        
        #Handle template classes
        if len(nameStack) > 3 and nameStack[2].startswith("<"):
            open_template_count = 0
            param_separator = 0
            found_first = False
            i = 0
            for elm in nameStack:
                if ''<'' in elm :
                    open_template_count += 1
                    found_first = True
                elif ''>'' in elm:
                    open_template_count -= 1
                if found_first and open_template_count == 0:
                    self["name"] = "".join(nameStack[1:i + 1])
                    break;
                i += 1
        elif ":" in nameStack:
            self[''name''] = nameStack[ nameStack.index('':'') - 1 ]

        inheritList = []

        if nameStack.count('':'') == 1:
            nameStack = nameStack[nameStack.index(":") + 1:]
            while len(nameStack):
                tmpStack = []
                tmpInheritClass = {"access":"private", "virtual": False}
                if "," in nameStack:
                    tmpStack = nameStack[:nameStack.index(",")]
                    nameStack = nameStack[nameStack.index(",") + 1:]
                else:
                    tmpStack = nameStack
                    nameStack = []
                
                # Convert template classes to one name in the last index
                for i in range(0, len(tmpStack)):
                    if ''<'' in tmpStack[i]:
                        tmpStack2 = tmpStack[:i-1]
                        tmpStack2.append("".join(tmpStack[i-1:]))
                        tmpStack = tmpStack2
                        break
                if len(tmpStack) == 0:
                    break;
                elif len(tmpStack) == 1:
                    tmpInheritClass["class"] = tmpStack[0]
                elif len(tmpStack) == 2:
                    tmpInheritClass["access"] = tmpStack[0]
                    tmpInheritClass["class"] = tmpStack[1]
                elif len(tmpStack) == 3 and "virtual" in tmpStack:
                    tmpInheritClass["access"] = tmpStack[1] if tmpStack[1] != "virtual" else tmpStack[0]
                    tmpInheritClass["class"] = tmpStack[2]
                    tmpInheritClass["virtual"] = True
                else:
                    warning_print( "Warning: can not parse inheriting class %s"%(" ".join(tmpStack)))
                    if ''>'' in tmpStack: pass    # allow skip templates for now
                    else: raise NotImplemented

                if ''class'' in tmpInheritClass: inheritList.append(tmpInheritClass)

        elif nameStack.count('':'') == 2: self[''parent''] = self[''name'']; self[''name''] = nameStack[-1]

        elif nameStack.count('':'') > 2 and nameStack[0] in ("class", "struct"):
            tmpStack = nameStack[nameStack.index(":") + 1:]
            
            superTmpStack = [[]]
            for tok in tmpStack:
                if tok == '','':
                    superTmpStack.append([])
                else:
                    superTmpStack[-1].append(tok)
            
            for tmpStack in superTmpStack:
                tmpInheritClass = {"access":"private"}
                
                if len(tmpStack) and tmpStack[0] in supportedAccessSpecifier:
                    tmpInheritClass["access"] = tmpStack[0]
                    tmpStack = tmpStack[1:]
                
                inheritNSStack = []
                while len(tmpStack) > 3:
                    if tmpStack[0] == '':'': break;
                    if tmpStack[1] != '':'': break;
                    if tmpStack[2] != '':'': break;
                    inheritNSStack.append(tmpStack[0])
                    tmpStack = tmpStack[3:]
                if len(tmpStack) == 1 and tmpStack[0] != '':'':
                     inheritNSStack.append(tmpStack[0])
                tmpInheritClass["class"] = "::".join(inheritNSStack)
                inheritList.append(tmpInheritClass)

        self[''inherits''] = inheritList

        methodAccessSpecificList = {}
        propertyAccessSpecificList = {}
        enumAccessSpecificList = {}
        structAccessSpecificList = {}
        typedefAccessSpecificList = {}
        forwardAccessSpecificList = {}
        
        for accessSpecifier in supportedAccessSpecifier:
            methodAccessSpecificList[accessSpecifier] = []
            propertyAccessSpecificList[accessSpecifier] = []
            enumAccessSpecificList[accessSpecifier] = []
            structAccessSpecificList[accessSpecifier] = []
            typedefAccessSpecificList[accessSpecifier] = []
            forwardAccessSpecificList[accessSpecifier] = []

        self[''methods''] = methodAccessSpecificList
        self[''properties''] = propertyAccessSpecificList
        self[''enums''] = enumAccessSpecificList
        self[''structs''] = structAccessSpecificList
        self[''typedefs''] = typedefAccessSpecificList
        self[''forward_declares''] = forwardAccessSpecificList

 
    def show(self):
        """Convert class to a string"""
        namespace_prefix = ""
        if self["namespace"]: namespace_prefix = self["namespace"] + "::"
        rtn = "%s %s"%(self["declaration_method"], namespace_prefix + self["name"])
        if self[''abstract'']: rtn += ''    (abstract)\n''
        else: rtn += ''\n''

        if ''doxygen'' in list(self.keys()): rtn += self["doxygen"] + ''\n''
        if ''parent'' in list(self.keys()) and self[''parent'']: rtn += ''parent class: '' + self[''parent''] + ''\n''

        if "inherits" in list(self.keys()):
            rtn += "  Inherits: "
            for inheritClass in self["inherits"]:
                if inheritClass["virtual"]: rtn += "virtual "
                rtn += "%s %s, "%(inheritClass["access"], inheritClass["class"])
            rtn += "\n"
        rtn += "  {\n"
        for accessSpecifier in supportedAccessSpecifier:
            rtn += "    %s\n"%(accessSpecifier)
            #Enums
            if (len(self["enums"][accessSpecifier])):
                rtn += "        <Enums>\n"
            for enum in self["enums"][accessSpecifier]:
                rtn += "            %s\n"%(repr(enum))
            #Properties
            if (len(self["properties"][accessSpecifier])):
                rtn += "        <Properties>\n"
            for property in self["properties"][accessSpecifier]:
                rtn += "            %s\n"%(repr(property))
            #Methods
            if (len(self["methods"][accessSpecifier])):
                rtn += "        <Methods>\n"
            for method in self["methods"][accessSpecifier]:
                rtn += "\t\t" + method.show() + ''\n''
        rtn += "  }\n"
        print(rtn)
    
    def __repr__(self):
        """Convert class to a string"""
        namespace_prefix = ""
        if self["namespace"]: namespace_prefix = self["namespace"] + "::"
        rtn = "%s %s"%(self["declaration_method"], namespace_prefix + self["name"])
        if self[''abstract'']: rtn += ''    (abstract)\n''
        else: rtn += ''\n''

        if ''doxygen'' in list(self.keys()): rtn += self["doxygen"] + ''\n''
        if ''parent'' in list(self.keys()) and self[''parent'']: rtn += ''parent class: '' + self[''parent''] + ''\n''

        if "inherits" in list(self.keys()) and len(self["inherits"]):
            rtn += "Inherits: "
            for inheritClass in self["inherits"]:
                if inheritClass.get("virtual", False): rtn += "virtual "
                rtn += "%s %s, "%(inheritClass["access"], inheritClass["class"])
            rtn += "\n"
        rtn += "{\n"
        for accessSpecifier in supportedAccessSpecifier:
            rtn += "%s\n"%(accessSpecifier)
            #Enums
            if (len(self["enums"][accessSpecifier])):
                rtn += "    // Enums\n"
            for enum in self["enums"][accessSpecifier]:
                rtn += "    %s\n"%(repr(enum))
            #Properties
            if (len(self["properties"][accessSpecifier])):
                rtn += "    // Properties\n"
            for property in self["properties"][accessSpecifier]:
                rtn += "    %s\n"%(repr(property))
            #Methods
            if (len(self["methods"][accessSpecifier])):
                rtn += "    // Methods\n"
            for method in self["methods"][accessSpecifier]:
                rtn += "   %s\n"%(repr(method))
        rtn += "}\n"
        return rtn


class CppUnion( CppClass ):
    """Takes a name stack and turns it into a union
    
    Contains the following Keys:
    self[''name''] - Name of the union
    self[''doxygen''] - Doxygen comments associated with the union if they exist
    self[''members''] - List of members the union has 
    
    An example of how this could look is as follows:
    #self =
    {
        ''name'': ""
        ''members'': []
    }
    """
    
    def __init__(self, nameStack):
        CppClass.__init__(self, nameStack)
        self["name"] = "union " + self["name"]
        self["members"] = self["properties"]["public"]
    
    def transform_to_union_keys(self):
        print("union keys: %s"%list(self.keys()))
        for key in [''inherits'', ''parent'', ''abstract'', ''namespace'', ''typedefs'', ''methods'']:
            del self[key] 
        
    def show(self):
        """Convert class to a string"""
        print(self)
    
    
    def __repr__(self):
        """Convert class to a string"""
        namespace_prefix = ""
        if self["namespace"]: namespace_prefix = self["namespace"] + "::"
        rtn = "%s %s"%(self["declaration_method"], namespace_prefix + self["name"])
        if self[''abstract'']: rtn += ''    (abstract)\n''
        else: rtn += ''\n''

        if ''doxygen'' in list(self.keys()): rtn += self["doxygen"] + ''\n''
        if ''parent'' in list(self.keys()) and self[''parent'']: rtn += ''parent class: '' + self[''parent''] + ''\n''

        rtn += "{\n"
        for member in self["members"]:
            rtn += "    %s\n"%(repr(member))
        rtn += "}\n"
        return rtn

       

class _CppMethod( dict ):
    def _params_helper1( self, stack ):
        # deal with "throw" keyword
        if ''throw'' in stack: stack = stack[ : stack.index(''throw'') ]

        ## remove GCC keyword __attribute__(...) and preserve returns ##
        cleaned = []
        hit = False; hitOpen = 0; hitClose = 0
        for a in stack:
            if a == ''__attribute__'': hit = True
            if hit:
                if a == ''('': hitOpen += 1
                elif a == '')'': hitClose += 1
                if a=='')'' and hitOpen == hitClose:
                    hit = False
            else:
                cleaned.append( a )
        stack = cleaned

        # also deal with attribute((const)) function prefix #
        # TODO this needs to be better #
        if len(stack) > 5:
            a = ''''.join(stack)
            if a.startswith(''((__const__))''): stack = stack[ 5 : ]
            elif a.startswith(''__attribute__((__const__))''): stack = stack[ 6 : ]

        stack = stack[stack.index(''('') + 1: ]
        if not stack: return []
        if len(stack)>=3 and stack[0]=='')'' and stack[1]=='':'':    # is this always a constructor?
            self[''constructor''] = True
            return []

        stack.reverse(); _end_ = stack.index('')''); stack.reverse()
        stack = stack[ : len(stack)-(_end_+1) ]
        if ''('' not in stack: return stack    # safe to return, no defaults that init a class

        # transforms [''someclass'', ''('', ''0'', ''0'', ''0'', '')''] into "someclass(0,0,0)''"
        r = []; hit=False
        for a in stack:
            if a == ''('': hit=True
            elif a == '')'': hit=False
            if hit or a == '')'': r[-1] = r[-1] + a
            else: r.append( a )
        return r

    def _params_helper2( self, params ):
        for p in params:
            p[''method''] = self        # save reference in variable to parent method
            if ''::'' in p[''type'']:
                ns = p[''type''].split(''::'')[0]
                if ns not in Resolver.NAMESPACES and ns in Resolver.CLASSES:
                    p[''type''] = self[''namespace''] + p[''type'']
            else: p[''namespace''] = self[ ''namespace'' ]

class CppMethod( _CppMethod ):
    """Takes a name stack and turns it into a method
    
    Contains the following Keys:
    self[''rtnType''] - Return type of the method (ex. "int")
    self[''name''] - Name of the method (ex. "getSize")
    self[''doxygen''] - Doxygen comments associated with the method if they exist
    self[''parameters''] - List of CppVariables
    """
    def show(self):
        r = [''method name: %s (%s)'' %(self[''name''],self[''debug'']) ]
        if self[''returns'']: r.append( ''returns: %s''%self[''returns''] )
        if self[''parameters'']: r.append( ''number arguments: %s'' %len(self[''parameters'']))
        if self[''pure_virtual'']: r.append( ''pure virtual: %s''%self[''pure_virtual''] )
        if self[''constructor'']: r.append( ''constructor'' )
        if self[''destructor'']: r.append( ''destructor'' )
        return ''\n\t\t  ''.join( r )

    def __init__(self, nameStack, curClass, methinfo):
        debug_print( "Method:   %s"%nameStack )
        global doxygenCommentCache
        if len(doxygenCommentCache):
            self["doxygen"] = doxygenCommentCache
            doxygenCommentCache = ""
        if "operator" in nameStack:
            self["rtnType"] = " ".join(nameStack[:nameStack.index(''operator'')])
            self["name"] = "".join(nameStack[nameStack.index(''operator''):nameStack.index(''('')])
        else:
            self["rtnType"] = " ".join(nameStack[:nameStack.index(''('') - 1])
            self["name"] = " ".join(nameStack[nameStack.index(''('') - 1:nameStack.index(''('')])
        if self["rtnType"].startswith("virtual"):
           self["rtnType"] = self["rtnType"][len("virtual"):].strip()
        if len(self["rtnType"]) == 0 or self["name"] == curClass:
            self["rtnType"] = "void"
        
        self["rtnType"] = self["rtnType"].replace('' : : '', ''::'' )
        self["rtnType"] = self["rtnType"].replace(" <","<")
        self["rtnType"] = self["rtnType"].replace(" >",">").replace(">>", "> >").replace(">>", "> >")
        self["rtnType"] = self["rtnType"].replace(" ,",",")
        
        self["const"] = False
        for i in reversed(nameStack):
            if i == "const":
                self["const"] = True
                break
            elif i == ")":
                break        

        self.update( methinfo )
        self["line_number"] = detect_lineno(nameStack[0])

        #Filter out initializer lists used in constructors
        try:
            paren_depth_counter = 0
            for i in range(0, len(nameStack)):
                elm = nameStack[i]
                if elm == "(":
                    paren_depth_counter += 1
                if elm == ")":
                    paren_depth_counter -=1
                    if paren_depth_counter == 0 and nameStack[i+1] == '':'':
                        debug_print("Stripping out initializer list")
                        nameStack = nameStack[:i+1]
                        break
        except: pass
        
        paramsStack = self._params_helper1( nameStack )
        

        params = []
        #See if there is a doxygen comment for the variable
        doxyVarDesc = {}
        
        if "doxygen" in self:
            doxyLines = self["doxygen"].split("\n")
            lastParamDesc = ""
            for doxyLine in doxyLines:
                if " @param " in doxyLine or " \param " in doxyLine:
                    try:
                        #Strip out the param
                        doxyLine = doxyLine[doxyLine.find("param ") + 6:]
                        (var, desc) = doxyLine.split(" ", 1)
                        doxyVarDesc[var] = desc.strip()
                        lastParamDesc = var
                    except: pass
                elif " @return " in doxyLine or " \return " in doxyLine:
                    lastParamDesc = ""
                    # not handled for now
                elif lastParamDesc:
                    try:
                        doxyLine = doxyLine.strip()
                        if " " not in doxyLine:
                            lastParamDesc = ""
                            continue
                        doxyLine = doxyLine[doxyLine.find(" ") + 1:]
                        doxyVarDesc[lastParamDesc] += " " + doxyLine
                    except: pass
        
        #Create the variable now
        while (len(paramsStack)):
            # Find commas that are not nexted in <>''s like template types
            open_template_count = 0
            param_separator = 0
            i = 0
            for elm in paramsStack:
                if ''<'' in elm :
                    open_template_count += 1
                elif ''>'' in elm:
                    open_template_count -= 1
                elif elm == '','' and open_template_count == 0:
                    param_separator = i
                    break
                i += 1
            
            if param_separator:
                param = CppVariable(paramsStack[0:param_separator],  doxyVarDesc=doxyVarDesc)
                if len(list(param.keys())): params.append(param)
                paramsStack = paramsStack[param_separator + 1:]
            else:
                param = CppVariable(paramsStack,  doxyVarDesc=doxyVarDesc)
                if len(list(param.keys())): params.append(param)
                break


        self["parameters"] = params
        self._params_helper2( params )    # mods params inplace

    def __repr__(self):
        filter_keys = ("parent", "defined", "operator", "returns_reference")
        cpy = dict((k,v) for (k,v) in list(self.items()) if k not in filter_keys)
        return "%s"%cpy


class _CppVariable(dict):
    def _name_stack_helper( self, stack ):
        stack = list(stack)
        if ''='' not in stack:        # TODO refactor me
            # check for array[n] and deal with funny array syntax: "int myvar:99"
            array = []
            while stack and stack[-1].isdigit(): array.append( stack.pop() )
            if array: array.reverse(); self[''array''] = int(''''.join(array))
            if stack and stack[-1].endswith('':''): stack[-1] = stack[-1][:-1]

        while stack and not stack[-1]: stack.pop()            # can be empty
        return stack

    def init(self):
        #assert self[''name'']    # allow unnamed variables, methods like this: "void func(void);"
        a = []
        self[''aliases''] = []; self[''parent''] = None; self[''typedef''] = None
        for key in ''constant reference pointer static typedefs class fundamental unresolved''.split():
            self[ key ] = 0
        for b in self[''type''].split():
            if b == ''__const__'': b = ''const''
            a.append( b )
        self[''type''] = '' ''.join( a )


class CppVariable( _CppVariable ):
    """Takes a name stack and turns it into a method
    
    Contains the following Keys:
    self[''type''] - Type for the variable (ex. "const string &")
    self[''name''] - Name of the variable (ex. "numItems")
    self[''namespace''] - Namespace containing the enum
    self[''desc''] - Description of the variable if part of a method (optional)
    self[''doxygen''] - Doxygen comments associated with the method if they exist
    self[''defaltValue''] - Default value of the variable, this key will only
        exist if there is a default value
    """
    Vars = []
    def __init__(self, nameStack,  **kwargs):
        _stack_ = nameStack
        if "[" in nameStack: #strip off array informatin
            arrayStack = nameStack[nameStack.index("["):]
            if len(arrayStack) == 3:
                self["array_size"] = arrayStack[1] 
            nameStack = nameStack[:nameStack.index("[")]
            self["array"] = 1
        else:
            self["array"] = 0
        nameStack = self._name_stack_helper( nameStack )
        global doxygenCommentCache
        if len(doxygenCommentCache):
            self["doxygen"] = doxygenCommentCache
            doxygenCommentCache = ""

        debug_print( "Variable: %s"%nameStack )

        self["line_number"] = detect_lineno(nameStack[0])
        self["function_pointer"] = 0

        if (len(nameStack) < 2):    # +++
            if len(nameStack) == 1: self[''type''] = nameStack[0]; self[''name''] = ''''
            else: error_print(_stack_); assert 0

        elif is_function_pointer_stack(nameStack): #function pointer
            self["type"] = " ".join(nameStack[:nameStack.index("(") + 2] + nameStack[nameStack.index(")")  :])
            self["name"] = " ".join(nameStack[nameStack.index("(") + 2 : nameStack.index(")")])
            self["function_pointer"] = 1

        elif ("=" in nameStack):
            self["type"] = " ".join(nameStack[:nameStack.index("=") - 1])
            self["name"] = nameStack[nameStack.index("=") - 1]
            self["defaltValue"] = " ".join(nameStack[nameStack.index("=") + 1:])    # deprecate camelCase in dicts
            self[''default''] = " ".join(nameStack[nameStack.index("=") + 1:])

        elif is_fundamental(nameStack[-1]) or nameStack[-1] in [''>'', ''<'' , '':'', ''.'']:
            #Un named parameter
            self["type"] = " ".join(nameStack)
            self["name"] = ""

        else:    # common case
            self["type"] = " ".join(nameStack[:-1])
            self["name"] = nameStack[-1]

        self["type"] = self["type"].replace(" :",":")
        self["type"] = self["type"].replace(": ",":")
        self["type"] = self["type"].replace(" <","<")
        self["type"] = self["type"].replace(" >",">").replace(">>", "> >").replace(">>", "> >")
        self["type"] = self["type"].replace(" ,",",")
        #Optional doxygen description
        try:
            self["desc"] = kwargs["doxyVarDesc"][self["name"]]
        except: pass

        self.init()
        CppVariable.Vars.append( self )        # save and resolve later
    
    def __repr__(self):
        keys_white_list = [''constant'',''name'',''reference'',''type'',''static'',''pointer'',''desc'', ''line_number'']
        cpy = dict((k,v) for (k,v) in list(self.items()) if k in keys_white_list)
        if "array_size" in self: cpy["array_size"] = self["array_size"]
        return "%s"%cpy

class _CppEnum(dict):
    def resolve_enum_values( self, values ):
        """Evaluates the values list of dictionaries passed in and figures out what the enum value
        for each enum is editing in place:
        
        Example:
        From: [{''name'': ''ORANGE''},
               {''name'': ''RED''},
               {''name'': ''GREEN'', ''value'': ''8''}]
        To:   [{''name'': ''ORANGE'', ''value'': 0},
               {''name'': ''RED'', ''value'': 1},
               {''name'': ''GREEN'', ''value'': 8}]
        """
        t = int; i = 0
        names = [ v[''name''] for v in values ]
        for v in values:
            if ''value'' in v:
                a = v[''value''].strip()
                # Remove single quotes from single quoted chars (unless part of some expression
                if len(a) == 3 and a[0] == "''" and a[2] == "''":
                    a = v[''value''] = a[1]
                if a.lower().startswith("0x"):
                    try:
                        i = a = int(a , 16)
                    except:pass
                elif a.isdigit():
                    i = a = int( a )
                elif a in names:
                    for other in values:
                        if other[''name''] == a:
                            v[''value''] = other[''value'']
                            break

                elif ''"'' in a or "''" in a: t = str # only if there are quotes it this a string enum
                else:
                    try:
                        a = i = ord(a)
                    except: pass
                #Allow access of what is in the file pre-convert if converted
                if v[''value''] != str(a):
                    v[''raw_value''] = v[''value'']
                v[''value''] = a
            else: v[''value''] = i
            try:
                v[''value''] = v[''value''].replace(" < < ", " << ").replace(" >> ", " >> ")
            except: pass
            i += 1
        return t

class CppEnum(_CppEnum):
    """Takes a name stack and turns it into an Enum
    
    Contains the following Keys:
    self[''name''] - Name of the enum (ex. "ItemState")
    self[''namespace''] - Namespace containing the enum
    self[''values''] - List of values where the values are a dictionary of the
        form {"name": name of the key (ex. "PARSING_HEADER"),
                  "value": Specified value of the enum, this key will only exist
                    if a value for a given enum value was defined
                }
    """
    def __init__(self, nameStack):
        global doxygenCommentCache
        if len(doxygenCommentCache):
            self["doxygen"] = doxygenCommentCache
            doxygenCommentCache = ""
        if len(nameStack) == 3 and nameStack[0] == "enum":
            debug_print("Created enum as just name/value")
            self["name"] = nameStack[1]
            self["instances"]=[nameStack[2]]
        if len(nameStack) < 4 or "{" not in nameStack or "}" not in nameStack:
            #Not enough stuff for an enum
            debug_print("Bad enum")
            return
        valueList = []
        self["line_number"] = detect_lineno(nameStack[0])
        #Figure out what values it has
        valueStack = nameStack[nameStack.index(''{'') + 1: nameStack.index(''}'')]
        while len(valueStack):
            tmpStack = []
            if "," in valueStack:
                tmpStack = valueStack[:valueStack.index(",")]
                valueStack = valueStack[valueStack.index(",") + 1:]
            else:
                tmpStack = valueStack
                valueStack = []
            d = {}
            if len(tmpStack) == 1: d["name"] = tmpStack[0]
            elif len(tmpStack) >= 3 and tmpStack[1] == "=":
                d["name"] = tmpStack[0]; d["value"] = " ".join(tmpStack[2:])
            elif len(tmpStack) == 2 and tmpStack[1] == "=":
                debug_print( "WARN-enum: parser missed value for %s"%tmpStack[0] )
                d["name"] = tmpStack[0]

            if d: valueList.append( d )

        if len(valueList):
            self[''type''] = self.resolve_enum_values( valueList )    # returns int for standard enum
            self["values"] = valueList
        else:
            warning_print( ''WARN-enum: empty enum %s''%nameStack )
            return
        #Figure out if it has a name
        preBraceStack = nameStack[:nameStack.index("{")]
        postBraceStack = nameStack[nameStack.index("}") + 1:]
        if (len(preBraceStack) == 2 and "typedef" not in nameStack):
            self["name"] = preBraceStack[1]           
        elif len(postBraceStack) and "typedef" in nameStack:
                self["name"] = " ".join(postBraceStack)
        else: warning_print( ''WARN-enum: nameless enum %s''%nameStack )
        #See if there are instances of this
        if "typedef" not in nameStack and len(postBraceStack):
            self["instances"] = []
            for var in postBraceStack:
                if "," in var:
                    continue
                self["instances"].append(var)
        self["namespace"] = ""


class CppStruct(dict):
    Structs = []
    def __init__(self, nameStack):
        if len(nameStack) >= 2: self[''type''] = nameStack[1]
        else: self[''type''] = None
        self[''fields''] = []
        self.Structs.append( self )
        global curLine
        self["line_number"] = curLine

C99_NONSTANDARD = {
    ''int8'' : ''signed char'',
    ''int16'' : ''short int'',
    ''int32'' : ''int'',
    ''int64'' : ''int64_t'',        # this can be: long int (64bit), or long long int (32bit)
    ''uint'' : ''unsigned int'',
    ''uint8'' : ''unsigned char'',
    ''uint16'' : ''unsigned short int'',
    ''uint32'' : ''unsigned int'',
    ''uint64'' : ''uint64_t'',    # depends on host bits
}


def standardize_fundamental( s ):
    if s in C99_NONSTANDARD: return C99_NONSTANDARD[ s ]
    else: return s


class Resolver(object):
    C_FUNDAMENTAL = ''size_t unsigned signed bool char wchar short int float double long void''.split()
    C_FUNDAMENTAL += ''struct union enum''.split()


    SubTypedefs = {}        # TODO deprecate?
    NAMESPACES = []
    CLASSES = {}
    STRUCTS = {}

    def initextra(self):
        self.typedefs = {}
        self.typedefs_order = []
        self.classes_order = []
        self.structs = Resolver.STRUCTS
        self.structs_order = []
        self.namespaces = Resolver.NAMESPACES        # save all namespaces
        self.curStruct = None
        self.stack = []    # full name stack, good idea to keep both stacks? (simple stack and full stack)
        self._classes_brace_level = {}    # class name : level
        self._structs_brace_level = {}        # struct type : level
        self._method_body = None
        self._forward_decls = []
        self._template_typenames = []    # template<typename XXX>

    def current_namespace(self): return self.cur_namespace(True)

    def cur_namespace(self, add_double_colon=False):
        rtn = ""
        i = 0
        while i < len(self.nameSpaces):
            rtn += self.nameSpaces[i]
            if add_double_colon or i < len(self.nameSpaces) - 1: rtn += "::"
            i+=1
        return rtn


    def guess_ctypes_type( self, string ):
        pointers = string.count(''*'')
        string = string.replace(''*'','''')

        a = string.split()
        if ''unsigned'' in a: u = ''u''
        else: u = ''''
        if ''long'' in a and ''double'' in a: b = ''longdouble''    # there is no ctypes.c_ulongdouble (this is a 64bit float?)
        elif a.count(''long'') == 2 and ''int'' in a: b = ''%sint64'' %u
        elif a.count(''long'') == 2: b = ''%slonglong'' %u
        elif ''long'' in a: b = ''%slong'' %u
        elif ''double'' in a: b = ''double''    # no udouble in ctypes
        elif ''short'' in a: b = ''%sshort'' %u
        elif ''char'' in a: b = ''%schar'' %u
        elif ''wchar'' in a: b = ''wchar''
        elif ''bool'' in a: b = ''bool''
        elif ''float'' in a: b = ''float''

        elif ''int'' in a: b = ''%sint'' %u
        elif ''int8'' in a: b = ''int8''
        elif ''int16'' in a: b = ''int16''
        elif ''int32'' in a: b = ''int32''
        elif ''int64'' in a: b = ''int64''

        elif ''uint'' in a: b = ''uint''
        elif ''uint8'' in a: b = ''uint8''
        elif ''uint16'' in a: b = ''uint16''
        elif ''uint32'' in a: b = ''uint32''
        elif ''uint64'' in a: b = ''uint64''

        elif ''size_t'' in a: b = ''size_t''
        elif ''void'' in a: b = ''void_p''

        elif string in ''struct union''.split(): b = ''void_p''    # what should be done here? don''t trust struct, it could be a class, no need to expose via ctypes
        else: b = ''void_p''

        if not pointers: return ''ctypes.c_%s'' %b
        else:
            x = ''''
            for i in range(pointers): x += ''ctypes.POINTER(''
            x += ''ctypes.c_%s'' %b
            x += '')'' * pointers
            return x

    def resolve_type( self, string, result ):    # recursive
        ''''''
        keeps track of useful things like: how many pointers, number of typedefs, is fundamental or a class, etc...
        ''''''
        ## be careful with templates, what is inside <something*> can be a pointer but the overall type is not a pointer
        ## these come before a template
        s = string.split(''<'')[0]
        result[ ''constant'' ] += s.split().count(''const'')
        result[ ''static'' ] += s.split().count(''static'')
        result[ ''mutable'' ] = ''mutable'' in s.split()

        ## these come after a template
        s = string.split(''>'')[-1]
        result[ ''pointer'' ] += s.count(''*'')
        result[ ''reference'' ] += s.count(''&'')


        x = string; alias = False
        for a in ''* & const static mutable''.split(): x = x.replace(a,'''')
        for y in x.split():
            if y not in self.C_FUNDAMENTAL: alias = y; break

        #if alias == ''class'':
        #    result[''class''] = result[''name'']    # forward decl of class
        #    result[''forward_decl''] = True
        if alias == ''__extension__'': result[''fundamental_extension''] = True
        elif alias:
            result[''aliases''].append( alias )
            if alias in C99_NONSTANDARD:
                result[''type''] = C99_NONSTANDARD[ alias ]
                result[''typedef''] = alias
                result[''typedefs''] += 1
            elif alias in self.typedefs:
                result[''typedefs''] += 1
                result[''typedef''] = alias
                self.resolve_type( self.typedefs[alias], result )
            elif alias in self.classes:
                klass = self.classes[alias]; result[''fundamental''] = False
                result[''class''] = klass
                result[''unresolved''] = False
            else: result[''unresolved''] = True
        else:
            result[''fundamental''] = True
            result[''unresolved''] = False


    def finalize_vars(self):
        for s in CppStruct.Structs:    # vars within structs can be ignored if they do not resolve
            for var in s[''fields'']: var[''parent''] = s[''type'']
        #for c in self.classes.values():
        #    for var in c.get_all_properties(): var[''parent''] = c[''name'']

        ## RESOLVE ##
        for var in CppVariable.Vars:
            self.resolve_type( var[''type''], var )
            #if ''method'' in var and var[''method''][''name''] ==  ''_notifyCurrentCamera'': print(var); assert 0

        # then find concrete type and best guess ctypes type #
        for var in CppVariable.Vars:    
            if not var[''aliases'']:    #var[''fundamental'']:
                var[''ctypes_type''] = self.guess_ctypes_type( var[''type''] )
            else:
                var[''unresolved''] = False    # below may test to True
                if var[''class'']:
                    var[''ctypes_type''] = ''ctypes.c_void_p''
                else:
                    assert var[''aliases'']
                    tag = var[''aliases''][0]

                    klass = None
                    nestedEnum = None
                    nestedStruct = None
                    nestedTypedef = None
                    if ''method'' in var and ''parent'' in list(var[''method''].keys()):
                        klass = var[''method''][''parent'']
                        if tag in var[''method''][''parent'']._public_enums:
                            nestedEnum = var[''method''][''parent'']._public_enums[ tag ]
                        elif tag in var[''method''][''parent'']._public_structs:
                            nestedStruct = var[''method''][''parent'']._public_structs[ tag ]
                        elif tag in var[''method''][''parent'']._public_typedefs:
                            nestedTypedef = var[''method''][''parent'']._public_typedefs[ tag ]


                    if ''<'' in tag:    # should also contain ''>''
                        var[''template''] = tag        # do not resolve templates
                        var[''ctypes_type''] = ''ctypes.c_void_p''
                        var[''unresolved''] = True

                    elif nestedEnum:
                        enum = nestedEnum
                        if enum[''type''] is int:
                            var[''ctypes_type''] = ''ctypes.c_int''
                            var[''raw_type''] = ''int''

                        elif enum[''type''] is str:
                            var[''ctypes_type''] = ''ctypes.c_char_p''
                            var[''raw_type''] = ''char*''

                        var[''enum''] = var[''method''][''path''] + ''::'' + enum[''name'']
                        var[''fundamental''] = True

                    elif nestedStruct:
                        var[''ctypes_type''] = ''ctypes.c_void_p''
                        var[''raw_type''] = var[''method''][''path''] + ''::'' + nestedStruct[''type'']
                        var[''fundamental''] = False

                    elif nestedTypedef:
                        var[''fundamental''] = is_fundamental( nestedTypedef )
                        if not var[''fundamental'']:
                            var[''raw_type''] = var[''method''][''path''] + ''::'' + tag

                    else:
                        _tag = tag
                        if ''::'' in tag and tag.split(''::'')[0] in self.namespaces: tag = tag.split(''::'')[-1]
                        con = self.concrete_typedef( _tag )
                        if con:
                            var[''concrete_type''] = con
                            var[''ctypes_type''] = self.guess_ctypes_type( var[''concrete_type''] )

                        elif tag in self.structs:
                            trace_print( ''STRUCT'', var )
                            var[''struct''] = tag
                            var[''ctypes_type''] = ''ctypes.c_void_p''
                            var[''raw_type''] = self.structs[tag][''namespace''] + ''::'' + tag

                        elif tag in self._forward_decls:
                            var[''forward_declared''] = tag
                            var[''ctypes_type''] = ''ctypes.c_void_p''

                        elif tag in self.global_enums:
                            enum = self.global_enums[ tag ]
                            if enum[''type''] is int:
                                var[''ctypes_type''] = ''ctypes.c_int''
                                var[''raw_type''] = ''int''
                            elif enum[''type''] is str:
                                var[''ctypes_type''] = ''ctypes.c_char_p''
                                var[''raw_type''] = ''char*''
                            var[''enum''] = enum[''namespace''] + enum[''name'']
                            var[''fundamental''] = True


                        elif var[''parent'']:
                            warning_print( ''WARN unresolved %s''%_tag)
                            var[''ctypes_type''] = ''ctypes.c_void_p''
                            var[''unresolved''] = True


                        elif tag.count(''::'')==1:
                            trace_print( ''trying to find nested something in'', tag )
                            a = tag.split(''::'')[0]
                            b = tag.split(''::'')[-1]
                            if a in self.classes:    # a::b is most likely something nested in a class
                                klass = self.classes[ a ]
                                if b in klass._public_enums:
                                    trace_print( ''...found nested enum'', b )
                                    enum = klass._public_enums[ b ]
                                    if enum[''type''] is int:
                                        var[''ctypes_type''] = ''ctypes.c_int''
                                        var[''raw_type''] = ''int''
                                    elif enum[''type''] is str:
                                        var[''ctypes_type''] = ''ctypes.c_char_p''
                                        var[''raw_type''] = ''char*''
                                    try:
                                        if ''method'' in var: var[''enum''] = var[''method''][''path''] + ''::'' + enum[''name'']
                                        else:    # class property
                                            var[''unresolved''] = True
                                    except:
                                        var[''unresolved''] = True
                                        
                                    var[''fundamental''] = True

                                else: var[''unresolved''] = True    # TODO klass._public_xxx

                            elif a in self.namespaces:    # a::b can also be a nested namespace
                                if b in self.global_enums:
                                    enum = self.global_enums[ b ]
                                    trace_print(enum)
                                trace_print(var)
                                assert 0

                            elif b in self.global_enums:        # falling back, this is a big ugly
                                enum = self.global_enums[ b ]
                                assert a in enum[''namespace''].split(''::'')
                                if enum[''type''] is int:
                                    var[''ctypes_type''] = ''ctypes.c_int''
                                    var[''raw_type''] = ''int''
                                elif enum[''type''] is str:
                                    var[''ctypes_type''] = ''ctypes.c_char_p''
                                    var[''raw_type''] = ''char*''
                                var[''fundamental''] = True

                            else:    # boost::gets::crazy
                                trace_print(''NAMESPACES'', self.namespaces)
                                trace_print( a, b )
                                trace_print( ''---- boost gets crazy ----'' )
                                var[''ctypes_type''] = ''ctypes.c_void_p''
                                var[''unresolved''] = True


                        elif ''namespace'' in var and self.concrete_typedef(var[''namespace'']+tag):
                            #print( ''TRYING WITH NS'', var[''namespace''] )
                            con = self.concrete_typedef( var[''namespace'']+tag )
                            if con:
                                var[''typedef''] = var[''namespace'']+tag
                                var[''type''] = con
                                if ''struct'' in con.split():
                                    var[''raw_type''] = var[''typedef'']
                                    var[''ctypes_type''] = ''ctypes.c_void_p''
                                else:
                                    self.resolve_type( var[''type''], var )
                                    var[''ctypes_type''] = self.guess_ctypes_type( var[''type''] )

                        elif ''::'' in var:
                            var[''ctypes_type''] = ''ctypes.c_void_p''
                            var[''unresolved''] = True

                        elif tag in self.SubTypedefs:    # TODO remove SubTypedefs
                            if ''property_of_class'' in var or ''property_of_struct'' in var:
                                trace_print( ''class:'', self.SubTypedefs[ tag ], ''tag:'', tag )
                                var[''typedef''] = self.SubTypedefs[ tag ]    # class name
                                var[''ctypes_type''] = ''ctypes.c_void_p''
                            else:
                                trace_print( "WARN-this should almost never happen!" )
                                trace_print( var ); trace_print(''-''*80)
                                var[''unresolved''] = True

                        elif tag in self._template_typenames:
                            var[''typename''] = tag
                            var[''ctypes_type''] = ''ctypes.c_void_p''
                            var[''unresolved''] = True    # TODO, how to deal with templates?

                        elif tag.startswith(''_''):    # assume starting with underscore is not important for wrapping
                            warning_print( ''WARN unresolved %s''%_tag)
                            var[''ctypes_type''] = ''ctypes.c_void_p''
                            var[''unresolved''] = True

                        else:
                            trace_print( ''WARN: unknown type'', var )
                            assert ''property_of_class'' in var or ''property_of_struct''    # only allow this case
                            var[''unresolved''] = True


                    ## if not resolved and is a method param, not going to wrap these methods  ##
                    if var[''unresolved''] and ''method'' in var: var[''method''][''unresolved_parameters''] = True


        # create stripped raw_type #
        p = ''* & const static mutable''.split()        # +++ new July7: "mutable"
        for var in CppVariable.Vars:
            if ''raw_type'' not in var:
                raw = []
                for x in var[''type''].split():
                    if x not in p: raw.append( x )
                var[''raw_type''] = '' ''.join( raw )

                #if ''AutoConstantEntry'' in var[''raw_type'']: print(var); assert 0
                if var[''class'']:
                    if ''::'' not in var[''raw_type'']:
                        if not var[''class''][''parent'']:
                            var[''raw_type''] = var[''class''][''namespace''] + ''::'' + var[''raw_type'']
                        elif var[''class''][''parent''] in self.classes:
                            parent = self.classes[ var[''class''][''parent''] ]
                            var[''raw_type''] = parent[''namespace''] + ''::'' + var[''class''][''name''] + ''::'' + var[''raw_type'']
                        else:
                            var[''unresolved''] = True

                    elif ''::'' in var[''raw_type''] and var[''raw_type''].split(''::'')[0] not in self.namespaces:
                        var[''raw_type''] = var[''class''][''namespace''] + ''::'' + var[''raw_type'']
                    else:
                        var[''unresolved''] = True

                elif ''forward_declared'' in var and ''namespace'' in var:
                    if ''::'' not in var[''raw_type'']:
                        var[''raw_type''] = var[''namespace''] + var[''raw_type'']
                    elif ''::'' in var[''raw_type''] and var[''raw_type''].split(''::'')[0] in self.namespaces:
                        pass
                    else: trace_print(''-''*80); trace_print(var); raise NotImplemented


            ## need full name space for classes in raw type ##
            if var[''raw_type''].startswith( ''::'' ):
                #print(var)
                #print(''NAMESPACE'', var[''class''][''namespace''])
                #print( ''PARENT NS'', var[''class''][''parent''][''namespace''] )
                #assert 0
                var[''unresolved''] = True
                if ''method'' in var: var[''method''][''unresolved_parameters''] = True
                #var[''raw_type''] = var[''raw_type''][2:]
        
        # Take care of #defines and #pragmas etc
        trace_print("Processing precomp_macro_buf: %s"%self._precomp_macro_buf)
        for m in self._precomp_macro_buf:
            macro = m.replace("<CppHeaderParser_newline_temp_replacement>\\n", "\n")
            try:
                if macro.lower().startswith("#define"):
                    trace_print("Adding #define %s"%macro)
                    self.defines.append(macro.split(" ", 1)[1].strip())
                elif macro.lower().startswith("#pragma"):
                    trace_print("Adding #pragma %s"%macro)
                    self.pragmas.append(macro.split(" ", 1)[1].strip())
                elif macro.lower().startswith("#include"):
                    trace_print("Adding #include %s"%macro)
                    self.includes.append(macro.split(" ", 1)[1].strip())
                else:
                    debug_print("Cant detect what to do with precomp macro ''%s''"%macro)
            except: pass
        self._precomp_macro_buf = None
        

    def concrete_typedef( self, key ):
        if key not in self.typedefs:
            #print( ''FAILED typedef'', key )
            return None
        while key in self.typedefs:
            prev = key
            key = self.typedefs[ key ]
            if ''<'' in key or ''>'' in key: return prev        # stop at template
            if key.startswith(''std::''): return key        # stop at std lib
        return key


class _CppHeader( Resolver ):
    def finalize(self):
        self.finalize_vars()
        # finalize classes and method returns types
        for cls in list(self.classes.values()):
            for meth in cls.get_all_methods():
                if meth[''pure_virtual'']: cls[''abstract''] = True

                if not meth[''returns_fundamental''] and meth[''returns''] in C99_NONSTANDARD:
                    meth[''returns''] = C99_NONSTANDARD[meth[''returns'']]
                    meth[''returns_fundamental''] = True

                elif not meth[''returns_fundamental'']:    # describe the return type
                    con = None
                    if cls[''namespace''] and ''::'' not in meth[''returns'']:
                        con = self.concrete_typedef( cls[''namespace''] + ''::'' + meth[''returns''] )
                    else: con = self.concrete_typedef( meth[''returns''] )


                    if con:
                        meth[''returns_concrete''] = con
                        meth[''returns_fundamental''] = is_fundamental( con )

                    elif meth[''returns''] in self.classes:
                        trace_print( ''meth returns class:'', meth[''returns''] )
                        meth[''returns_class''] = True

                    elif meth[''returns''] in self.SubTypedefs:
                        meth[''returns_class''] = True
                        meth[''returns_nested''] = self.SubTypedefs[ meth[''returns''] ]

                    elif meth[''returns''] in cls._public_enums:
                        enum = cls._public_enums[ meth[''returns''] ]
                        meth[''returns_enum''] = enum[''type'']
                        meth[''returns_fundamental''] = True
                        if enum[''type''] == int: meth[''returns''] = ''int''
                        else: meth[''returns''] = ''char*''

                    elif meth[''returns''] in self.global_enums:
                        enum = self.global_enums[ meth[''returns''] ]
                        meth[''returns_enum''] = enum[''type'']
                        meth[''returns_fundamental''] = True
                        if enum[''type''] == int: meth[''returns''] = ''int''
                        else: meth[''returns''] = ''char*''

                    elif meth[''returns''].count(''::'')==1:
                        trace_print( meth )
                        a,b = meth[''returns''].split(''::'')
                        if a in self.namespaces:
                            if b in self.classes:
                                klass = self.classes[ b ]
                                meth[''returns_class''] = a + ''::'' + b
                            elif ''<'' in b and ''>'' in b:
                                warning_print( ''WARN-can not return template: %s''%b )
                                meth[''returns_unknown''] = True
                            elif b in self.global_enums:
                                enum = self.global_enums[ b ]
                                meth[''returns_enum''] = enum[''type'']
                                meth[''returns_fundamental''] = True
                                if enum[''type''] == int: meth[''returns''] = ''int''
                                else: meth[''returns''] = ''char*''

                            else: trace_print( a, b); trace_print( meth); meth[''returns_unknown''] = True    # +++

                        elif a in self.classes:
                            klass = self.classes[ a ]
                            if b in klass._public_enums:
                                trace_print( ''...found nested enum'', b )
                                enum = klass._public_enums[ b ]
                                meth[''returns_enum''] = enum[''type'']
                                meth[''returns_fundamental''] = True
                                if enum[''type''] == int: meth[''returns''] = ''int''
                                else: meth[''returns''] = ''char*''

                            elif b in klass._public_forward_declares:
                                meth[''returns_class''] = True

                            elif b in klass._public_typedefs:
                                typedef = klass._public_typedefs[ b ]
                                meth[''returns_fundamental''] = is_fundamental( typedef )

                            else:
                                trace_print( meth )    # should be a nested class, TODO fix me.
                                meth[''returns_unknown''] = True

                    elif ''::'' in meth[''returns'']:
                        trace_print(''TODO namespace or extra nested return:'', meth)
                        meth[''returns_unknown''] = True
                    else:
                        trace_print( ''WARN: UNKNOWN RETURN'', meth[''name''], meth[''returns''])
                        meth[''returns_unknown''] = True

        for cls in list(self.classes.values()):
            methnames = cls.get_all_method_names()
            pvm = cls.get_all_pure_virtual_methods()

            for d in cls[''inherits'']:
                c = d[''class'']
                a = d[''access'']    # do not depend on this to be ''public''
                trace_print( ''PARENT CLASS:'', c )
                if c not in self.classes: trace_print(''WARN: parent class not found'')
                if c in self.classes and self.classes[c][''abstract'']:
                    p = self.classes[ c ]
                    for meth in p.get_all_methods():    #p["methods"]["public"]:
                        trace_print( ''\t\tmeth'', meth[''name''], ''pure virtual'', meth[''pure_virtual''] )
                        if meth[''pure_virtual''] and meth[''name''] not in methnames: cls[''abstract''] = True; break





    def evaluate_struct_stack(self):
        """Create a Struct out of the name stack (but not its parts)"""
        #print( ''eval struct stack'', self.nameStack )
        #if self.braceDepth != len(self.nameSpaces): return
        struct = CppStruct(self.nameStack)
        struct["namespace"] = self.cur_namespace()
        self.structs[ struct[''type''] ] = struct
        self.structs_order.append( struct )
        if self.curClass:
            struct[''parent''] = self.curClass
            klass = self.classes[ self.curClass ]
            klass[''structs''][self.curAccessSpecifier].append( struct )
            if self.curAccessSpecifier == ''public'': klass._public_structs[ struct[''type''] ] = struct
        self.curStruct = struct
        self._structs_brace_level[ struct[''type''] ] = self.braceDepth

    
    def parse_method_type( self, stack ):
        trace_print( ''meth type info'', stack )
        if stack[0] in '':;'': stack = stack[1:]
        info = { 
            ''debug'': '' ''.join(stack).replace('' : : '', ''::'' ).replace('' < '', ''<'' ).replace('' > '', ''> '' ).replace(" >",">").replace(">>", "> >").replace(">>", "> >"), 
            ''class'':None, 
            ''namespace'':self.cur_namespace(add_double_colon=True),
        }

        for tag in ''defined pure_virtual operator constructor destructor extern template virtual static explicit inline friend returns returns_pointer returns_fundamental returns_class''.split(): info[tag]=False
        header = stack[ : stack.index(''('') ]
        header = '' ''.join( header )
        header = header.replace('' : : '', ''::'' )
        header = header.replace('' < '', ''<'' )
        header = header.replace('' > '', ''> '' )
        header = header.strip()

        if ''{'' in stack:
            info[''defined''] = True
            self._method_body = self.braceDepth + 1
            trace_print( ''NEW METHOD WITH BODY'', self.braceDepth )
        elif stack[-1] == '';'':
            info[''defined''] = False
            self._method_body = None    # not a great idea to be clearing here
        else: assert 0

        if len(stack) > 3 and stack[-1] == '';'' and stack[-2] == ''0'' and stack[-3] == ''='':
            info[''pure_virtual''] = True

        r = header.split()
        name = None
        if ''operator'' in stack:    # rare case op overload defined outside of class
            op = stack[ stack.index(''operator'')+1 : stack.index(''('') ]
            op = ''''.join(op)
            if not op:
                if " ".join([''operator'', ''('', '')'', ''('']) in " ".join(stack):
                    op = "()"
                else:
                    trace_print( ''Error parsing operator'')
                    return None
            
            info[''operator''] = op
            name = ''operator'' + op
            a = stack[ : stack.index(''operator'') ]

        elif r:
            name = r[-1]
            a = r[ : -1 ]    # strip name

        if name is None: return None
        #if name.startswith(''~''): name = name[1:]

        while a and a[0] == ''}'':    # strip - can have multiple } }
            a = a[1:]


        if ''::'' in name:
            #klass,name = name.split(''::'')    # methods can be defined outside of class
            klass = name[ : name.rindex(''::'') ]
            name = name.split(''::'')[-1]
            info[''class''] = klass
            if klass in self.classes and not self.curClass:
                 #Class function defined outside the class
                return None
        #    info[''name''] = name
        #else: info[''name''] = name

        if name.startswith(''~''):
            info[''destructor''] = True
            name = name[1:]
        elif not a or (name == self.curClass and len(self.curClass)):
            info[''constructor''] = True

        info[''name''] = name

        for tag in ''extern virtual static explicit inline friend''.split():
            if tag in a: info[ tag ] = True; a.remove( tag )    # inplace
        if ''template'' in a:
            a.remove(''template'')
            b = '' ''.join( a )
            if ''>'' in b:
                info[''template''] = b[ : b.index(''>'')+1 ]
                info[''returns''] = b[ b.index(''>'')+1 : ]    # find return type, could be incorrect... TODO
                if ''<typename'' in info[''template''].split():
                    typname = info[''template''].split()[-1]
                    typname = typname[ : -1 ]    # strip ''>''
                    if typname not in self._template_typenames: self._template_typenames.append( typname )
            else: info[''returns''] = '' ''.join( a )
        else: info[''returns''] = '' ''.join( a )
        info[''returns''] = info[''returns''].replace('' <'', ''<'').strip()

        ## be careful with templates, do not count pointers inside template
        info[''returns_pointer''] = info[''returns''].split(''>'')[-1].count(''*'')
        if info[''returns_pointer'']: info[''returns''] = info[''returns''].replace(''*'','''').strip()

        info[''returns_reference''] = ''&'' in info[''returns'']
        if info[''returns'']: info[''returns''] = info[''returns''].replace(''&'','''').strip()

        a = []
        for b in info[''returns''].split():
            if b == ''__const__'': info[''returns_const''] = True
            elif b == ''const'': info[''returns_const''] = True
            else: a.append( b )
        info[''returns''] = '' ''.join( a )

        info[''returns_fundamental''] = is_fundamental( info[''returns''] )
        return info

    def evaluate_method_stack(self):
        """Create a method out of the name stack"""

        if self.curStruct:
            trace_print( ''WARN - struct contains methods - skipping'' )
            trace_print( self.stack )
            assert 0

        info = self.parse_method_type( self.stack )
        if info:
            if info[ ''class'' ] and info[''class''] in self.classes:     # case where methods are defined outside of class
                newMethod = CppMethod(self.nameStack, info[''name''], info)
                klass = self.classes[ info[''class''] ]
                klass[ ''methods'' ][ ''public'' ].append( newMethod )
                newMethod[''parent''] = klass
                if klass[''namespace'']: newMethod[''path''] = klass[''namespace''] + ''::'' + klass[''name'']
                else: newMethod[''path''] = klass[''name'']
                
            elif self.curClass:    # normal case
                newMethod = CppMethod(self.nameStack, self.curClass, info)
                klass = self.classes[self.curClass]
                klass[''methods''][self.curAccessSpecifier].append(newMethod)
                newMethod[''parent''] = klass
                if klass[''namespace'']: newMethod[''path''] = klass[''namespace''] + ''::'' + klass[''name'']
                else: newMethod[''path''] = klass[''name'']
            else: #non class functions
                debug_print("FREE FUNCTION")
                newMethod = CppMethod(self.nameStack, None, info)
                self.functions.append(newMethod)
            global parseHistory
            parseHistory.append({"braceDepth": self.braceDepth, "item_type": "method", "item": newMethod})
        else:
            trace_print( ''free function?'', self.nameStack )

        self.stack = []

    def _parse_typedef( self, stack, namespace='''' ):
        if not stack or ''typedef'' not in stack: return
        stack = list( stack )    # copy just to be safe
        if stack[-1] == '';'': stack.pop()

        while stack and stack[-1].isdigit(): stack.pop()    # throw away array size for now

        idx = stack.index(''typedef'')
        name = namespace + stack[-1]
        s = ''''
        for a in stack[idx+1:-1]:
            if a == ''{'': break
            if not s or s[-1] in '':<>'' or a in '':<>'': s += a    # keep compact
            else: s += '' '' + a    # spacing

        r = {''name'':name, ''raw'':s, ''type'':s}
        if not is_fundamental(s):
            if ''struct'' in s.split(): pass        # TODO is this right? "struct ns::something"
            elif ''::'' not in s: s = namespace + s         # only add the current name space if no namespace given
            r[''type''] = s
        if s: return r


    def evaluate_typedef(self):
        ns = self.cur_namespace(add_double_colon=True)
        res = self._parse_typedef( self.stack, ns )
        if res:
            name = res[''name'']
            self.typedefs[ name ] = res[''type'']
            if name not in self.typedefs_order: self.typedefs_order.append( name )


    def evaluate_property_stack(self):
        """Create a Property out of the name stack"""
        global parseHistory
        assert self.stack[-1] == '';''
        if self.nameStack[0] == ''typedef'':
            if self.curClass:
                typedef = self._parse_typedef( self.stack )
                name = typedef[''name'']
                klass = self.classes[ self.curClass ]
                klass[ ''typedefs'' ][ self.curAccessSpecifier ].append( name )
                if self.curAccessSpecifier == ''public'': klass._public_typedefs[ name ] = typedef[''type'']
                Resolver.SubTypedefs[ name ] = self.curClass
            else: assert 0
        elif self.curStruct or self.curClass:
            if len(self.nameStack) == 1:
                #See if we can de anonymize the type
                filteredParseHistory = [h for h in parseHistory if h["braceDepth"] == self.braceDepth]
                if len(filteredParseHistory) and filteredParseHistory[-1]["item_type"] == "class":
                    self.nameStack.insert(0, filteredParseHistory[-1]["item"]["name"])
                    debug_print("DEANONYMOIZING %s to type ''%s''"%(self.nameStack[1], self.nameStack[0]))
            if "," in self.nameStack: #Maybe we have a variable list
                #Figure out what part is the variable separator but remember templates of function pointer
                #First find left most comma outside of a > and )
                leftMostComma = 0;
                for i in range(0, len(self.nameStack)):
                    name = self.nameStack[i]
                    if name in (">", ")"): leftMostComma = 0
                    if leftMostComma == 0 and name == ",": leftMostComma = i
                # Is it really a list of variables?
                if leftMostComma != 0:
                    trace_print("Multiple variables for namestack in %s.  Separating processing"%self.nameStack)
                    orig_nameStack = self.nameStack[:]
                    orig_stack = self.stack[:]
                    
                    type_nameStack = orig_nameStack[:leftMostComma-1]
                    for name in orig_nameStack[leftMostComma - 1::2]:
                        self.nameStack = type_nameStack + [name]
                        self.stack = orig_stack[:] # Not maintained for mucking, but this path it doesnt matter
                        self.evaluate_property_stack()
                    return

            newVar = CppVariable(self.nameStack)
            newVar[''namespace''] = self.current_namespace()
            if self.curStruct:
                self.curStruct[ ''fields'' ].append( newVar )
                newVar[''property_of_struct''] = self.curStruct
            elif self.curClass:
                klass = self.classes[self.curClass]
                klass["properties"][self.curAccessSpecifier].append(newVar)
                newVar[''property_of_class''] = klass[''name'']
            parseHistory.append({"braceDepth": self.braceDepth, "item_type": "variable", "item": newVar})

        self.stack = []        # CLEAR STACK

    def evaluate_class_stack(self):
        """Create a Class out of the name stack (but not its parts)"""
        #dont support sub classes today
        #print( ''eval class stack'', self.nameStack )
        parent = self.curClass
        if self.braceDepth > len( self.nameSpaces) and parent:
            trace_print( ''HIT NESTED SUBCLASS'' )
            self.accessSpecifierStack.append(self.curAccessSpecifier)
        elif self.braceDepth != len(self.nameSpaces):
            error_print( ''ERROR: WRONG BRACE DEPTH'' )
            return
        
        if self.nameStack[0] == "class":
            self.curAccessSpecifier = ''private''
        else:#struct
            self.curAccessSpecifier = ''public''
        debug_print("curAccessSpecifier changed/defaulted to %s"%self.curAccessSpecifier)
        if self.nameStack[0] == "union":
            newClass = CppUnion(self.nameStack)
            self.anon_union_counter = [self.braceDepth, 2]
            trace_print( ''NEW UNION'', newClass[''name''] )
        else:
            newClass = CppClass(self.nameStack)
            trace_print( ''NEW CLASS'', newClass[''name''] )
        newClass["declaration_method"] = self.nameStack[0]
        self.classes_order.append( newClass )    # good idea to save ordering
        self.stack = []        # fixes if class declared with '';'' in closing brace
        if parent:
            newClass["namespace"] = self.classes[ parent ][''namespace''] + ''::'' + parent
            newClass[''parent''] = parent
            self.classes[ parent ][''nested_classes''].append( newClass )
            ## supports nested classes with the same name ##
            self.curClass = key = parent+''::''+newClass[''name'']
            self._classes_brace_level[ key ] = self.braceDepth

        elif newClass[''parent'']:        # nested class defined outside of parent.  A::B {...}
            parent = newClass[''parent'']
            newClass["namespace"] = self.classes[ parent ][''namespace''] + ''::'' + parent
            self.classes[ parent ][''nested_classes''].append( newClass )
            ## supports nested classes with the same name ##
            self.curClass = key = parent+''::''+newClass[''name'']
            self._classes_brace_level[ key ] = self.braceDepth

        else:
            newClass["namespace"] = self.cur_namespace()
            key = newClass[''name'']
            self.curClass = newClass["name"]
            self._classes_brace_level[ newClass[''name''] ] = self.braceDepth

        if not key.endswith("::") and not key.endswith(" ") and len(key) != 0:
            if key in self.classes:
                trace_print( ''ERROR name collision:'', key )
                self.classes[key].show()
                trace_print(''-''*80)
                newClass.show()            
                assert key not in self.classes    # namespace collision
        self.classes[ key ] = newClass
        global parseHistory
        parseHistory.append({"braceDepth": self.braceDepth, "item_type": "class", "item": newClass})
    

    def evalute_forward_decl(self):
        trace_print( ''FORWARD DECL'', self.nameStack )
        assert self.nameStack[0] in (''class'', ''struct'')
        name = self.nameStack[-1]
        if self.curClass:
            klass = self.classes[ self.curClass ]
            klass[''forward_declares''][self.curAccessSpecifier].append( name )
            if self.curAccessSpecifier == ''public'': klass._public_forward_declares.append( name )
        else: self._forward_decls.append( name )

class CppHeader( _CppHeader ):
    """Parsed C++ class header
    
    Variables produced:
    self.classes - Dictionary of classes found in a given header file where the
        key is the name of the class
    """
    IGNORE_NAMES = ''__extension__''.split()
   
    def show(self):
        for className in list(self.classes.keys()):self.classes[className].show()

    def __init__(self, headerFileName, argType="file", **kwargs):
        """Create the parsed C++ header file parse tree
        
        headerFileName - Name of the file to parse OR actual file contents (depends on argType)
        argType - Indicates how to interpret headerFileName as a file string or file name
        kwargs - Supports the following keywords
        """
        ## reset global state ##
        global doxygenCommentCache
        doxygenCommentCache = ""
        CppVariable.Vars = []
        CppStruct.Structs = []

        if (argType == "file"):
            self.headerFileName = os.path.expandvars(headerFileName)
            self.mainClass = os.path.split(self.headerFileName)[1][:-2]
            headerFileStr = ""
        elif argType == "string":
            self.headerFileName = ""
            self.mainClass = "???"
            headerFileStr = headerFileName
        else:
            raise Exception("Arg type must be either file or string")
        self.curClass = ""
       
        # nested classes have parent::nested, but no extra namespace,
        # this keeps the API compatible, TODO proper namespace for everything. 
        Resolver.CLASSES = {}
        self.classes = Resolver.CLASSES
        #Functions that are not part of a class
        self.functions = []
        
        self.pragmas = []
        self.defines = []
        self.includes = []
        self._precomp_macro_buf = [] #for internal purposes, will end up filling out pragmras and defines at the end

        self.enums = []
        self.global_enums = {}
        self.nameStack = []
        self.nameSpaces = []
        self.curAccessSpecifier = ''private''    # private is default
        self.accessSpecifierStack = []
        self.accessSpecifierScratch = []
        debug_print("curAccessSpecifier changed/defaulted to %s"%self.curAccessSpecifier)
        self.initextra()
    
        self.anon_union_counter = [-1, 0]
    
        if (len(self.headerFileName)):
            fd = open(self.headerFileName)
            headerFileStr = "".join(fd.readlines())
            fd.close()     
        
        # Make sure supportedAccessSpecifier are sane
        for i in range(0, len(supportedAccessSpecifier)):
            if " " not in supportedAccessSpecifier[i]: continue
            supportedAccessSpecifier[i] = re.sub("[ ]+", " ", supportedAccessSpecifier[i]).strip()
        
        # Strip out template declarations
        headerFileStr = re.sub("template[\t ]*<[^>]*>", "", headerFileStr)

        # Change multi line #defines and expressions to single lines maintaining line nubmers
        # Based from http://stackoverflow.com/questions/2424458/regular-expression-to-match-cs-multiline-preprocessor-statements
        matches = re.findall(r''(?m)^(?:.*\\\r?\n)+.*$'', headerFileStr)
        is_define = re.compile(r''[ \t\v]*#[Dd][Ee][Ff][Ii][Nn][Ee]'')
        for m in matches:
            #Keep the newlines so that linecount doesnt break
            num_newlines = len([a for a in m if a=="\n"])
            if is_define.match(m):
                new_m = m.replace("\n", "<CppHeaderParser_newline_temp_replacement>\\n")
            else:
                # Just expression taking up multiple lines, make it take 1 line for easier parsing
                new_m = m.replace("\\\n", " ")
            if (num_newlines > 0):
                new_m += "\n"*(num_newlines)
            headerFileStr = headerFileStr.replace(m, new_m)
        
        #Filter out Extern "C" statements.  These are order dependent
        matches = re.findall(re.compile(r''extern[\t ]+"[Cc]"[\t \n\r]*{'', re.DOTALL), headerFileStr)
        for m in matches:
            #Keep the newlines so that linecount doesnt break
            num_newlines = len([a for a in m if a=="\n"])
            headerFileStr = headerFileStr.replace(m, "\n" * num_newlines)        
        headerFileStr = re.sub(r''extern[ ]+"[Cc]"[ ]*'', "", headerFileStr)
                
        #Filter out any ignore symbols that end with "()" to account for #define magic functions
        for ignore in ignoreSymbols:
            if not ignore.endswith("()"): continue
            while True:
                locStart = headerFileStr.find(ignore[:-1])
                if locStart == -1:
                    break;
                locEnd = None
                #Now walk till we find the last paren and account for sub parens
                parenCount = 1
                inQuotes = False
                for i in range(locStart + len(ignore) - 1, len(headerFileStr)):
                    c = headerFileStr[i]
                    if not inQuotes:
                        if c == "(":
                            parenCount += 1
                        elif c == ")":
                            parenCount -= 1
                        elif c == ''"'':
                            inQuotes = True
                        if parenCount == 0:
                            locEnd = i + 1
                            break;
                    else:
                        if c == ''"'' and headerFileStr[i-1] != ''\\'':
                            inQuotes = False
                        
                if locEnd:
                    #Strip it out but keep the linecount the same so line numbers are right
                    match_str = headerFileStr[locStart:locEnd]
                    debug_print("Striping out ''%s''"%match_str)
                    num_newlines = len([a for a in match_str if a=="\n"])
                    headerFileStr = headerFileStr.replace(headerFileStr[locStart:locEnd], "\n"*num_newlines)
        
        self.braceDepth = 0
        lex.lex()
        lex.input(headerFileStr)
        global curLine
        global curChar
        curLine = 0
        curChar = 0
        try:
            while True:
                tok = lex.token()
                if not tok: break
                if self.anon_union_counter[0] == self.braceDepth and self.anon_union_counter[1]:
                    self.anon_union_counter[1] -= 1
                tok.value = TagStr(tok.value, lineno=tok.lineno)
                #debug_print("TOK: %s"%tok)
                if tok.type == ''NAME'' and tok.value in self.IGNORE_NAMES: continue
                self.stack.append( tok.value )
                curLine = tok.lineno
                curChar = tok.lexpos
                if (tok.type in (''PRECOMP_MACRO'', ''PRECOMP_MACRO_CONT'')):
                    debug_print("PRECOMP: %s"%tok)
                    self._precomp_macro_buf.append(tok.value)
                    self.stack = []
                    self.nameStack = []
                    continue
                if (tok.type == ''OPEN_BRACE''):
                    if len(self.nameStack) >= 2 and is_namespace(self.nameStack):    # namespace {} with no name used in boost, this sets default?
                        if self.nameStack[1] == "__IGNORED_NAMESPACE__CppHeaderParser__":#Used in filtering extern "C"
                            self.nameStack[1] = ""
                        self.nameSpaces.append(self.nameStack[1])
                        ns = self.cur_namespace(); self.stack = []
                        if ns not in self.namespaces: self.namespaces.append( ns )
                    # Detect special condition of macro magic before class declaration so we
                    # can filter it out
                    if ''class'' in self.nameStack and self.nameStack[0] != ''class'':
                        classLocationNS = self.nameStack.index("class")
                        classLocationS = self.stack.index("class")
                        if "(" not in self.nameStack[classLocationNS:]:
                            debug_print("keyword ''class'' found in unexpected location in nameStack, must be following #define magic.  Process that before moving on")
                            origNameStack = self.nameStack
                            origStack = self.stack
                            #Process first part of stack which is probably #define macro magic and may cause issues
                            self.nameStack = self.nameStack[:classLocationNS]
                            self.stack = self.stack[:classLocationS]
                            try:
                                self.evaluate_stack()
                            except:
                                debug_print("Error processing #define magic... Oh well")
                            #Process rest of stack
                            self.nameStack = origNameStack[classLocationNS:]
                            self.stack = origStack[classLocationS:]
                        
                    
                    if len(self.nameStack) and not is_enum_namestack(self.nameStack):
                        self.evaluate_stack()
                    else:
                        self.nameStack.append(tok.value)
                    if self.stack and self.stack[0] == ''class'': self.stack = []
                    self.braceDepth += 1
                    
                elif (tok.type == ''CLOSE_BRACE''):
                    if self.braceDepth == 0:
                        continue
                    if (self.braceDepth == len(self.nameSpaces)):
                        tmp = self.nameSpaces.pop()
                        self.stack = []    # clear stack when namespace ends?
                    if len(self.nameStack) and is_enum_namestack(self.nameStack):
                        self.nameStack.append(tok.value)
                    elif self.braceDepth < 10:
                        self.evaluate_stack()
                    else:
                        self.nameStack = []
                    self.braceDepth -= 1
                    #self.stack = []; print ''BRACE DEPTH'', self.braceDepth, ''NS'', len(self.nameSpaces)
                    if self.curClass: debug_print( ''CURBD %s''%self._classes_brace_level[ self.curClass ] )

                    if (self.braceDepth == 0) or (self.curClass and self._classes_brace_level[self.curClass]==self.braceDepth):
                        trace_print( ''END OF CLASS DEF'' )
                        if self.accessSpecifierStack:
                            self.curAccessSpecifier = self.accessSpecifierStack[-1]
                            self.accessSpecifierStack = self.accessSpecifierStack[:-1] 
                        if self.curClass and self.classes[ self.curClass ][''parent'']: self.curClass = self.classes[ self.curClass ][''parent'']
                        else: self.curClass = ""; #self.curStruct = None
                        self.stack = []

                    #if self.curStruct: self.curStruct = None
                    if self.braceDepth == 0 or (self.curStruct and self._structs_brace_level[self.curStruct[''type'']]==self.braceDepth):
                        trace_print( ''END OF STRUCT DEF'' )
                        self.curStruct = None

                    if self._method_body and (self.braceDepth + 1) <= self._method_body:
                        self._method_body = None; self.stack = []; self.nameStack = []; trace_print( ''FORCE CLEAR METHBODY'' )
                
                if (tok.type == ''OPEN_PAREN''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''CLOSE_PAREN''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''OPEN_SQUARE_BRACKET''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''CLOSE_SQUARE_BRACKET''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''TAB''): pass
                elif (tok.type == ''EQUALS''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''COMMA''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''BACKSLASH''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''PIPE''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''PERCENT''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''CARET''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''EXCLAMATION''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''SQUOTE''): pass
                elif (tok.type == ''NUMBER''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''MINUS''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''PLUS''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''STRING_LITERAL''):
                    self.nameStack.append(tok.value)
                elif (tok.type == ''NAME'' or tok.type == ''AMPERSTAND'' or tok.type == ''ASTERISK'' or tok.type == ''CHAR_LITERAL''):
                    if tok.value in ignoreSymbols:
                        debug_print("Ignore symbol %s"%tok.value)
                    elif (tok.value == ''class''):
                        self.nameStack.append(tok.value)
                    elif tok.value in supportedAccessSpecifier:
                        if len(self.nameStack) and self.nameStack[0] in ("class", "struct", "union"):
                            self.nameStack.append(tok.value)
                        elif self.braceDepth == len(self.nameSpaces) + 1 or self.braceDepth == (len(self.nameSpaces) + len(self.curClass.split("::"))):
                            self.curAccessSpecifier = tok.value;
                            self.accessSpecifierScratch.append(tok.value)
                            debug_print("curAccessSpecifier updated to %s"%self.curAccessSpecifier)
                        self.stack = []
                    else:
                        self.nameStack.append(tok.value)
                        if self.anon_union_counter[0] == self.braceDepth:
                            self.anon_union_counter = [-1, 0]
                elif (tok.type == ''COLON''):
                    #Dont want colon to be first in stack
                    if len(self.nameStack) == 0:
                        self.accessSpecifierScratch = []
                        continue
                    
                    # Handle situation where access specifiers can be multi words such as "public slots"
                    jns = " ".join(self.accessSpecifierScratch + self.nameStack)
                    if jns in supportedAccessSpecifier:
                        self.curAccessSpecifier = jns;
                        debug_print("curAccessSpecifier updated to %s"%self.curAccessSpecifier)
                        self.stack = []
                        self.nameStack = []
                    else:
                        self.nameStack.append(tok.value)
                    self.accessSpecifierScratch = []

                elif (tok.type == ''SEMI_COLON''):
                    if self.anon_union_counter[0] == self.braceDepth and self.anon_union_counter[1]:
                        debug_print("Creating anonymous union")
                        #Force the processing of an anonymous union
                        saved_namestack = self.nameStack[:] 
                        saved_stack = self.stack[:]
                        self.nameStack = [""]
                        self.stack = self.nameStack + [";"]
                        self.nameStack = self.nameStack[0:1]
                        debug_print("pre eval anon stack")
                        self.evaluate_stack( tok.type )
                        debug_print("post eval anon stack")
                        self.nameStack = saved_namestack
                        self.stack = saved_stack
                        self.anon_union_counter = [-1, 0];
                    
                    
                    if (self.braceDepth < 10): self.evaluate_stack( tok.type )
                    self.stack = []
                    self.nameStack = []

        except:
            if (debug): raise
            raise CppParseError("Not able to parse %s on line %d evaluating \"%s\"\nError around: %s"
                                % (self.headerFileName, tok.lineno, tok.value, " ".join(self.nameStack)))

        self.finalize()
        global parseHistory
        parseHistory = []

    def evaluate_stack(self, token=None):
        """Evaluates the current name stack"""
        global doxygenCommentCache
        
        self.nameStack = filter_out_attribute_keyword(self.nameStack)
        self.stack = filter_out_attribute_keyword(self.stack)
        
        debug_print( "Evaluating stack %s\n       BraceDepth: %s (called from %d)" %(self.nameStack,self.braceDepth, inspect.currentframe().f_back.f_lineno))
        
        #Handle special case of overloading operator ()
        if "operator()(" in "".join(self.nameStack):
            operator_index = self.nameStack.index("operator")
            self.nameStack.pop(operator_index + 2)
            self.nameStack.pop(operator_index + 1)
            self.nameStack[operator_index] = "operator()"
        
        if (len(self.curClass)):
            debug_print( "%s (%s) "%(self.curClass, self.curAccessSpecifier))

        #Filter special case of array with casting in it
        try:
            bracePos = self.nameStack.index("[")
            parenPos = self.nameStack.index("(")
            if bracePos == parenPos - 1:
                endParen = self.nameStack.index(")")
                self.nameStack = self.nameStack[:bracePos + 1] + self.nameStack[endParen + 1:]
                debug_print("Filtered namestack to=%s"%self.nameStack)
        except: pass

        #if ''typedef'' in self.nameStack: self.evaluate_typedef()        # allows nested typedefs, probably a bad idea
        if not self.curClass and ''typedef'' in self.nameStack:
            trace_print(''STACK'', self.stack)
            self.evaluate_typedef()
            return
        
        elif (len(self.nameStack) == 0):
            debug_print( "trace" )
            debug_print( "(Empty Stack)" )
            return
        elif (self.nameStack[0] == "namespace"):
            #Taken care of outside of here
            pass
        elif len(self.nameStack) == 2 and self.nameStack[0] == "friend":#friend class declaration
            pass
        elif len(self.nameStack) >= 2 and self.nameStack[0] == ''using'' and self.nameStack[1] == ''namespace'': pass    # TODO

        elif is_enum_namestack(self.nameStack):
            debug_print( "trace" )
            self.evaluate_enum_stack()

        elif self._method_body and (self.braceDepth + 1) > self._method_body: trace_print( ''INSIDE METHOD DEF'' )
        elif is_method_namestack(self.stack) and not self.curStruct and ''('' in self.nameStack:
            debug_print( "trace" )
            if self.braceDepth > 0:
                if "{" in self.stack and self.stack[0] != ''{'' and self.stack[-1] == '';'' and self.braceDepth == 1:
                    #Special case of a method defined outside a class that has a body
                    pass
                else: 
                    self.evaluate_method_stack()
            else:
                #Free function
                self.evaluate_method_stack()
        elif is_property_namestack(self.nameStack) and self.stack[-1] == '';'':
            debug_print( "trace" )
            if self.nameStack[0] in (''class'', ''struct'') and len(self.stack) == 3: self.evalute_forward_decl()
            elif len(self.nameStack) >= 2 and (self.nameStack[0]==''friend'' and self.nameStack[1]==''class''): pass
            else: self.evaluate_property_stack()    # catches class props and structs in a namespace

        elif self.nameStack[0] in ("class", "struct", "union"):
            #Parsing a union can reuse much of the class parsing
            debug_print( "trace" )
            self.evaluate_class_stack()
        #elif (self.nameStack[0] == "struct"):
        #    debug_print( "trace" )
            ##this causes a bug when structs are nested in protected or private##self.curAccessSpecifier = "public"
        #    self.evaluate_struct_stack()


        elif not self.curClass:
            debug_print( "trace" )
            if is_enum_namestack(self.nameStack): self.evaluate_enum_stack()
            elif self.curStruct and self.stack[-1] == '';'': self.evaluate_property_stack()    # this catches fields of global structs
            self.nameStack = []
            doxygenCommentCache = ""
            return
        elif (self.braceDepth < 1):
            debug_print( "trace" )
            #Ignore global stuff for now
            debug_print( "Global stuff: %s"%self.nameStack )
            self.nameStack = []
            doxygenCommentCache = ""
            return
        elif (self.braceDepth > len(self.nameSpaces) + 1):
            debug_print( "trace" )
            self.nameStack = []
            doxygenCommentCache = ""
            return

        self.nameStack = []        # its a little confusing to have some if/else above return and others not, and then clearning the nameStack down here
        doxygenCommentCache = ""
    

    def evaluate_enum_stack(self):
        """Create an Enum out of the name stack"""
        debug_print( "evaluating enum" )
        newEnum = CppEnum(self.nameStack)
        if len(list(newEnum.keys())):
            if len(self.curClass):
                newEnum["namespace"] = self.cur_namespace(False)
                klass = self.classes[self.curClass]
                klass["enums"][self.curAccessSpecifier].append(newEnum)
                if self.curAccessSpecifier == ''public'' and ''name'' in newEnum: klass._public_enums[ newEnum[''name''] ] = newEnum
            else:
                newEnum["namespace"] = self.cur_namespace(True)
                self.enums.append(newEnum)
                if ''name'' in newEnum and newEnum[''name'']: self.global_enums[ newEnum[''name''] ] = newEnum

            #This enum has instances, turn them into properties
            if "instances" in newEnum:
                instanceType = "enum"
                if "name" in newEnum:
                    instanceType = newEnum["name"]
                for instance in newEnum["instances"]:
                    self.nameStack = [instanceType,  instance]
                    self.evaluate_property_stack()
                del newEnum["instances"]


    def __repr__(self):
        rtn = ""
        for className in list(self.classes.keys()):
            rtn += "%s\n"%self.classes[className]
        if self.functions:
            rtn += "// functions\n"
            for f in self.functions:
                rtn += "%s\n"%f
        if self.enums:
            rtn += "// enums\n"
            for f in self.enums:
                rtn += "%s\n"%f
        return rtn
'
]

{ #category : #resources }
PythonParserTests >> source_GardenSnake [
	^ '# GardenSnake - a parser generator demonstration program
#
# This implements a modified version of a subset of Python:
#  - only ''def'', ''return'' and ''if'' statements
#  - ''if'' only has ''then'' clause (no elif nor else)
#  - single-quoted strings only, content in raw format
#  - numbers are decimal.Decimal instances (not integers or floats)
#  - no print statment; use the built-in ''print'' function
#  - only < > == + - / * implemented (and unary + -)
#  - assignment and tuple assignment work
#  - no generators of any sort
#  - no ... well, no quite a lot

# Why?  I''m thinking about a new indentation-based configuration
# language for a project and wanted to figure out how to do it.  Once
# I got that working I needed a way to test it out.  My original AST
# was dumb so I decided to target Python''s AST and compile it into
# Python code.  Plus, it''s pretty cool that it only took a day or so
# from sitting down with Ply to having working code.

# This uses David Beazley''s Ply from http://www.dabeaz.com/ply/

# This work is hereby released into the Public Domain. To view a copy of
# the public domain dedication, visit
# http://creativecommons.org/licenses/publicdomain/ or send a letter to
# Creative Commons, 543 Howard Street, 5th Floor, San Francisco,
# California, 94105, USA.
#
# Portions of this work are derived from Python''s Grammar definition
# and may be covered under the Python copyright and license
#
#          Andrew Dalke / Dalke Scientific Software, LLC
#             30 August 2006 / Cape Town, South Africa

# Changelog:
#  30 August - added link to CC license; removed the "swapcase" encoding

# Modifications for inclusion in PLY distribution
import sys
sys.path.insert(0,"../..")
from ply import *

##### Lexer ######
#import lex
import decimal

tokens = (
    ''DEF'',
    ''IF'',
    ''NAME'',
    ''NUMBER'',  # Python decimals
    ''STRING'',  # single quoted strings only; syntax of raw strings
    ''LPAR'',
    ''RPAR'',
    ''COLON'',
    ''EQ'',
    ''ASSIGN'',
    ''LT'',
    ''GT'',
    ''PLUS'',
    ''MINUS'',
    ''MULT'',
    ''DIV'',
    ''RETURN'',
    ''WS'',
    ''NEWLINE'',
    ''COMMA'',
    ''SEMICOLON'',
    ''INDENT'',
    ''DEDENT'',
    ''ENDMARKER'',
    )

#t_NUMBER = r''\d+''
# taken from decmial.py but without the leading sign
def t_NUMBER(t):
    r"""(\d+(\.\d*)?|\.\d+)([eE][-+]? \d+)?"""
    t.value = decimal.Decimal(t.value)
    return t

def t_STRING(t):
    r"''([^\\'']+|\\''|\\\\)*''"  # I think this is right ...
    t.value=t.value[1:-1].decode("string-escape") # .swapcase() # for fun
    return t

t_COLON = r'':''
t_EQ = r''==''
t_ASSIGN = r''=''
t_LT = r''<''
t_GT = r''>''
t_PLUS = r''\+''
t_MINUS = r''-''
t_MULT = r''\*''
t_DIV = r''/''
t_COMMA = r'',''
t_SEMICOLON = r'';''

# Ply nicely documented how to do this.

RESERVED = {
  "def": "DEF",
  "if": "IF",
  "return": "RETURN",
  }

def t_NAME(t):
    r''[a-zA-Z_][a-zA-Z0-9_]*''
    t.type = RESERVED.get(t.value, "NAME")
    return t

# Putting this before t_WS let it consume lines with only comments in
# them so the latter code never sees the WS part.  Not consuming the
# newline.  Needed for "if 1: #comment"
def t_comment(t):
    r"[ ]*\043[^\n]*"  # \043 is ''#''
    pass


# Whitespace
def t_WS(t):
    r'' [ ]+ ''
    if t.lexer.at_line_start and t.lexer.paren_count == 0:
        return t

# Don''t generate newline tokens when inside of parenthesis, eg
#   a = (1,
#        2, 3)
def t_newline(t):
    r''\n+''
    t.lexer.lineno += len(t.value)
    t.type = "NEWLINE"
    if t.lexer.paren_count == 0:
        return t

def t_LPAR(t):
    r''\(''
    t.lexer.paren_count += 1
    return t

def t_RPAR(t):
    r''\)''
    # check for underflow?  should be the job of the parser
    t.lexer.paren_count -= 1
    return t


def t_error(t):
    raise SyntaxError("Unknown symbol %r" % (t.value[0],))
    print "Skipping", repr(t.value[0])
    t.lexer.skip(1)

## I implemented INDENT / DEDENT generation as a post-processing filter

# The original lex token stream contains WS and NEWLINE characters.
# WS will only occur before any other tokens on a line.

# I have three filters.  One tags tokens by adding two attributes.
# "must_indent" is True if the token must be indented from the
# previous code.  The other is "at_line_start" which is True for WS
# and the first non-WS/non-NEWLINE on a line.  It flags the check so
# see if the new line has changed indication level.

# Python''s syntax has three INDENT states
#  0) no colon hence no need to indent
#  1) "if 1: go()" - simple statements have a COLON but no need for an indent
#  2) "if 1:\n  go()" - complex statements have a COLON NEWLINE and must indent
NO_INDENT = 0
MAY_INDENT = 1
MUST_INDENT = 2

# only care about whitespace at the start of a line
def track_tokens_filter(lexer, tokens):
    lexer.at_line_start = at_line_start = True
    indent = NO_INDENT
    saw_colon = False
    for token in tokens:
        token.at_line_start = at_line_start

        if token.type == "COLON":
            at_line_start = False
            indent = MAY_INDENT
            token.must_indent = False
            
        elif token.type == "NEWLINE":
            at_line_start = True
            if indent == MAY_INDENT:
                indent = MUST_INDENT
            token.must_indent = False

        elif token.type == "WS":
            assert token.at_line_start == True
            at_line_start = True
            token.must_indent = False

        else:
            # A real token; only indent after COLON NEWLINE
            if indent == MUST_INDENT:
                token.must_indent = True
            else:
                token.must_indent = False
            at_line_start = False
            indent = NO_INDENT

        yield token
        lexer.at_line_start = at_line_start

def _new_token(type, lineno):
    tok = lex.LexToken()
    tok.type = type
    tok.value = None
    tok.lineno = lineno
    return tok

# Synthesize a DEDENT tag
def DEDENT(lineno):
    return _new_token("DEDENT", lineno)

# Synthesize an INDENT tag
def INDENT(lineno):
    return _new_token("INDENT", lineno)


# Track the indentation level and emit the right INDENT / DEDENT events.
def indentation_filter(tokens):
    # A stack of indentation levels; will never pop item 0
    levels = [0]
    token = None
    depth = 0
    prev_was_ws = False
    for token in tokens:
##        if 1:
##            print "Process", token,
##            if token.at_line_start:
##                print "at_line_start",
##            if token.must_indent:
##                print "must_indent",
##            print
                
        # WS only occurs at the start of the line
        # There may be WS followed by NEWLINE so
        # only track the depth here.  Don''t indent/dedent
        # until there''s something real.
        if token.type == "WS":
            assert depth == 0
            depth = len(token.value)
            prev_was_ws = True
            # WS tokens are never passed to the parser
            continue

        if token.type == "NEWLINE":
            depth = 0
            if prev_was_ws or token.at_line_start:
                # ignore blank lines
                continue
            # pass the other cases on through
            yield token
            continue

        # then it must be a real token (not WS, not NEWLINE)
        # which can affect the indentation level

        prev_was_ws = False
        if token.must_indent:
            # The current depth must be larger than the previous level
            if not (depth > levels[-1]):
                raise IndentationError("expected an indented block")

            levels.append(depth)
            yield INDENT(token.lineno)

        elif token.at_line_start:
            # Must be on the same level or one of the previous levels
            if depth == levels[-1]:
                # At the same level
                pass
            elif depth > levels[-1]:
                raise IndentationError("indentation increase but not in new block")
            else:
                # Back up; but only if it matches a previous level
                try:
                    i = levels.index(depth)
                except ValueError:
                    raise IndentationError("inconsistent indentation")
                for _ in range(i+1, len(levels)):
                    yield DEDENT(token.lineno)
                    levels.pop()

        yield token

    ### Finished processing ###

    # Must dedent any remaining levels
    if len(levels) > 1:
        assert token is not None
        for _ in range(1, len(levels)):
            yield DEDENT(token.lineno)
    

# The top-level filter adds an ENDMARKER, if requested.
# Python''s grammar uses it.
def filter(lexer, add_endmarker = True):
    token = None
    tokens = iter(lexer.token, None)
    tokens = track_tokens_filter(lexer, tokens)
    for token in indentation_filter(tokens):
        yield token

    if add_endmarker:
        lineno = 1
        if token is not None:
            lineno = token.lineno
        yield _new_token("ENDMARKER", lineno)

# Combine Ply and my filters into a new lexer

class IndentLexer(object):
    def __init__(self, debug=0, optimize=0, lextab=''lextab'', reflags=0):
        self.lexer = lex.lex(debug=debug, optimize=optimize, lextab=lextab, reflags=reflags)
        self.token_stream = None
    def input(self, s, add_endmarker=True):
        self.lexer.paren_count = 0
        self.lexer.input(s)
        self.token_stream = filter(self.lexer, add_endmarker)
    def token(self):
        try:
            return self.token_stream.next()
        except StopIteration:
            return None

##########   Parser (tokens -> AST) ######

# also part of Ply
#import yacc

# I use the Python AST
from compiler import ast

# Helper function
def Assign(left, right):
    names = []
    if isinstance(left, ast.Name):
        # Single assignment on left
        return ast.Assign([ast.AssName(left.name, ''OP_ASSIGN'')], right)
    elif isinstance(left, ast.Tuple):
        # List of things - make sure they are Name nodes
        names = []
        for child in left.getChildren():
            if not isinstance(child, ast.Name):
                raise SyntaxError("that assignment not supported")
            names.append(child.name)
        ass_list = [ast.AssName(name, ''OP_ASSIGN'') for name in names]
        return ast.Assign([ast.AssTuple(ass_list)], right)
    else:
        raise SyntaxError("Can''t do that yet")


# The grammar comments come from Python''s Grammar/Grammar file

## NB: compound_stmt in single_input is followed by extra NEWLINE!
# file_input: (NEWLINE | stmt)* ENDMARKER
def p_file_input_end(p):
    """file_input_end : file_input ENDMARKER"""
    p[0] = ast.Stmt(p[1])
def p_file_input(p):
    """file_input : file_input NEWLINE
                  | file_input stmt
                  | NEWLINE
                  | stmt"""
    if isinstance(p[len(p)-1], basestring):
        if len(p) == 3:
            p[0] = p[1]
        else:
            p[0] = [] # p == 2 --> only a blank line
    else:
        if len(p) == 3:
            p[0] = p[1] + p[2]
        else:
            p[0] = p[1]
            

# funcdef: [decorators] ''def'' NAME parameters '':'' suite
# ignoring decorators
def p_funcdef(p):
    "funcdef : DEF NAME parameters COLON suite"
    p[0] = ast.Function(None, p[2], tuple(p[3]), (), 0, None, p[5])
    
# parameters: ''('' [varargslist] '')''
def p_parameters(p):
    """parameters : LPAR RPAR
                  | LPAR varargslist RPAR"""
    if len(p) == 3:
        p[0] = []
    else:
        p[0] = p[2]
    

# varargslist: (fpdef [''='' test] '','')* (''*'' NAME ['','' ''**'' NAME] | ''**'' NAME) | 
# highly simplified
def p_varargslist(p):
    """varargslist : varargslist COMMA NAME
                   | NAME"""
    if len(p) == 4:
        p[0] = p[1] + p[3]
    else:
        p[0] = [p[1]]

# stmt: simple_stmt | compound_stmt
def p_stmt_simple(p):
    """stmt : simple_stmt"""
    # simple_stmt is a list
    p[0] = p[1]
    
def p_stmt_compound(p):
    """stmt : compound_stmt"""
    p[0] = [p[1]]

# simple_stmt: small_stmt ('';'' small_stmt)* ['';''] NEWLINE
def p_simple_stmt(p):
    """simple_stmt : small_stmts NEWLINE
                   | small_stmts SEMICOLON NEWLINE"""
    p[0] = p[1]

def p_small_stmts(p):
    """small_stmts : small_stmts SEMICOLON small_stmt
                   | small_stmt"""
    if len(p) == 4:
        p[0] = p[1] + [p[3]]
    else:
        p[0] = [p[1]]

# small_stmt: expr_stmt | print_stmt  | del_stmt | pass_stmt | flow_stmt |
#    import_stmt | global_stmt | exec_stmt | assert_stmt
def p_small_stmt(p):
    """small_stmt : flow_stmt
                  | expr_stmt"""
    p[0] = p[1]

# expr_stmt: testlist (augassign (yield_expr|testlist) |
#                      (''='' (yield_expr|testlist))*)
# augassign: (''+='' | ''-='' | ''*='' | ''/='' | ''%='' | ''&='' | ''|='' | ''^='' |
#             ''<<='' | ''>>='' | ''**='' | ''//='')
def p_expr_stmt(p):
    """expr_stmt : testlist ASSIGN testlist
                 | testlist """
    if len(p) == 2:
        # a list of expressions
        p[0] = ast.Discard(p[1])
    else:
        p[0] = Assign(p[1], p[3])

def p_flow_stmt(p):
    "flow_stmt : return_stmt"
    p[0] = p[1]

# return_stmt: ''return'' [testlist]
def p_return_stmt(p):
    "return_stmt : RETURN testlist"
    p[0] = ast.Return(p[2])


def p_compound_stmt(p):
    """compound_stmt : if_stmt
                     | funcdef"""
    p[0] = p[1]

def p_if_stmt(p):
    ''if_stmt : IF test COLON suite''
    p[0] = ast.If([(p[2], p[4])], None)

def p_suite(p):
    """suite : simple_stmt
             | NEWLINE INDENT stmts DEDENT"""
    if len(p) == 2:
        p[0] = ast.Stmt(p[1])
    else:
        p[0] = ast.Stmt(p[3])
    

def p_stmts(p):
    """stmts : stmts stmt
             | stmt"""
    if len(p) == 3:
        p[0] = p[1] + p[2]
    else:
        p[0] = p[1]

## No using Python''s approach because Ply supports precedence

# comparison: expr (comp_op expr)*
# arith_expr: term ((''+''|''-'') term)*
# term: factor ((''*''|''/''|''%''|''//'') factor)*
# factor: (''+''|''-''|''~'') factor | power
# comp_op: ''<''|''>''|''==''|''>=''|''<=''|''<>''|''!=''|''in''|''not'' ''in''|''is''|''is'' ''not''

def make_lt_compare((left, right)):
    return ast.Compare(left, [(''<'', right),])
def make_gt_compare((left, right)):
    return ast.Compare(left, [(''>'', right),])
def make_eq_compare((left, right)):
    return ast.Compare(left, [(''=='', right),])


binary_ops = {
    "+": ast.Add,
    "-": ast.Sub,
    "*": ast.Mul,
    "/": ast.Div,
    "<": make_lt_compare,
    ">": make_gt_compare,
    "==": make_eq_compare,
}
unary_ops = {
    "+": ast.UnaryAdd,
    "-": ast.UnarySub,
    }
precedence = (
    ("left", "EQ", "GT", "LT"),
    ("left", "PLUS", "MINUS"),
    ("left", "MULT", "DIV"),
    )

def p_comparison(p):
    """comparison : comparison PLUS comparison
                  | comparison MINUS comparison
                  | comparison MULT comparison
                  | comparison DIV comparison
                  | comparison LT comparison
                  | comparison EQ comparison
                  | comparison GT comparison
                  | PLUS comparison
                  | MINUS comparison
                  | power"""
    if len(p) == 4:
        p[0] = binary_ops[p[2]]((p[1], p[3]))
    elif len(p) == 3:
        p[0] = unary_ops[p[1]](p[2])
    else:
        p[0] = p[1]
                  
# power: atom trailer* [''**'' factor]
# trailers enables function calls.  I only allow one level of calls
# so this is ''trailer''
def p_power(p):
    """power : atom
             | atom trailer"""
    if len(p) == 2:
        p[0] = p[1]
    else:
        if p[2][0] == "CALL":
            p[0] = ast.CallFunc(p[1], p[2][1], None, None)
        else:
            raise AssertionError("not implemented")

def p_atom_name(p):
    """atom : NAME"""
    p[0] = ast.Name(p[1])

def p_atom_number(p):
    """atom : NUMBER
            | STRING"""
    p[0] = ast.Const(p[1])

def p_atom_tuple(p):
    """atom : LPAR testlist RPAR"""
    p[0] = p[2]

# trailer: ''('' [arglist] '')'' | ''['' subscriptlist '']'' | ''.'' NAME
def p_trailer(p):
    "trailer : LPAR arglist RPAR"
    p[0] = ("CALL", p[2])

# testlist: test ('','' test)* ['','']
# Contains shift/reduce error
def p_testlist(p):
    """testlist : testlist_multi COMMA
                | testlist_multi """
    if len(p) == 2:
        p[0] = p[1]
    else:
        # May need to promote singleton to tuple
        if isinstance(p[1], list):
            p[0] = p[1]
        else:
            p[0] = [p[1]]
    # Convert into a tuple?
    if isinstance(p[0], list):
        p[0] = ast.Tuple(p[0])

def p_testlist_multi(p):
    """testlist_multi : testlist_multi COMMA test
                      | test"""
    if len(p) == 2:
        # singleton
        p[0] = p[1]
    else:
        if isinstance(p[1], list):
            p[0] = p[1] + [p[3]]
        else:
            # singleton -> tuple
            p[0] = [p[1], p[3]]


# test: or_test [''if'' or_test ''else'' test] | lambdef
#  as I don''t support ''and'', ''or'', and ''not'' this works down to ''comparison''
def p_test(p):
    "test : comparison"
    p[0] = p[1]
    


# arglist: (argument '','')* (argument ['','']| ''*'' test ['','' ''**'' test] | ''**'' test)
# XXX INCOMPLETE: this doesn''t allow the trailing comma
def p_arglist(p):
    """arglist : arglist COMMA argument
               | argument"""
    if len(p) == 4:
        p[0] = p[1] + [p[3]]
    else:
        p[0] = [p[1]]

# argument: test [gen_for] | test ''='' test  # Really [keyword ''=''] test
def p_argument(p):
    "argument : test"
    p[0] = p[1]

def p_error(p):
    #print "Error!", repr(p)
    raise SyntaxError(p)


class GardenSnakeParser(object):
    def __init__(self, lexer = None):
        if lexer is None:
            lexer = IndentLexer()
        self.lexer = lexer
        self.parser = yacc.yacc(start="file_input_end")

    def parse(self, code):
        self.lexer.input(code)
        result = self.parser.parse(lexer = self.lexer)
        return ast.Module(None, result)


###### Code generation ######
    
from compiler import misc, syntax, pycodegen

class GardenSnakeCompiler(object):
    def __init__(self):
        self.parser = GardenSnakeParser()
    def compile(self, code, filename="<string>"):
        tree = self.parser.parse(code)
        #print  tree
        misc.set_filename(filename, tree)
        syntax.check(tree)
        gen = pycodegen.ModuleCodeGenerator(tree)
        code = gen.getCode()
        return code

####### Test code #######
    
compile = GardenSnakeCompiler().compile

code = r"""

print(''LET\''S TRY THIS \\OUT'')
  
#Comment here
def x(a):
    print(''called with'',a)
    if a == 1:
        return 2
    if a*2 > 10: return 999 / 4
        # Another comment here

    return a+2*3

ints = (1, 2,
   3, 4,
5)
print(''mutiline-expression'', ints)

t = 4+1/3*2+6*(9-5+1)
print(''predence test; should be 34+2/3:'', t, t==(34+2/3))

print(''numbers'', 1,2,3,4,5)
if 1:
 8
 a=9
 print(x(a))

print(x(1))
print(x(2))
print(x(8),''3'')
print(''this is decimal'', 1/5)
print(''BIG DECIMAL'', 1.234567891234567e12345)

"""

# Set up the GardenSnake run-time environment
def print_(*args):
    print "-->", " ".join(map(str,args))

globals()["print"] = print_

compiled_code = compile(code)

exec compiled_code in globals()
print "Done"
'
]

{ #category : #resources }
PythonParserTests >> source_basic [
	^ '# An implementation of Dartmouth BASIC (1964)
#

import sys
sys.path.insert(0,"../..")

if sys.version_info[0] >= 3:
    raw_input = input

import basiclex
import basparse
import basinterp

# If a filename has been specified, we try to run it.
# If a runtime error occurs, we bail out and enter
# interactive mode below
if len(sys.argv) == 2:
    data = open(sys.argv[1]).read()
    prog = basparse.parse(data)
    if not prog: raise SystemExit
    b = basinterp.BasicInterpreter(prog)
    try:
        b.run()
        raise SystemExit
    except RuntimeError:
        pass

else:
    b = basinterp.BasicInterpreter({})

# Interactive mode.  This incrementally adds/deletes statements
# from the program stored in the BasicInterpreter object.  In
# addition, special commands ''NEW'',''LIST'',and ''RUN'' are added.
# Specifying a line number with no code deletes that line from
# the program.

while 1:
    try:
        line = raw_input("[BASIC] ")
    except EOFError:
        raise SystemExit
    if not line: continue
    line += "\n"
    prog = basparse.parse(line)
    if not prog: continue

    keys = list(prog)
    if keys[0] > 0:
         b.add_statements(prog)
    else:
         stat = prog[keys[0]]
         if stat[0] == ''RUN'':
             try:
                 b.run()
             except RuntimeError:
                 pass
         elif stat[0] == ''LIST'':
             b.list()
         elif stat[0] == ''BLANK'':
             b.del_line(stat[1])
         elif stat[0] == ''NEW'':
             b.new()

  
            






'
]

{ #category : #resources }
PythonParserTests >> source_basiclex [
	^ '# An implementation of Dartmouth BASIC (1964)

from ply import *

keywords = (
    ''LET'',''READ'',''DATA'',''PRINT'',''GOTO'',''IF'',''THEN'',''FOR'',''NEXT'',''TO'',''STEP'',
    ''END'',''STOP'',''DEF'',''GOSUB'',''DIM'',''REM'',''RETURN'',''RUN'',''LIST'',''NEW'',
)

tokens = keywords + (
     ''EQUALS'',''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''POWER'',
     ''LPAREN'',''RPAREN'',''LT'',''LE'',''GT'',''GE'',''NE'',
     ''COMMA'',''SEMI'', ''INTEGER'',''FLOAT'', ''STRING'',
     ''ID'',''NEWLINE''
)

t_ignore = '' \t''

def t_REM(t):
    r''REM .*''
    return t

def t_ID(t):
    r''[A-Z][A-Z0-9]*''
    if t.value in keywords:
        t.type = t.value
    return t
    
t_EQUALS  = r''=''
t_PLUS    = r''\+''
t_MINUS   = r''-''
t_TIMES   = r''\*''
t_POWER   = r''\^''
t_DIVIDE  = r''/''
t_LPAREN  = r''\(''
t_RPAREN  = r''\)''
t_LT      = r''<''
t_LE      = r''<=''
t_GT      = r''>''
t_GE      = r''>=''
t_NE      = r''<>''
t_COMMA   = r''\,''
t_SEMI    = r'';''
t_INTEGER = r''\d+''    
t_FLOAT   = r''((\d*\.\d+)(E[\+-]?\d+)?|([1-9]\d*E[\+-]?\d+))''
t_STRING  = r''\".*?\"''

def t_NEWLINE(t):
    r''\n''
    t.lexer.lineno += 1
    return t

def t_error(t):
    print("Illegal character %s" % t.value[0])
    t.lexer.skip(1)

lex.lex(debug=0)







       
   
  
            






'
]

{ #category : #resources }
PythonParserTests >> source_basiclog [
	^ '# An implementation of Dartmouth BASIC (1964)
#

import sys
sys.path.insert(0,"../..")

if sys.version_info[0] >= 3:
    raw_input = input

import logging
logging.basicConfig(
    level = logging.INFO,
    filename = "parselog.txt",
    filemode = "w"
)
log = logging.getLogger()

import basiclex
import basparse
import basinterp

# If a filename has been specified, we try to run it.
# If a runtime error occurs, we bail out and enter
# interactive mode below
if len(sys.argv) == 2:
    data = open(sys.argv[1]).read()
    prog = basparse.parse(data,debug=log)
    if not prog: raise SystemExit
    b = basinterp.BasicInterpreter(prog)
    try:
        b.run()
        raise SystemExit
    except RuntimeError:
        pass

else:
    b = basinterp.BasicInterpreter({})

# Interactive mode.  This incrementally adds/deletes statements
# from the program stored in the BasicInterpreter object.  In
# addition, special commands ''NEW'',''LIST'',and ''RUN'' are added.
# Specifying a line number with no code deletes that line from
# the program.

while 1:
    try:
        line = raw_input("[BASIC] ")
    except EOFError:
        raise SystemExit
    if not line: continue
    line += "\n"
    prog = basparse.parse(line,debug=log)
    if not prog: continue

    keys = list(prog)
    if keys[0] > 0:
         b.add_statements(prog)
    else:
         stat = prog[keys[0]]
         if stat[0] == ''RUN'':
             try:
                 b.run()
             except RuntimeError:
                 pass
         elif stat[0] == ''LIST'':
             b.list()
         elif stat[0] == ''BLANK'':
             b.del_line(stat[1])
         elif stat[0] == ''NEW'':
             b.new()

  
            






'
]

{ #category : #resources }
PythonParserTests >> source_basinterp [
	^ '# This file provides the runtime support for running a basic program
# Assumes the program has been parsed using basparse.py

import sys
import math
import random

class BasicInterpreter:

    # Initialize the interpreter. prog is a dictionary
    # containing (line,statement) mappings
    def __init__(self,prog):
         self.prog = prog

         self.functions = {           # Built-in function table
             ''SIN'' : lambda z: math.sin(self.eval(z)),
             ''COS'' : lambda z: math.cos(self.eval(z)),
             ''TAN'' : lambda z: math.tan(self.eval(z)),
             ''ATN'' : lambda z: math.atan(self.eval(z)),
             ''EXP'' : lambda z: math.exp(self.eval(z)),
             ''ABS'' : lambda z: abs(self.eval(z)),
             ''LOG'' : lambda z: math.log(self.eval(z)),
             ''SQR'' : lambda z: math.sqrt(self.eval(z)),
             ''INT'' : lambda z: int(self.eval(z)),
             ''RND'' : lambda z: random.random()
         }

    # Collect all data statements
    def collect_data(self):
         self.data = []
         for lineno in self.stat:
              if self.prog[lineno][0] == ''DATA'':
                  self.data = self.data + self.prog[lineno][1]
         self.dc = 0                  # Initialize the data counter

    # Check for end statements
    def check_end(self):
         has_end = 0
         for lineno in self.stat:
             if self.prog[lineno][0] == ''END'' and not has_end:
                  has_end = lineno
         if not has_end:
             print("NO END INSTRUCTION")
             self.error = 1
             return
         if has_end != lineno:
             print("END IS NOT LAST")
             self.error = 1

    # Check loops
    def check_loops(self):
         for pc in range(len(self.stat)):
             lineno = self.stat[pc]
             if self.prog[lineno][0] == ''FOR'':
                  forinst = self.prog[lineno]
                  loopvar = forinst[1]
                  for i in range(pc+1,len(self.stat)):
                       if self.prog[self.stat[i]][0] == ''NEXT'':
                            nextvar = self.prog[self.stat[i]][1]
                            if nextvar != loopvar: continue
                            self.loopend[pc] = i
                            break
                  else:
                       print("FOR WITHOUT NEXT AT LINE %s" % self.stat[pc])
                       self.error = 1
                  
    # Evaluate an expression
    def eval(self,expr):
        etype = expr[0]
        if etype == ''NUM'': return expr[1]
        elif etype == ''GROUP'': return self.eval(expr[1])
        elif etype == ''UNARY'':
             if expr[1] == ''-'': return -self.eval(expr[2])
        elif etype == ''BINOP'':
             if expr[1] == ''+'': return self.eval(expr[2])+self.eval(expr[3])
             elif expr[1] == ''-'': return self.eval(expr[2])-self.eval(expr[3])
             elif expr[1] == ''*'': return self.eval(expr[2])*self.eval(expr[3])
             elif expr[1] == ''/'': return float(self.eval(expr[2]))/self.eval(expr[3])
             elif expr[1] == ''^'': return abs(self.eval(expr[2]))**self.eval(expr[3])
        elif etype == ''VAR'':
             var,dim1,dim2 = expr[1]
             if not dim1 and not dim2:
                  if var in self.vars:
                       return self.vars[var]
                  else:
                       print("UNDEFINED VARIABLE %s AT LINE %s" % (var, self.stat[self.pc]))
                       raise RuntimeError
             # May be a list lookup or a function evaluation
             if dim1 and not dim2:
                if var in self.functions:
                      # A function
                      return self.functions[var](dim1)
                else:
                      # A list evaluation
                      if var in self.lists:
                            dim1val = self.eval(dim1)
                            if dim1val < 1 or dim1val > len(self.lists[var]):
                                 print("LIST INDEX OUT OF BOUNDS AT LINE %s" % self.stat[self.pc])
                                 raise RuntimeError
                            return self.lists[var][dim1val-1]
             if dim1 and dim2:
                 if var in self.tables:
                      dim1val = self.eval(dim1)
                      dim2val = self.eval(dim2)
                      if dim1val < 1 or dim1val > len(self.tables[var]) or dim2val < 1 or dim2val > len(self.tables[var][0]):
                           print("TABLE INDEX OUT OUT BOUNDS AT LINE %s" % self.stat[self.pc])
                           raise RuntimeError
                      return self.tables[var][dim1val-1][dim2val-1]
             print("UNDEFINED VARIABLE %s AT LINE %s" % (var, self.stat[self.pc]))
             raise RuntimeError

    # Evaluate a relational expression
    def releval(self,expr):
         etype = expr[1]
         lhs   = self.eval(expr[2])
         rhs   = self.eval(expr[3])
         if etype == ''<'':
             if lhs < rhs: return 1
             else: return 0

         elif etype == ''<='':
             if lhs <= rhs: return 1
             else: return 0

         elif etype == ''>'':
             if lhs > rhs: return 1
             else: return 0

         elif etype == ''>='':
             if lhs >= rhs: return 1
             else: return 0

         elif etype == ''='':
             if lhs == rhs: return 1
             else: return 0

         elif etype == ''<>'':
             if lhs != rhs: return 1
             else: return 0

    # Assignment
    def assign(self,target,value):
        var, dim1, dim2 = target
        if not dim1 and not dim2:
            self.vars[var] = self.eval(value)
        elif dim1 and not dim2:
            # List assignment
            dim1val = self.eval(dim1)
            if not var in self.lists:
                 self.lists[var] = [0]*10

            if dim1val > len(self.lists[var]):
                 print ("DIMENSION TOO LARGE AT LINE %s" % self.stat[self.pc])
                 raise RuntimeError
            self.lists[var][dim1val-1] = self.eval(value)
        elif dim1 and dim2:
            dim1val = self.eval(dim1)
            dim2val = self.eval(dim2)
            if not var in self.tables:
                 temp = [0]*10
                 v = []
                 for i in range(10): v.append(temp[:])
                 self.tables[var] = v
            # Variable already exists
            if dim1val > len(self.tables[var]) or dim2val > len(self.tables[var][0]):
                 print("DIMENSION TOO LARGE AT LINE %s" % self.stat[self.pc])
                 raise RuntimeError
            self.tables[var][dim1val-1][dim2val-1] = self.eval(value)

    # Change the current line number
    def goto(self,linenum):
         if not linenum in self.prog:
              print("UNDEFINED LINE NUMBER %d AT LINE %d" % (linenum, self.stat[self.pc]))
              raise RuntimeError
         self.pc = self.stat.index(linenum)

    # Run it
    def run(self):
        self.vars   = { }            # All variables
        self.lists  = { }            # List variables
        self.tables = { }            # Tables
        self.loops  = [ ]            # Currently active loops
        self.loopend= { }            # Mapping saying where loops end
        self.gosub  = None           # Gosub return point (if any)
        self.error  = 0              # Indicates program error

        self.stat = list(self.prog)  # Ordered list of all line numbers
        self.stat.sort()
        self.pc = 0                  # Current program counter

        # Processing prior to running

        self.collect_data()          # Collect all of the data statements
        self.check_end()
        self.check_loops()

        if self.error: raise RuntimeError

        while 1:
            line  = self.stat[self.pc]
            instr = self.prog[line]
            
            op = instr[0]

            # END and STOP statements
            if op == ''END'' or op == ''STOP'':
                 break           # We''re done

            # GOTO statement
            elif op == ''GOTO'':
                 newline = instr[1]
                 self.goto(newline)
                 continue

            # PRINT statement
            elif op == ''PRINT'':
                 plist = instr[1]
                 out = ""
                 for label,val in plist:
                     if out:
                          out += '' ''*(15 - (len(out) % 15))
                     out += label
                     if val:
                          if label: out += " "
                          eval = self.eval(val)
                          out += str(eval)
                 sys.stdout.write(out)
                 end = instr[2]
                 if not (end == '','' or end == '';''): 
                     sys.stdout.write("\n")
                 if end == '','': sys.stdout.write(" "*(15-(len(out) % 15)))
                 if end == '';'': sys.stdout.write(" "*(3-(len(out) % 3)))
                     
            # LET statement
            elif op == ''LET'':
                 target = instr[1]
                 value  = instr[2]
                 self.assign(target,value)

            # READ statement
            elif op == ''READ'':
                 for target in instr[1]:
                      if self.dc < len(self.data):
                          value = (''NUM'',self.data[self.dc])
                          self.assign(target,value)
                          self.dc += 1
                      else:
                          # No more data.  Program ends
                          return
            elif op == ''IF'':
                 relop = instr[1]
                 newline = instr[2]
                 if (self.releval(relop)):
                     self.goto(newline)
                     continue

            elif op == ''FOR'':
                 loopvar = instr[1]
                 initval = instr[2]
                 finval  = instr[3]
                 stepval = instr[4]
              
                 # Check to see if this is a new loop
                 if not self.loops or self.loops[-1][0] != self.pc:
                        # Looks like a new loop. Make the initial assignment
                        newvalue = initval
                        self.assign((loopvar,None,None),initval)
                        if not stepval: stepval = (''NUM'',1)
                        stepval = self.eval(stepval)    # Evaluate step here
                        self.loops.append((self.pc,stepval))
                 else:
                        # It''s a repeat of the previous loop
                        # Update the value of the loop variable according to the step
                        stepval = (''NUM'',self.loops[-1][1])
                        newvalue = (''BINOP'',''+'',(''VAR'',(loopvar,None,None)),stepval)

                 if self.loops[-1][1] < 0: relop = ''>=''
                 else: relop = ''<=''
                 if not self.releval((''RELOP'',relop,newvalue,finval)):
                      # Loop is done. Jump to the NEXT
                      self.pc = self.loopend[self.pc]
                      self.loops.pop()
                 else:
                      self.assign((loopvar,None,None),newvalue)

            elif op == ''NEXT'':
                 if not self.loops:
                       print("NEXT WITHOUT FOR AT LINE %s" % line)
                       return
 
                 nextvar = instr[1]
                 self.pc = self.loops[-1][0]
                 loopinst = self.prog[self.stat[self.pc]]
                 forvar = loopinst[1]
                 if nextvar != forvar:
                       print("NEXT DOESN''T MATCH FOR AT LINE %s" % line)
                       return
                 continue
            elif op == ''GOSUB'':
                 newline = instr[1]
                 if self.gosub:
                       print("ALREADY IN A SUBROUTINE AT LINE %s" % line)
                       return
                 self.gosub = self.stat[self.pc]
                 self.goto(newline)
                 continue

            elif op == ''RETURN'':
                 if not self.gosub:
                      print("RETURN WITHOUT A GOSUB AT LINE %s" % line)
                      return
                 self.goto(self.gosub)
                 self.gosub = None

            elif op == ''FUNC'':
                 fname = instr[1]
                 pname = instr[2]
                 expr  = instr[3]
                 def eval_func(pvalue,name=pname,self=self,expr=expr):
                      self.assign((pname,None,None),pvalue)
                      return self.eval(expr)
                 self.functions[fname] = eval_func

            elif op == ''DIM'':
                 for vname,x,y in instr[1]:
                     if y == 0:
                          # Single dimension variable
                          self.lists[vname] = [0]*x
                     else:
                          # Double dimension variable
                          temp = [0]*y
                          v = []
                          for i in range(x):
                              v.append(temp[:])
                          self.tables[vname] = v

            self.pc += 1         

    # Utility functions for program listing
    def expr_str(self,expr):
        etype = expr[0]
        if etype == ''NUM'': return str(expr[1])
        elif etype == ''GROUP'': return "(%s)" % self.expr_str(expr[1])
        elif etype == ''UNARY'':
             if expr[1] == ''-'': return "-"+str(expr[2])
        elif etype == ''BINOP'':
             return "%s %s %s" % (self.expr_str(expr[2]),expr[1],self.expr_str(expr[3]))
        elif etype == ''VAR'':
              return self.var_str(expr[1])

    def relexpr_str(self,expr):
         return "%s %s %s" % (self.expr_str(expr[2]),expr[1],self.expr_str(expr[3]))

    def var_str(self,var):
         varname,dim1,dim2 = var
         if not dim1 and not dim2: return varname
         if dim1 and not dim2: return "%s(%s)" % (varname, self.expr_str(dim1))
         return "%s(%s,%s)" % (varname, self.expr_str(dim1),self.expr_str(dim2))

    # Create a program listing
    def list(self):
         stat = list(self.prog)      # Ordered list of all line numbers
         stat.sort()
         for line in stat:
             instr = self.prog[line]
             op = instr[0]
             if op in [''END'',''STOP'',''RETURN'']:
                   print("%s %s" % (line, op))
                   continue
             elif op == ''REM'':
                   print("%s %s" % (line, instr[1]))
             elif op == ''PRINT'':
                   _out = "%s %s " % (line, op)
                   first = 1
                   for p in instr[1]:
                         if not first: _out += ", "
                         if p[0] and p[1]: _out += ''"%s"%s'' % (p[0],self.expr_str(p[1]))
                         elif p[1]: _out += self.expr_str(p[1])
                         else: _out += ''"%s"'' % (p[0],)
                         first = 0
                   if instr[2]: _out += instr[2]
                   print(_out)
             elif op == ''LET'':
                   print("%s LET %s = %s" % (line,self.var_str(instr[1]),self.expr_str(instr[2])))
             elif op == ''READ'':
                   _out = "%s READ " % line
                   first = 1
                   for r in instr[1]:
                         if not first: _out += ","
                         _out += self.var_str(r)
                         first = 0
                   print(_out)
             elif op == ''IF'':
                   print("%s IF %s THEN %d" % (line,self.relexpr_str(instr[1]),instr[2]))
             elif op == ''GOTO'' or op == ''GOSUB'':
                   print("%s %s %s" % (line, op, instr[1]))
             elif op == ''FOR'':
                   _out = "%s FOR %s = %s TO %s" % (line,instr[1],self.expr_str(instr[2]),self.expr_str(instr[3]))
                   if instr[4]: _out += " STEP %s" % (self.expr_str(instr[4]))
                   print(_out)
             elif op == ''NEXT'':
                   print("%s NEXT %s" % (line, instr[1]))
             elif op == ''FUNC'':
                   print("%s DEF %s(%s) = %s" % (line,instr[1],instr[2],self.expr_str(instr[3])))
             elif op == ''DIM'':
                   _out = "%s DIM " % line
                   first = 1
                   for vname,x,y in instr[1]:
                         if not first: _out += ","
                         first = 0
                         if y == 0:
                               _out += "%s(%d)" % (vname,x)
                         else:
                               _out += "%s(%d,%d)" % (vname,x,y)
                         
                   print(_out)
             elif op == ''DATA'':
                   _out = "%s DATA " % line
                   first = 1
                   for v in instr[1]:
                        if not first: _out += ","
                        first = 0
                        _out += v
                   print(_out)

    # Erase the current program
    def new(self):
         self.prog = {}
 
    # Insert statements
    def add_statements(self,prog):
         for line,stat in prog.items():
              self.prog[line] = stat

    # Delete a statement
    def del_line(self,lineno):
         try:
             del self.prog[lineno]
         except KeyError:
             pass

'
]

{ #category : #resources }
PythonParserTests >> source_basparse [
	^ '# An implementation of Dartmouth BASIC (1964)
#

from ply import *
import basiclex

tokens = basiclex.tokens

precedence = (
               (''left'', ''PLUS'',''MINUS''),
               (''left'', ''TIMES'',''DIVIDE''),
               (''left'', ''POWER''),
               (''right'',''UMINUS'')
)

#### A BASIC program is a series of statements.  We represent the program as a
#### dictionary of tuples indexed by line number.

def p_program(p):
    ''''''program : program statement
               | statement''''''

    if len(p) == 2 and p[1]:
       p[0] = { }
       line,stat = p[1]
       p[0][line] = stat
    elif len(p) ==3:
       p[0] = p[1]
       if not p[0]: p[0] = { }
       if p[2]:
           line,stat = p[2]
           p[0][line] = stat

#### This catch-all rule is used for any catastrophic errors.  In this case,
#### we simply return nothing

def p_program_error(p):
    ''''''program : error''''''
    p[0] = None
    p.parser.error = 1

#### Format of all BASIC statements. 

def p_statement(p):
    ''''''statement : INTEGER command NEWLINE''''''
    if isinstance(p[2],str):
        print("%s %s %s" % (p[2],"AT LINE", p[1]))
        p[0] = None
        p.parser.error = 1
    else:
        lineno = int(p[1])
        p[0] = (lineno,p[2])

#### Interactive statements.

def p_statement_interactive(p):
    ''''''statement : RUN NEWLINE
                 | LIST NEWLINE
                 | NEW NEWLINE''''''
    p[0] = (0, (p[1],0))

#### Blank line number
def p_statement_blank(p):
    ''''''statement : INTEGER NEWLINE''''''
    p[0] = (0,(''BLANK'',int(p[1])))

#### Error handling for malformed statements

def p_statement_bad(p):
    ''''''statement : INTEGER error NEWLINE''''''
    print("MALFORMED STATEMENT AT LINE %s" % p[1])
    p[0] = None
    p.parser.error = 1

#### Blank line

def p_statement_newline(p):
    ''''''statement : NEWLINE''''''
    p[0] = None

#### LET statement

def p_command_let(p):
    ''''''command : LET variable EQUALS expr''''''
    p[0] = (''LET'',p[2],p[4])

def p_command_let_bad(p):
    ''''''command : LET variable EQUALS error''''''
    p[0] = "BAD EXPRESSION IN LET"

#### READ statement

def p_command_read(p):
    ''''''command : READ varlist''''''
    p[0] = (''READ'',p[2])

def p_command_read_bad(p):
    ''''''command : READ error''''''
    p[0] = "MALFORMED VARIABLE LIST IN READ"

#### DATA statement

def p_command_data(p):
    ''''''command : DATA numlist''''''
    p[0] = (''DATA'',p[2])

def p_command_data_bad(p):
    ''''''command : DATA error''''''
    p[0] = "MALFORMED NUMBER LIST IN DATA"

#### PRINT statement

def p_command_print(p):
    ''''''command : PRINT plist optend''''''
    p[0] = (''PRINT'',p[2],p[3])

def p_command_print_bad(p):
    ''''''command : PRINT error''''''
    p[0] = "MALFORMED PRINT STATEMENT"

#### Optional ending on PRINT. Either a comma (,) or semicolon (;)

def p_optend(p):
    ''''''optend : COMMA 
              | SEMI
              |''''''
    if len(p)  == 2:
         p[0] = p[1]
    else:
         p[0] = None

#### PRINT statement with no arguments

def p_command_print_empty(p):
    ''''''command : PRINT''''''
    p[0] = (''PRINT'',[],None)

#### GOTO statement

def p_command_goto(p):
    ''''''command : GOTO INTEGER''''''
    p[0] = (''GOTO'',int(p[2]))

def p_command_goto_bad(p):
    ''''''command : GOTO error''''''
    p[0] = "INVALID LINE NUMBER IN GOTO"

#### IF-THEN statement

def p_command_if(p):
    ''''''command : IF relexpr THEN INTEGER''''''
    p[0] = (''IF'',p[2],int(p[4]))

def p_command_if_bad(p):
    ''''''command : IF error THEN INTEGER''''''
    p[0] = "BAD RELATIONAL EXPRESSION"

def p_command_if_bad2(p):
    ''''''command : IF relexpr THEN error''''''
    p[0] = "INVALID LINE NUMBER IN THEN"

#### FOR statement

def p_command_for(p):
    ''''''command : FOR ID EQUALS expr TO expr optstep''''''
    p[0] = (''FOR'',p[2],p[4],p[6],p[7])

def p_command_for_bad_initial(p):
    ''''''command : FOR ID EQUALS error TO expr optstep''''''
    p[0] = "BAD INITIAL VALUE IN FOR STATEMENT"

def p_command_for_bad_final(p):
    ''''''command : FOR ID EQUALS expr TO error optstep''''''
    p[0] = "BAD FINAL VALUE IN FOR STATEMENT"

def p_command_for_bad_step(p):
    ''''''command : FOR ID EQUALS expr TO expr STEP error''''''
    p[0] = "MALFORMED STEP IN FOR STATEMENT"

#### Optional STEP qualifier on FOR statement

def p_optstep(p):
    ''''''optstep : STEP expr
               | empty''''''
    if len(p) == 3:
       p[0] = p[2]
    else:
       p[0] = None

#### NEXT statement
    
def p_command_next(p):
    ''''''command : NEXT ID''''''

    p[0] = (''NEXT'',p[2])

def p_command_next_bad(p):
    ''''''command : NEXT error''''''
    p[0] = "MALFORMED NEXT"

#### END statement

def p_command_end(p):
    ''''''command : END''''''
    p[0] = (''END'',)

#### REM statement

def p_command_rem(p):
    ''''''command : REM''''''
    p[0] = (''REM'',p[1])

#### STOP statement

def p_command_stop(p):
    ''''''command : STOP''''''
    p[0] = (''STOP'',)

#### DEF statement

def p_command_def(p):
    ''''''command : DEF ID LPAREN ID RPAREN EQUALS expr''''''
    p[0] = (''FUNC'',p[2],p[4],p[7])

def p_command_def_bad_rhs(p):
    ''''''command : DEF ID LPAREN ID RPAREN EQUALS error''''''
    p[0] = "BAD EXPRESSION IN DEF STATEMENT"

def p_command_def_bad_arg(p):
    ''''''command : DEF ID LPAREN error RPAREN EQUALS expr''''''
    p[0] = "BAD ARGUMENT IN DEF STATEMENT"

#### GOSUB statement

def p_command_gosub(p):
    ''''''command : GOSUB INTEGER''''''
    p[0] = (''GOSUB'',int(p[2]))

def p_command_gosub_bad(p):
    ''''''command : GOSUB error''''''
    p[0] = "INVALID LINE NUMBER IN GOSUB"

#### RETURN statement

def p_command_return(p):
    ''''''command : RETURN''''''
    p[0] = (''RETURN'',)

#### DIM statement

def p_command_dim(p):
    ''''''command : DIM dimlist''''''
    p[0] = (''DIM'',p[2])

def p_command_dim_bad(p):
    ''''''command : DIM error''''''
    p[0] = "MALFORMED VARIABLE LIST IN DIM"

#### List of variables supplied to DIM statement

def p_dimlist(p):
    ''''''dimlist : dimlist COMMA dimitem
               | dimitem''''''
    if len(p) == 4:
        p[0] = p[1]
        p[0].append(p[3])
    else:
        p[0] = [p[1]]

#### DIM items

def p_dimitem_single(p):
    ''''''dimitem : ID LPAREN INTEGER RPAREN''''''
    p[0] = (p[1],eval(p[3]),0)

def p_dimitem_double(p):
    ''''''dimitem : ID LPAREN INTEGER COMMA INTEGER RPAREN''''''
    p[0] = (p[1],eval(p[3]),eval(p[5]))

#### Arithmetic expressions

def p_expr_binary(p):
    ''''''expr : expr PLUS expr
            | expr MINUS expr
            | expr TIMES expr
            | expr DIVIDE expr
            | expr POWER expr''''''

    p[0] = (''BINOP'',p[2],p[1],p[3])

def p_expr_number(p):
    ''''''expr : INTEGER
            | FLOAT''''''
    p[0] = (''NUM'',eval(p[1]))

def p_expr_variable(p):
    ''''''expr : variable''''''
    p[0] = (''VAR'',p[1])

def p_expr_group(p):
    ''''''expr : LPAREN expr RPAREN''''''
    p[0] = (''GROUP'',p[2])

def p_expr_unary(p):
    ''''''expr : MINUS expr %prec UMINUS''''''
    p[0] = (''UNARY'',''-'',p[2])

#### Relational expressions

def p_relexpr(p):
    ''''''relexpr : expr LT expr
               | expr LE expr
               | expr GT expr
               | expr GE expr
               | expr EQUALS expr
               | expr NE expr''''''
    p[0] = (''RELOP'',p[2],p[1],p[3])

#### Variables

def p_variable(p):
    ''''''variable : ID
              | ID LPAREN expr RPAREN
              | ID LPAREN expr COMMA expr RPAREN''''''
    if len(p) == 2:
       p[0] = (p[1],None,None)
    elif len(p) == 5:
       p[0] = (p[1],p[3],None)
    else:
       p[0] = (p[1],p[3],p[5])

#### Builds a list of variable targets as a Python list

def p_varlist(p):
    ''''''varlist : varlist COMMA variable
               | variable''''''
    if len(p) > 2:
       p[0] = p[1]
       p[0].append(p[3])
    else:
       p[0] = [p[1]]


#### Builds a list of numbers as a Python list

def p_numlist(p):
    ''''''numlist : numlist COMMA number
               | number''''''

    if len(p) > 2:
       p[0] = p[1]
       p[0].append(p[3])
    else:
       p[0] = [p[1]]

#### A number. May be an integer or a float

def p_number(p):
    ''''''number  : INTEGER
               | FLOAT''''''
    p[0] = eval(p[1])

#### A signed number.

def p_number_signed(p):
    ''''''number  : MINUS INTEGER
               | MINUS FLOAT''''''
    p[0] = eval("-"+p[2])

#### List of targets for a print statement
#### Returns a list of tuples (label,expr)

def p_plist(p):
    ''''''plist   : plist COMMA pitem
               | pitem''''''
    if len(p) > 3:
       p[0] = p[1]
       p[0].append(p[3])
    else:
       p[0] = [p[1]]

def p_item_string(p):
    ''''''pitem : STRING''''''
    p[0] = (p[1][1:-1],None)

def p_item_string_expr(p):
    ''''''pitem : STRING expr''''''
    p[0] = (p[1][1:-1],p[2])

def p_item_expr(p):
    ''''''pitem : expr''''''
    p[0] = ("",p[1])

#### Empty
   
def p_empty(p):
    ''''''empty : ''''''

#### Catastrophic error handler
def p_error(p):
    if not p:
        print("SYNTAX ERROR AT EOF")

bparser = yacc.yacc()

def parse(data,debug=0):
    bparser.error = 0
    p = bparser.parse(data,debug=debug)
    if bparser.error: return None
    return p




       
   
  
            






'
]

{ #category : #resources }
PythonParserTests >> source_calclex [
	^ '# -----------------------------------------------------------------------------
# calclex.py
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.lex as lex

tokens = (
    ''NAME'',''NUMBER'',
    ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
    ''LPAREN'',''RPAREN'',
    )

# Tokens

t_PLUS    = r''\+''
t_MINUS   = r''-''
t_TIMES   = r''\*''
t_DIVIDE  = r''/''
t_EQUALS  = r''=''
t_LPAREN  = r''\(''
t_RPAREN  = r''\)''
t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

def t_NUMBER(t):
    r''\d+''
    try:
        t.value = int(t.value)
    except ValueError:
        print("Integer value too large %s" % t.value)
        t.value = 0
    return t

t_ignore = " \t"

def t_newline(t):
    r''\n+''
    t.lineno += t.value.count("\n")
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
# Build the lexer
lex.lex()



'
]

{ #category : #resources }
PythonParserTests >> source_clex [
	^ '# ----------------------------------------------------------------------
# clex.py
#
# A lexer for ANSI C.
# ----------------------------------------------------------------------

import sys
sys.path.insert(0,"../..")

import ply.lex as lex

# Reserved words
reserved = (
    ''AUTO'', ''BREAK'', ''CASE'', ''CHAR'', ''CONST'', ''CONTINUE'', ''DEFAULT'', ''DO'', ''DOUBLE'',
    ''ELSE'', ''ENUM'', ''EXTERN'', ''FLOAT'', ''FOR'', ''GOTO'', ''IF'', ''INT'', ''LONG'', ''REGISTER'',
    ''RETURN'', ''SHORT'', ''SIGNED'', ''SIZEOF'', ''STATIC'', ''STRUCT'', ''SWITCH'', ''TYPEDEF'',
    ''UNION'', ''UNSIGNED'', ''VOID'', ''VOLATILE'', ''WHILE'',
    )

tokens = reserved + (
    # Literals (identifier, integer constant, float constant, string constant, char const)
    ''ID'', ''TYPEID'', ''ICONST'', ''FCONST'', ''SCONST'', ''CCONST'',

    # Operators (+,-,*,/,%,|,&,~,^,<<,>>, ||, &&, !, <, <=, >, >=, ==, !=)
    ''PLUS'', ''MINUS'', ''TIMES'', ''DIVIDE'', ''MOD'',
    ''OR'', ''AND'', ''NOT'', ''XOR'', ''LSHIFT'', ''RSHIFT'',
    ''LOR'', ''LAND'', ''LNOT'',
    ''LT'', ''LE'', ''GT'', ''GE'', ''EQ'', ''NE'',
    
    # Assignment (=, *=, /=, %=, +=, -=, <<=, >>=, &=, ^=, |=)
    ''EQUALS'', ''TIMESEQUAL'', ''DIVEQUAL'', ''MODEQUAL'', ''PLUSEQUAL'', ''MINUSEQUAL'',
    ''LSHIFTEQUAL'',''RSHIFTEQUAL'', ''ANDEQUAL'', ''XOREQUAL'', ''OREQUAL'',

    # Increment/decrement (++,--)
    ''PLUSPLUS'', ''MINUSMINUS'',

    # Structure dereference (->)
    ''ARROW'',

    # Conditional operator (?)
    ''CONDOP'',
    
    # Delimeters ( ) [ ] { } , . ; :
    ''LPAREN'', ''RPAREN'',
    ''LBRACKET'', ''RBRACKET'',
    ''LBRACE'', ''RBRACE'',
    ''COMMA'', ''PERIOD'', ''SEMI'', ''COLON'',

    # Ellipsis (...)
    ''ELLIPSIS'',
    )

# Completely ignored characters
t_ignore           = '' \t\x0c''

# Newlines
def t_NEWLINE(t):
    r''\n+''
    t.lexer.lineno += t.value.count("\n")
    
# Operators
t_PLUS             = r''\+''
t_MINUS            = r''-''
t_TIMES            = r''\*''
t_DIVIDE           = r''/''
t_MOD              = r''%''
t_OR               = r''\|''
t_AND              = r''&''
t_NOT              = r''~''
t_XOR              = r''\^''
t_LSHIFT           = r''<<''
t_RSHIFT           = r''>>''
t_LOR              = r''\|\|''
t_LAND             = r''&&''
t_LNOT             = r''!''
t_LT               = r''<''
t_GT               = r''>''
t_LE               = r''<=''
t_GE               = r''>=''
t_EQ               = r''==''
t_NE               = r''!=''

# Assignment operators

t_EQUALS           = r''=''
t_TIMESEQUAL       = r''\*=''
t_DIVEQUAL         = r''/=''
t_MODEQUAL         = r''%=''
t_PLUSEQUAL        = r''\+=''
t_MINUSEQUAL       = r''-=''
t_LSHIFTEQUAL      = r''<<=''
t_RSHIFTEQUAL      = r''>>=''
t_ANDEQUAL         = r''&=''
t_OREQUAL          = r''\|=''
t_XOREQUAL         = r''^=''

# Increment/decrement
t_PLUSPLUS         = r''\+\+''
t_MINUSMINUS       = r''--''

# ->
t_ARROW            = r''->''

# ?
t_CONDOP           = r''\?''

# Delimeters
t_LPAREN           = r''\(''
t_RPAREN           = r''\)''
t_LBRACKET         = r''\[''
t_RBRACKET         = r''\]''
t_LBRACE           = r''\{''
t_RBRACE           = r''\}''
t_COMMA            = r'',''
t_PERIOD           = r''\.''
t_SEMI             = r'';''
t_COLON            = r'':''
t_ELLIPSIS         = r''\.\.\.''

# Identifiers and reserved words

reserved_map = { }
for r in reserved:
    reserved_map[r.lower()] = r

def t_ID(t):
    r''[A-Za-z_][\w_]*''
    t.type = reserved_map.get(t.value,"ID")
    return t

# Integer literal
t_ICONST = r''\d+([uU]|[lL]|[uU][lL]|[lL][uU])?''

# Floating literal
t_FCONST = r''((\d+)(\.\d+)(e(\+|-)?(\d+))? | (\d+)e(\+|-)?(\d+))([lL]|[fF])?''

# String literal
t_SCONST = r''\"([^\\\n]|(\\.))*?\"''

# Character constant ''c'' or L''c''
t_CCONST = r''(L)?\''([^\\\n]|(\\.))*?\''''

# Comments
def t_comment(t):
    r''/\*(.|\n)*?\*/''
    t.lexer.lineno += t.value.count(''\n'')

# Preprocessor directive (ignored)
def t_preprocessor(t):
    r''\#(.)*?\n''
    t.lexer.lineno += 1
    
def t_error(t):
    print("Illegal character %s" % repr(t.value[0]))
    t.lexer.skip(1)
    
lexer = lex.lex(optimize=1)
if __name__ == "__main__":
    lex.runmain(lexer)

    



'
]

{ #category : #resources }
PythonParserTests >> source_cparse [
	^ '# -----------------------------------------------------------------------------
# cparse.py
#
# Simple parser for ANSI C.  Based on the grammar in K&R, 2nd Ed.
# -----------------------------------------------------------------------------

import sys
import clex
import ply.yacc as yacc

# Get the token map
tokens = clex.tokens

# translation-unit:

def p_translation_unit_1(t):
    ''translation_unit : external_declaration''
    pass

def p_translation_unit_2(t):
    ''translation_unit : translation_unit external_declaration''
    pass

# external-declaration:

def p_external_declaration_1(t):
    ''external_declaration : function_definition''
    pass

def p_external_declaration_2(t):
    ''external_declaration : declaration''
    pass

# function-definition:

def p_function_definition_1(t):
    ''function_definition : declaration_specifiers declarator declaration_list compound_statement''
    pass

def p_function_definition_2(t):
    ''function_definition : declarator declaration_list compound_statement''
    pass

def p_function_definition_3(t):
    ''function_definition : declarator compound_statement''
    pass

def p_function_definition_4(t):
    ''function_definition : declaration_specifiers declarator compound_statement''
    pass

# declaration:

def p_declaration_1(t):
    ''declaration : declaration_specifiers init_declarator_list SEMI''
    pass

def p_declaration_2(t):
    ''declaration : declaration_specifiers SEMI''
    pass

# declaration-list:

def p_declaration_list_1(t):
    ''declaration_list : declaration''
    pass

def p_declaration_list_2(t):
    ''declaration_list : declaration_list declaration ''
    pass

# declaration-specifiers
def p_declaration_specifiers_1(t):
    ''declaration_specifiers : storage_class_specifier declaration_specifiers''
    pass

def p_declaration_specifiers_2(t):
    ''declaration_specifiers : type_specifier declaration_specifiers''
    pass

def p_declaration_specifiers_3(t):
    ''declaration_specifiers : type_qualifier declaration_specifiers''
    pass

def p_declaration_specifiers_4(t):
    ''declaration_specifiers : storage_class_specifier''
    pass

def p_declaration_specifiers_5(t):
    ''declaration_specifiers : type_specifier''
    pass

def p_declaration_specifiers_6(t):
    ''declaration_specifiers : type_qualifier''
    pass

# storage-class-specifier
def p_storage_class_specifier(t):
    ''''''storage_class_specifier : AUTO
                               | REGISTER
                               | STATIC
                               | EXTERN
                               | TYPEDEF
                               ''''''
    pass

# type-specifier:
def p_type_specifier(t):
    ''''''type_specifier : VOID
                      | CHAR
                      | SHORT
                      | INT
                      | LONG
                      | FLOAT
                      | DOUBLE
                      | SIGNED
                      | UNSIGNED
                      | struct_or_union_specifier
                      | enum_specifier
                      | TYPEID
                      ''''''
    pass

# type-qualifier:
def p_type_qualifier(t):
    ''''''type_qualifier : CONST
                      | VOLATILE''''''
    pass

# struct-or-union-specifier

def p_struct_or_union_specifier_1(t):
    ''struct_or_union_specifier : struct_or_union ID LBRACE struct_declaration_list RBRACE''
    pass

def p_struct_or_union_specifier_2(t):
    ''struct_or_union_specifier : struct_or_union LBRACE struct_declaration_list RBRACE''
    pass

def p_struct_or_union_specifier_3(t):
    ''struct_or_union_specifier : struct_or_union ID''
    pass

# struct-or-union:
def p_struct_or_union(t):
    ''''''struct_or_union : STRUCT
                       | UNION
                       ''''''
    pass

# struct-declaration-list:

def p_struct_declaration_list_1(t):
    ''struct_declaration_list : struct_declaration''
    pass

def p_struct_declaration_list_2(t):
    ''struct_declaration_list : struct_declaration_list struct_declaration''
    pass

# init-declarator-list:

def p_init_declarator_list_1(t):
    ''init_declarator_list : init_declarator''
    pass

def p_init_declarator_list_2(t):
    ''init_declarator_list : init_declarator_list COMMA init_declarator''
    pass

# init-declarator

def p_init_declarator_1(t):
    ''init_declarator : declarator''
    pass

def p_init_declarator_2(t):
    ''init_declarator : declarator EQUALS initializer''
    pass

# struct-declaration:

def p_struct_declaration(t):
    ''struct_declaration : specifier_qualifier_list struct_declarator_list SEMI''
    pass

# specifier-qualifier-list:

def p_specifier_qualifier_list_1(t):
    ''specifier_qualifier_list : type_specifier specifier_qualifier_list''
    pass

def p_specifier_qualifier_list_2(t):
    ''specifier_qualifier_list : type_specifier''
    pass

def p_specifier_qualifier_list_3(t):
    ''specifier_qualifier_list : type_qualifier specifier_qualifier_list''
    pass

def p_specifier_qualifier_list_4(t):
    ''specifier_qualifier_list : type_qualifier''
    pass

# struct-declarator-list:

def p_struct_declarator_list_1(t):
    ''struct_declarator_list : struct_declarator''
    pass

def p_struct_declarator_list_2(t):
    ''struct_declarator_list : struct_declarator_list COMMA struct_declarator''
    pass

# struct-declarator:

def p_struct_declarator_1(t):
    ''struct_declarator : declarator''
    pass

def p_struct_declarator_2(t):
    ''struct_declarator : declarator COLON constant_expression''
    pass

def p_struct_declarator_3(t):
    ''struct_declarator : COLON constant_expression''
    pass

# enum-specifier:

def p_enum_specifier_1(t):
    ''enum_specifier : ENUM ID LBRACE enumerator_list RBRACE''
    pass

def p_enum_specifier_2(t):
    ''enum_specifier : ENUM LBRACE enumerator_list RBRACE''
    pass

def p_enum_specifier_3(t):
    ''enum_specifier : ENUM ID''
    pass

# enumerator_list:
def p_enumerator_list_1(t):
    ''enumerator_list : enumerator''
    pass

def p_enumerator_list_2(t):
    ''enumerator_list : enumerator_list COMMA enumerator''
    pass

# enumerator:
def p_enumerator_1(t):
    ''enumerator : ID''
    pass

def p_enumerator_2(t):
    ''enumerator : ID EQUALS constant_expression''
    pass

# declarator:

def p_declarator_1(t):
    ''declarator : pointer direct_declarator''
    pass

def p_declarator_2(t):
    ''declarator : direct_declarator''
    pass

# direct-declarator:

def p_direct_declarator_1(t):
    ''direct_declarator : ID''
    pass

def p_direct_declarator_2(t):
    ''direct_declarator : LPAREN declarator RPAREN''
    pass

def p_direct_declarator_3(t):
    ''direct_declarator : direct_declarator LBRACKET constant_expression_opt RBRACKET''
    pass

def p_direct_declarator_4(t):
    ''direct_declarator : direct_declarator LPAREN parameter_type_list RPAREN ''
    pass

def p_direct_declarator_5(t):
    ''direct_declarator : direct_declarator LPAREN identifier_list RPAREN ''
    pass

def p_direct_declarator_6(t):
    ''direct_declarator : direct_declarator LPAREN RPAREN ''
    pass

# pointer:
def p_pointer_1(t):
    ''pointer : TIMES type_qualifier_list''
    pass

def p_pointer_2(t):
    ''pointer : TIMES''
    pass

def p_pointer_3(t):
    ''pointer : TIMES type_qualifier_list pointer''
    pass

def p_pointer_4(t):
    ''pointer : TIMES pointer''
    pass

# type-qualifier-list:

def p_type_qualifier_list_1(t):
    ''type_qualifier_list : type_qualifier''
    pass

def p_type_qualifier_list_2(t):
    ''type_qualifier_list : type_qualifier_list type_qualifier''
    pass

# parameter-type-list:

def p_parameter_type_list_1(t):
    ''parameter_type_list : parameter_list''
    pass

def p_parameter_type_list_2(t):
    ''parameter_type_list : parameter_list COMMA ELLIPSIS''
    pass

# parameter-list:

def p_parameter_list_1(t):
    ''parameter_list : parameter_declaration''
    pass

def p_parameter_list_2(t):
    ''parameter_list : parameter_list COMMA parameter_declaration''
    pass

# parameter-declaration:
def p_parameter_declaration_1(t):
    ''parameter_declaration : declaration_specifiers declarator''
    pass

def p_parameter_declaration_2(t):
    ''parameter_declaration : declaration_specifiers abstract_declarator_opt''
    pass

# identifier-list:
def p_identifier_list_1(t):
    ''identifier_list : ID''
    pass

def p_identifier_list_2(t):
    ''identifier_list : identifier_list COMMA ID''
    pass

# initializer:

def p_initializer_1(t):
    ''initializer : assignment_expression''
    pass

def p_initializer_2(t):
    ''''''initializer : LBRACE initializer_list RBRACE
                   | LBRACE initializer_list COMMA RBRACE''''''
    pass

# initializer-list:

def p_initializer_list_1(t):
    ''initializer_list : initializer''
    pass

def p_initializer_list_2(t):
    ''initializer_list : initializer_list COMMA initializer''
    pass

# type-name:

def p_type_name(t):
    ''type_name : specifier_qualifier_list abstract_declarator_opt''
    pass

def p_abstract_declarator_opt_1(t):
    ''abstract_declarator_opt : empty''
    pass

def p_abstract_declarator_opt_2(t):
    ''abstract_declarator_opt : abstract_declarator''
    pass

# abstract-declarator:

def p_abstract_declarator_1(t):
    ''abstract_declarator : pointer ''
    pass

def p_abstract_declarator_2(t):
    ''abstract_declarator : pointer direct_abstract_declarator''
    pass

def p_abstract_declarator_3(t):
    ''abstract_declarator : direct_abstract_declarator''
    pass

# direct-abstract-declarator:

def p_direct_abstract_declarator_1(t):
    ''direct_abstract_declarator : LPAREN abstract_declarator RPAREN''
    pass

def p_direct_abstract_declarator_2(t):
    ''direct_abstract_declarator : direct_abstract_declarator LBRACKET constant_expression_opt RBRACKET''
    pass

def p_direct_abstract_declarator_3(t):
    ''direct_abstract_declarator : LBRACKET constant_expression_opt RBRACKET''
    pass

def p_direct_abstract_declarator_4(t):
    ''direct_abstract_declarator : direct_abstract_declarator LPAREN parameter_type_list_opt RPAREN''
    pass

def p_direct_abstract_declarator_5(t):
    ''direct_abstract_declarator : LPAREN parameter_type_list_opt RPAREN''
    pass

# Optional fields in abstract declarators

def p_constant_expression_opt_1(t):
    ''constant_expression_opt : empty''
    pass

def p_constant_expression_opt_2(t):
    ''constant_expression_opt : constant_expression''
    pass

def p_parameter_type_list_opt_1(t):
    ''parameter_type_list_opt : empty''
    pass

def p_parameter_type_list_opt_2(t):
    ''parameter_type_list_opt : parameter_type_list''
    pass

# statement:

def p_statement(t):
    ''''''
    statement : labeled_statement
              | expression_statement
              | compound_statement
              | selection_statement
              | iteration_statement
              | jump_statement
              ''''''
    pass

# labeled-statement:

def p_labeled_statement_1(t):
    ''labeled_statement : ID COLON statement''
    pass

def p_labeled_statement_2(t):
    ''labeled_statement : CASE constant_expression COLON statement''
    pass

def p_labeled_statement_3(t):
    ''labeled_statement : DEFAULT COLON statement''
    pass

# expression-statement:
def p_expression_statement(t):
    ''expression_statement : expression_opt SEMI''
    pass

# compound-statement:

def p_compound_statement_1(t):
    ''compound_statement : LBRACE declaration_list statement_list RBRACE''
    pass

def p_compound_statement_2(t):
    ''compound_statement : LBRACE statement_list RBRACE''
    pass

def p_compound_statement_3(t):
    ''compound_statement : LBRACE declaration_list RBRACE''
    pass

def p_compound_statement_4(t):
    ''compound_statement : LBRACE RBRACE''
    pass

# statement-list:

def p_statement_list_1(t):
    ''statement_list : statement''
    pass

def p_statement_list_2(t):
    ''statement_list : statement_list statement''
    pass

# selection-statement

def p_selection_statement_1(t):
    ''selection_statement : IF LPAREN expression RPAREN statement''
    pass

def p_selection_statement_2(t):
    ''selection_statement : IF LPAREN expression RPAREN statement ELSE statement ''
    pass

def p_selection_statement_3(t):
    ''selection_statement : SWITCH LPAREN expression RPAREN statement ''
    pass

# iteration_statement:

def p_iteration_statement_1(t):
    ''iteration_statement : WHILE LPAREN expression RPAREN statement''
    pass

def p_iteration_statement_2(t):
    ''iteration_statement : FOR LPAREN expression_opt SEMI expression_opt SEMI expression_opt RPAREN statement ''
    pass

def p_iteration_statement_3(t):
    ''iteration_statement : DO statement WHILE LPAREN expression RPAREN SEMI''
    pass

# jump_statement:

def p_jump_statement_1(t):
    ''jump_statement : GOTO ID SEMI''
    pass

def p_jump_statement_2(t):
    ''jump_statement : CONTINUE SEMI''
    pass

def p_jump_statement_3(t):
    ''jump_statement : BREAK SEMI''
    pass

def p_jump_statement_4(t):
    ''jump_statement : RETURN expression_opt SEMI''
    pass

def p_expression_opt_1(t):
    ''expression_opt : empty''
    pass

def p_expression_opt_2(t):
    ''expression_opt : expression''
    pass

# expression:
def p_expression_1(t):
    ''expression : assignment_expression''
    pass

def p_expression_2(t):
    ''expression : expression COMMA assignment_expression''
    pass

# assigment_expression:
def p_assignment_expression_1(t):
    ''assignment_expression : conditional_expression''
    pass

def p_assignment_expression_2(t):
    ''assignment_expression : unary_expression assignment_operator assignment_expression''
    pass

# assignment_operator:
def p_assignment_operator(t):
    ''''''
    assignment_operator : EQUALS
                        | TIMESEQUAL
                        | DIVEQUAL
                        | MODEQUAL
                        | PLUSEQUAL
                        | MINUSEQUAL
                        | LSHIFTEQUAL
                        | RSHIFTEQUAL
                        | ANDEQUAL
                        | OREQUAL
                        | XOREQUAL
                        ''''''
    pass

# conditional-expression
def p_conditional_expression_1(t):
    ''conditional_expression : logical_or_expression''
    pass

def p_conditional_expression_2(t):
    ''conditional_expression : logical_or_expression CONDOP expression COLON conditional_expression ''
    pass

# constant-expression

def p_constant_expression(t):
    ''constant_expression : conditional_expression''
    pass

# logical-or-expression

def p_logical_or_expression_1(t):
    ''logical_or_expression : logical_and_expression''
    pass

def p_logical_or_expression_2(t):
    ''logical_or_expression : logical_or_expression LOR logical_and_expression''
    pass

# logical-and-expression

def p_logical_and_expression_1(t):
    ''logical_and_expression : inclusive_or_expression''
    pass

def p_logical_and_expression_2(t):
    ''logical_and_expression : logical_and_expression LAND inclusive_or_expression''
    pass

# inclusive-or-expression:

def p_inclusive_or_expression_1(t):
    ''inclusive_or_expression : exclusive_or_expression''
    pass

def p_inclusive_or_expression_2(t):
    ''inclusive_or_expression : inclusive_or_expression OR exclusive_or_expression''
    pass

# exclusive-or-expression:

def p_exclusive_or_expression_1(t):
    ''exclusive_or_expression :  and_expression''
    pass

def p_exclusive_or_expression_2(t):
    ''exclusive_or_expression :  exclusive_or_expression XOR and_expression''
    pass

# AND-expression

def p_and_expression_1(t):
    ''and_expression : equality_expression''
    pass

def p_and_expression_2(t):
    ''and_expression : and_expression AND equality_expression''
    pass


# equality-expression:
def p_equality_expression_1(t):
    ''equality_expression : relational_expression''
    pass

def p_equality_expression_2(t):
    ''equality_expression : equality_expression EQ relational_expression''
    pass

def p_equality_expression_3(t):
    ''equality_expression : equality_expression NE relational_expression''
    pass


# relational-expression:
def p_relational_expression_1(t):
    ''relational_expression : shift_expression''
    pass

def p_relational_expression_2(t):
    ''relational_expression : relational_expression LT shift_expression''
    pass

def p_relational_expression_3(t):
    ''relational_expression : relational_expression GT shift_expression''
    pass

def p_relational_expression_4(t):
    ''relational_expression : relational_expression LE shift_expression''
    pass

def p_relational_expression_5(t):
    ''relational_expression : relational_expression GE shift_expression''
    pass

# shift-expression

def p_shift_expression_1(t):
    ''shift_expression : additive_expression''
    pass

def p_shift_expression_2(t):
    ''shift_expression : shift_expression LSHIFT additive_expression''
    pass

def p_shift_expression_3(t):
    ''shift_expression : shift_expression RSHIFT additive_expression''
    pass

# additive-expression

def p_additive_expression_1(t):
    ''additive_expression : multiplicative_expression''
    pass

def p_additive_expression_2(t):
    ''additive_expression : additive_expression PLUS multiplicative_expression''
    pass

def p_additive_expression_3(t):
    ''additive_expression : additive_expression MINUS multiplicative_expression''
    pass

# multiplicative-expression

def p_multiplicative_expression_1(t):
    ''multiplicative_expression : cast_expression''
    pass

def p_multiplicative_expression_2(t):
    ''multiplicative_expression : multiplicative_expression TIMES cast_expression''
    pass

def p_multiplicative_expression_3(t):
    ''multiplicative_expression : multiplicative_expression DIVIDE cast_expression''
    pass

def p_multiplicative_expression_4(t):
    ''multiplicative_expression : multiplicative_expression MOD cast_expression''
    pass

# cast-expression:

def p_cast_expression_1(t):
    ''cast_expression : unary_expression''
    pass

def p_cast_expression_2(t):
    ''cast_expression : LPAREN type_name RPAREN cast_expression''
    pass

# unary-expression:
def p_unary_expression_1(t):
    ''unary_expression : postfix_expression''
    pass

def p_unary_expression_2(t):
    ''unary_expression : PLUSPLUS unary_expression''
    pass

def p_unary_expression_3(t):
    ''unary_expression : MINUSMINUS unary_expression''
    pass

def p_unary_expression_4(t):
    ''unary_expression : unary_operator cast_expression''
    pass

def p_unary_expression_5(t):
    ''unary_expression : SIZEOF unary_expression''
    pass

def p_unary_expression_6(t):
    ''unary_expression : SIZEOF LPAREN type_name RPAREN''
    pass
    
#unary-operator
def p_unary_operator(t):
    ''''''unary_operator : AND
                    | TIMES
                    | PLUS 
                    | MINUS
                    | NOT
                    | LNOT ''''''
    pass

# postfix-expression:
def p_postfix_expression_1(t):
    ''postfix_expression : primary_expression''
    pass

def p_postfix_expression_2(t):
    ''postfix_expression : postfix_expression LBRACKET expression RBRACKET''
    pass

def p_postfix_expression_3(t):
    ''postfix_expression : postfix_expression LPAREN argument_expression_list RPAREN''
    pass

def p_postfix_expression_4(t):
    ''postfix_expression : postfix_expression LPAREN RPAREN''
    pass

def p_postfix_expression_5(t):
    ''postfix_expression : postfix_expression PERIOD ID''
    pass

def p_postfix_expression_6(t):
    ''postfix_expression : postfix_expression ARROW ID''
    pass

def p_postfix_expression_7(t):
    ''postfix_expression : postfix_expression PLUSPLUS''
    pass

def p_postfix_expression_8(t):
    ''postfix_expression : postfix_expression MINUSMINUS''
    pass

# primary-expression:
def p_primary_expression(t):
    ''''''primary_expression :  ID
                        |  constant
                        |  SCONST
                        |  LPAREN expression RPAREN''''''
    pass

# argument-expression-list:
def p_argument_expression_list(t):
    ''''''argument_expression_list :  assignment_expression
                              |  argument_expression_list COMMA assignment_expression''''''
    pass

# constant:
def p_constant(t): 
   ''''''constant : ICONST
              | FCONST
              | CCONST''''''
   pass


def p_empty(t):
    ''empty : ''
    pass

def p_error(t):
    print("Whoa. We''re hosed")

import profile
# Build the grammar

yacc.yacc(method=''LALR'')

#profile.run("yacc.yacc(method=''LALR'')")




'
]

{ #category : #resources }
PythonParserTests >> source_ctokens [
	^ '# ----------------------------------------------------------------------
# ctokens.py
#
# Token specifications for symbols in ANSI C and C++.  This file is
# meant to be used as a library in other tokenizers.
# ----------------------------------------------------------------------

# Reserved words

tokens = [
    # Literals (identifier, integer constant, float constant, string constant, char const)
    ''ID'', ''TYPEID'', ''ICONST'', ''FCONST'', ''SCONST'', ''CCONST'',

    # Operators (+,-,*,/,%,|,&,~,^,<<,>>, ||, &&, !, <, <=, >, >=, ==, !=)
    ''PLUS'', ''MINUS'', ''TIMES'', ''DIVIDE'', ''MOD'',
    ''OR'', ''AND'', ''NOT'', ''XOR'', ''LSHIFT'', ''RSHIFT'',
    ''LOR'', ''LAND'', ''LNOT'',
    ''LT'', ''LE'', ''GT'', ''GE'', ''EQ'', ''NE'',
    
    # Assignment (=, *=, /=, %=, +=, -=, <<=, >>=, &=, ^=, |=)
    ''EQUALS'', ''TIMESEQUAL'', ''DIVEQUAL'', ''MODEQUAL'', ''PLUSEQUAL'', ''MINUSEQUAL'',
    ''LSHIFTEQUAL'',''RSHIFTEQUAL'', ''ANDEQUAL'', ''XOREQUAL'', ''OREQUAL'',

    # Increment/decrement (++,--)
    ''PLUSPLUS'', ''MINUSMINUS'',

    # Structure dereference (->)
    ''ARROW'',

    # Ternary operator (?)
    ''TERNARY'',
    
    # Delimeters ( ) [ ] { } , . ; :
    ''LPAREN'', ''RPAREN'',
    ''LBRACKET'', ''RBRACKET'',
    ''LBRACE'', ''RBRACE'',
    ''COMMA'', ''PERIOD'', ''SEMI'', ''COLON'',

    # Ellipsis (...)
    ''ELLIPSIS'',
]
    
# Operators
t_PLUS             = r''\+''
t_MINUS            = r''-''
t_TIMES            = r''\*''
t_DIVIDE           = r''/''
t_MODULO           = r''%''
t_OR               = r''\|''
t_AND              = r''&''
t_NOT              = r''~''
t_XOR              = r''\^''
t_LSHIFT           = r''<<''
t_RSHIFT           = r''>>''
t_LOR              = r''\|\|''
t_LAND             = r''&&''
t_LNOT             = r''!''
t_LT               = r''<''
t_GT               = r''>''
t_LE               = r''<=''
t_GE               = r''>=''
t_EQ               = r''==''
t_NE               = r''!=''

# Assignment operators

t_EQUALS           = r''=''
t_TIMESEQUAL       = r''\*=''
t_DIVEQUAL         = r''/=''
t_MODEQUAL         = r''%=''
t_PLUSEQUAL        = r''\+=''
t_MINUSEQUAL       = r''-=''
t_LSHIFTEQUAL      = r''<<=''
t_RSHIFTEQUAL      = r''>>=''
t_ANDEQUAL         = r''&=''
t_OREQUAL          = r''\|=''
t_XOREQUAL         = r''^=''

# Increment/decrement
t_INCREMENT        = r''\+\+''
t_DECREMENT        = r''--''

# ->
t_ARROW            = r''->''

# ?
t_TERNARY          = r''\?''

# Delimeters
t_LPAREN           = r''\(''
t_RPAREN           = r''\)''
t_LBRACKET         = r''\[''
t_RBRACKET         = r''\]''
t_LBRACE           = r''\{''
t_RBRACE           = r''\}''
t_COMMA            = r'',''
t_PERIOD           = r''\.''
t_SEMI             = r'';''
t_COLON            = r'':''
t_ELLIPSIS         = r''\.\.\.''

# Identifiers
t_ID = r''[A-Za-z_][A-Za-z0-9_]*''

# Integer literal
t_INTEGER = r''\d+([uU]|[lL]|[uU][lL]|[lL][uU])?''

# Floating literal
t_FLOAT = r''((\d+)(\.\d+)(e(\+|-)?(\d+))? | (\d+)e(\+|-)?(\d+))([lL]|[fF])?''

# String literal
t_STRING = r''\"([^\\\n]|(\\.))*?\"''

# Character constant ''c'' or L''c''
t_CHARACTER = r''(L)?\''([^\\\n]|(\\.))*?\''''

# Comment (C-Style)
def t_COMMENT(t):
    r''/\*(.|\n)*?\*/''
    t.lexer.lineno += t.value.count(''\n'')
    return t

# Comment (C++-Style)
def t_CPPCOMMENT(t):
    r''//.*\n''
    t.lexer.lineno += 1
    return t


    



'
]

{ #category : #resources }
PythonParserTests >> source_hedit [
	^ '# -----------------------------------------------------------------------------
# hedit.py
#
# Paring of Fortran H Edit descriptions (Contributed by Pearu Peterson)
#
# These tokens can''t be easily tokenized because they are of the following
# form:
#
#   nHc1...cn
#
# where n is a positive integer and c1 ... cn are characters.
#
# This example shows how to modify the state of the lexer to parse
# such tokens
# -----------------------------------------------------------------------------

import sys
sys.path.insert(0,"../..")


tokens = (
    ''H_EDIT_DESCRIPTOR'',
    )

# Tokens
t_ignore = " \t\n"

def t_H_EDIT_DESCRIPTOR(t):
    r"\d+H.*"                     # This grabs all of the remaining text
    i = t.value.index(''H'')
    n = eval(t.value[:i])
    
    # Adjust the tokenizing position
    t.lexer.lexpos -= len(t.value) - (i+1+n)
    
    t.value = t.value[i+1:i+1+n]
    return t                                  
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
# Build the lexer
import ply.lex as lex
lex.lex()
lex.runmain()


'
]

{ #category : #resources }
PythonParserTests >> source_lex [
	^ '# -----------------------------------------------------------------------------
# ply: lex.py
#
# Copyright (C) 2001-2011,
# David M. Beazley (Dabeaz LLC)
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# * Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.  
# * Redistributions in binary form must reproduce the above copyright notice, 
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.  
# * Neither the name of the David Beazley or Dabeaz LLC may be used to
#   endorse or promote products derived from this software without
#  specific prior written permission. 
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# -----------------------------------------------------------------------------

__version__    = "3.4"
__tabversion__ = "3.2"       # Version of table file used

import re, sys, types, copy, os

# This tuple contains known string types
try:
    # Python 2.6
    StringTypes = (types.StringType, types.UnicodeType)
except AttributeError:
    # Python 3.0
    StringTypes = (str, bytes)

# Extract the code attribute of a function. Different implementations
# are for Python 2/3 compatibility.

if sys.version_info[0] < 3:
    def func_code(f):
        return f.func_code
else:
    def func_code(f):
        return f.__code__

# This regular expression is used to match valid token names
_is_identifier = re.compile(r''^[a-zA-Z0-9_]+$'')

# Exception thrown when invalid token encountered and no default error
# handler is defined.

class LexError(Exception):
    def __init__(self,message,s):
         self.args = (message,)
         self.text = s

# Token class.  This class is used to represent the tokens produced.
class LexToken(object):
    def __str__(self):
        return "LexToken(%s,%r,%d,%d)" % (self.type,self.value,self.lineno,self.lexpos)
    def __repr__(self):
        return str(self)

# This object is a stand-in for a logging object created by the 
# logging module.  

class PlyLogger(object):
    def __init__(self,f):
        self.f = f
    def critical(self,msg,*args,**kwargs):
        self.f.write((msg % args) + "\n")

    def warning(self,msg,*args,**kwargs):
        self.f.write("WARNING: "+ (msg % args) + "\n")

    def error(self,msg,*args,**kwargs):
        self.f.write("ERROR: " + (msg % args) + "\n")

    info = critical
    debug = critical

# Null logger is used when no output is generated. Does nothing.
class NullLogger(object):
    def __getattribute__(self,name):
        return self
    def __call__(self,*args,**kwargs):
        return self

# -----------------------------------------------------------------------------
#                        === Lexing Engine ===
#
# The following Lexer class implements the lexer runtime.   There are only
# a few public methods and attributes:
#
#    input()          -  Store a new string in the lexer
#    token()          -  Get the next token
#    clone()          -  Clone the lexer
#
#    lineno           -  Current line number
#    lexpos           -  Current position in the input string
# -----------------------------------------------------------------------------

class Lexer:
    def __init__(self):
        self.lexre = None             # Master regular expression. This is a list of
                                      # tuples (re,findex) where re is a compiled
                                      # regular expression and findex is a list
                                      # mapping regex group numbers to rules
        self.lexretext = None         # Current regular expression strings
        self.lexstatere = {}          # Dictionary mapping lexer states to master regexs
        self.lexstateretext = {}      # Dictionary mapping lexer states to regex strings
        self.lexstaterenames = {}     # Dictionary mapping lexer states to symbol names
        self.lexstate = "INITIAL"     # Current lexer state
        self.lexstatestack = []       # Stack of lexer states
        self.lexstateinfo = None      # State information
        self.lexstateignore = {}      # Dictionary of ignored characters for each state
        self.lexstateerrorf = {}      # Dictionary of error functions for each state
        self.lexreflags = 0           # Optional re compile flags
        self.lexdata = None           # Actual input data (as a string)
        self.lexpos = 0               # Current position in input text
        self.lexlen = 0               # Length of the input text
        self.lexerrorf = None         # Error rule (if any)
        self.lextokens = None         # List of valid tokens
        self.lexignore = ""           # Ignored characters
        self.lexliterals = ""         # Literal characters that can be passed through
        self.lexmodule = None         # Module
        self.lineno = 1               # Current line number
        self.lexoptimize = 0          # Optimized mode

    def clone(self,object=None):
        c = copy.copy(self)

        # If the object parameter has been supplied, it means we are attaching the
        # lexer to a new object.  In this case, we have to rebind all methods in
        # the lexstatere and lexstateerrorf tables.

        if object:
            newtab = { }
            for key, ritem in self.lexstatere.items():
                newre = []
                for cre, findex in ritem:
                     newfindex = []
                     for f in findex:
                         if not f or not f[0]:
                             newfindex.append(f)
                             continue
                         newfindex.append((getattr(object,f[0].__name__),f[1]))
                newre.append((cre,newfindex))
                newtab[key] = newre
            c.lexstatere = newtab
            c.lexstateerrorf = { }
            for key, ef in self.lexstateerrorf.items():
                c.lexstateerrorf[key] = getattr(object,ef.__name__)
            c.lexmodule = object
        return c

    # ------------------------------------------------------------
    # writetab() - Write lexer information to a table file
    # ------------------------------------------------------------
    def writetab(self,tabfile,outputdir=""):
        if isinstance(tabfile,types.ModuleType):
            return
        basetabfilename = tabfile.split(".")[-1]
        filename = os.path.join(outputdir,basetabfilename)+".py"
        tf = open(filename,"w")
        tf.write("# %s.py. This file automatically created by PLY (version %s). Don''t edit!\n" % (tabfile,__version__))
        tf.write("_tabversion   = %s\n" % repr(__version__))
        tf.write("_lextokens    = %s\n" % repr(self.lextokens))
        tf.write("_lexreflags   = %s\n" % repr(self.lexreflags))
        tf.write("_lexliterals  = %s\n" % repr(self.lexliterals))
        tf.write("_lexstateinfo = %s\n" % repr(self.lexstateinfo))

        tabre = { }
        # Collect all functions in the initial state
        initial = self.lexstatere["INITIAL"]
        initialfuncs = []
        for part in initial:
            for f in part[1]:
                if f and f[0]:
                    initialfuncs.append(f)

        for key, lre in self.lexstatere.items():
             titem = []
             for i in range(len(lre)):
                  titem.append((self.lexstateretext[key][i],_funcs_to_names(lre[i][1],self.lexstaterenames[key][i])))
             tabre[key] = titem

        tf.write("_lexstatere   = %s\n" % repr(tabre))
        tf.write("_lexstateignore = %s\n" % repr(self.lexstateignore))

        taberr = { }
        for key, ef in self.lexstateerrorf.items():
             if ef:
                  taberr[key] = ef.__name__
             else:
                  taberr[key] = None
        tf.write("_lexstateerrorf = %s\n" % repr(taberr))
        tf.close()

    # ------------------------------------------------------------
    # readtab() - Read lexer information from a tab file
    # ------------------------------------------------------------
    def readtab(self,tabfile,fdict):
        if isinstance(tabfile,types.ModuleType):
            lextab = tabfile
        else:
            if sys.version_info[0] < 3:
                exec("import %s as lextab" % tabfile)
            else:
                env = { }
                exec("import %s as lextab" % tabfile, env,env)
                lextab = env[''lextab'']

        if getattr(lextab,"_tabversion","0.0") != __version__:
            raise ImportError("Inconsistent PLY version")

        self.lextokens      = lextab._lextokens
        self.lexreflags     = lextab._lexreflags
        self.lexliterals    = lextab._lexliterals
        self.lexstateinfo   = lextab._lexstateinfo
        self.lexstateignore = lextab._lexstateignore
        self.lexstatere     = { }
        self.lexstateretext = { }
        for key,lre in lextab._lexstatere.items():
             titem = []
             txtitem = []
             for i in range(len(lre)):
                  titem.append((re.compile(lre[i][0],lextab._lexreflags | re.VERBOSE),_names_to_funcs(lre[i][1],fdict)))
                  txtitem.append(lre[i][0])
             self.lexstatere[key] = titem
             self.lexstateretext[key] = txtitem
        self.lexstateerrorf = { }
        for key,ef in lextab._lexstateerrorf.items():
             self.lexstateerrorf[key] = fdict[ef]
        self.begin(''INITIAL'')

    # ------------------------------------------------------------
    # input() - Push a new string into the lexer
    # ------------------------------------------------------------
    def input(self,s):
        # Pull off the first character to see if s looks like a string
        c = s[:1]
        if not isinstance(c,StringTypes):
            raise ValueError("Expected a string")
        self.lexdata = s
        self.lexpos = 0
        self.lexlen = len(s)

    # ------------------------------------------------------------
    # begin() - Changes the lexing state
    # ------------------------------------------------------------
    def begin(self,state):
        if not state in self.lexstatere:
            raise ValueError("Undefined state")
        self.lexre = self.lexstatere[state]
        self.lexretext = self.lexstateretext[state]
        self.lexignore = self.lexstateignore.get(state,"")
        self.lexerrorf = self.lexstateerrorf.get(state,None)
        self.lexstate = state

    # ------------------------------------------------------------
    # push_state() - Changes the lexing state and saves old on stack
    # ------------------------------------------------------------
    def push_state(self,state):
        self.lexstatestack.append(self.lexstate)
        self.begin(state)

    # ------------------------------------------------------------
    # pop_state() - Restores the previous state
    # ------------------------------------------------------------
    def pop_state(self):
        self.begin(self.lexstatestack.pop())

    # ------------------------------------------------------------
    # current_state() - Returns the current lexing state
    # ------------------------------------------------------------
    def current_state(self):
        return self.lexstate

    # ------------------------------------------------------------
    # skip() - Skip ahead n characters
    # ------------------------------------------------------------
    def skip(self,n):
        self.lexpos += n

    # ------------------------------------------------------------
    # opttoken() - Return the next token from the Lexer
    #
    # Note: This function has been carefully implemented to be as fast
    # as possible.  Don''t make changes unless you really know what
    # you are doing
    # ------------------------------------------------------------
    def token(self):
        # Make local copies of frequently referenced attributes
        lexpos    = self.lexpos
        lexlen    = self.lexlen
        lexignore = self.lexignore
        lexdata   = self.lexdata

        while lexpos < lexlen:
            # This code provides some short-circuit code for whitespace, tabs, and other ignored characters
            if lexdata[lexpos] in lexignore:
                lexpos += 1
                continue

            # Look for a regular expression match
            for lexre,lexindexfunc in self.lexre:
                m = lexre.match(lexdata,lexpos)
                if not m: continue

                # Create a token for return
                tok = LexToken()
                tok.value = m.group()
                tok.lineno = self.lineno
                tok.lexpos = lexpos

                i = m.lastindex
                func,tok.type = lexindexfunc[i]

                if not func:
                   # If no token type was set, it''s an ignored token
                   if tok.type:
                      self.lexpos = m.end()
                      return tok
                   else:
                      lexpos = m.end()
                      break

                lexpos = m.end()

                # If token is processed by a function, call it

                tok.lexer = self      # Set additional attributes useful in token rules
                self.lexmatch = m
                self.lexpos = lexpos

                newtok = func(tok)

                # Every function must return a token, if nothing, we just move to next token
                if not newtok:
                    lexpos    = self.lexpos         # This is here in case user has updated lexpos.
                    lexignore = self.lexignore      # This is here in case there was a state change
                    break

                # Verify type of the token.  If not in the token map, raise an error
                if not self.lexoptimize:
                    if not newtok.type in self.lextokens:
                        raise LexError("%s:%d: Rule ''%s'' returned an unknown token type ''%s''" % (
                            func_code(func).co_filename, func_code(func).co_firstlineno,
                            func.__name__, newtok.type),lexdata[lexpos:])

                return newtok
            else:
                # No match, see if in literals
                if lexdata[lexpos] in self.lexliterals:
                    tok = LexToken()
                    tok.value = lexdata[lexpos]
                    tok.lineno = self.lineno
                    tok.type = tok.value
                    tok.lexpos = lexpos
                    self.lexpos = lexpos + 1
                    return tok

                # No match. Call t_error() if defined.
                if self.lexerrorf:
                    tok = LexToken()
                    tok.value = self.lexdata[lexpos:]
                    tok.lineno = self.lineno
                    tok.type = "error"
                    tok.lexer = self
                    tok.lexpos = lexpos
                    self.lexpos = lexpos
                    newtok = self.lexerrorf(tok)
                    if lexpos == self.lexpos:
                        # Error method didn''t change text position at all. This is an error.
                        raise LexError("Scanning error. Illegal character ''%s''" % (lexdata[lexpos]), lexdata[lexpos:])
                    lexpos = self.lexpos
                    if not newtok: continue
                    return newtok

                self.lexpos = lexpos
                raise LexError("Illegal character ''%s'' at index %d" % (lexdata[lexpos],lexpos), lexdata[lexpos:])

        self.lexpos = lexpos + 1
        if self.lexdata is None:
             raise RuntimeError("No input string given with input()")
        return None

    # Iterator interface
    def __iter__(self):
        return self

    def next(self):
        t = self.token()
        if t is None:
            raise StopIteration
        return t

    __next__ = next

# -----------------------------------------------------------------------------
#                           ==== Lex Builder ===
#
# The functions and classes below are used to collect lexing information
# and build a Lexer object from it.
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# get_caller_module_dict()
#
# This function returns a dictionary containing all of the symbols defined within
# a caller further down the call stack.  This is used to get the environment
# associated with the yacc() call if none was provided.
# -----------------------------------------------------------------------------

def get_caller_module_dict(levels):
    try:
        raise RuntimeError
    except RuntimeError:
        e,b,t = sys.exc_info()
        f = t.tb_frame
        while levels > 0:
            f = f.f_back                   
            levels -= 1
        ldict = f.f_globals.copy()
        if f.f_globals != f.f_locals:
            ldict.update(f.f_locals)

        return ldict

# -----------------------------------------------------------------------------
# _funcs_to_names()
#
# Given a list of regular expression functions, this converts it to a list
# suitable for output to a table file
# -----------------------------------------------------------------------------

def _funcs_to_names(funclist,namelist):
    result = []
    for f,name in zip(funclist,namelist):
         if f and f[0]:
             result.append((name, f[1]))
         else:
             result.append(f)
    return result

# -----------------------------------------------------------------------------
# _names_to_funcs()
#
# Given a list of regular expression function names, this converts it back to
# functions.
# -----------------------------------------------------------------------------

def _names_to_funcs(namelist,fdict):
     result = []
     for n in namelist:
          if n and n[0]:
              result.append((fdict[n[0]],n[1]))
          else:
              result.append(n)
     return result

# -----------------------------------------------------------------------------
# _form_master_re()
#
# This function takes a list of all of the regex components and attempts to
# form the master regular expression.  Given limitations in the Python re
# module, it may be necessary to break the master regex into separate expressions.
# -----------------------------------------------------------------------------

def _form_master_re(relist,reflags,ldict,toknames):
    if not relist: return []
    regex = "|".join(relist)
    try:
        lexre = re.compile(regex,re.VERBOSE | reflags)

        # Build the index to function map for the matching engine
        lexindexfunc = [ None ] * (max(lexre.groupindex.values())+1)
        lexindexnames = lexindexfunc[:]

        for f,i in lexre.groupindex.items():
            handle = ldict.get(f,None)
            if type(handle) in (types.FunctionType, types.MethodType):
                lexindexfunc[i] = (handle,toknames[f])
                lexindexnames[i] = f
            elif handle is not None:
                lexindexnames[i] = f
                if f.find("ignore_") > 0:
                    lexindexfunc[i] = (None,None)
                else:
                    lexindexfunc[i] = (None, toknames[f])
        
        return [(lexre,lexindexfunc)],[regex],[lexindexnames]
    except Exception:
        m = int(len(relist)/2)
        if m == 0: m = 1
        llist, lre, lnames = _form_master_re(relist[:m],reflags,ldict,toknames)
        rlist, rre, rnames = _form_master_re(relist[m:],reflags,ldict,toknames)
        return llist+rlist, lre+rre, lnames+rnames

# -----------------------------------------------------------------------------
# def _statetoken(s,names)
#
# Given a declaration name s of the form "t_" and a dictionary whose keys are
# state names, this function returns a tuple (states,tokenname) where states
# is a tuple of state names and tokenname is the name of the token.  For example,
# calling this with s = "t_foo_bar_SPAM" might return ((''foo'',''bar''),''SPAM'')
# -----------------------------------------------------------------------------

def _statetoken(s,names):
    nonstate = 1
    parts = s.split("_")
    for i in range(1,len(parts)):
         if not parts[i] in names and parts[i] != ''ANY'': break
    if i > 1:
       states = tuple(parts[1:i])
    else:
       states = (''INITIAL'',)

    if ''ANY'' in states:
       states = tuple(names)

    tokenname = "_".join(parts[i:])
    return (states,tokenname)


# -----------------------------------------------------------------------------
# LexerReflect()
#
# This class represents information needed to build a lexer as extracted from a
# user''s input file.
# -----------------------------------------------------------------------------
class LexerReflect(object):
    def __init__(self,ldict,log=None,reflags=0):
        self.ldict      = ldict
        self.error_func = None
        self.tokens     = []
        self.reflags    = reflags
        self.stateinfo  = { ''INITIAL'' : ''inclusive''}
        self.files      = {}
        self.error      = 0

        if log is None:
            self.log = PlyLogger(sys.stderr)
        else:
            self.log = log

    # Get all of the basic information
    def get_all(self):
        self.get_tokens()
        self.get_literals()
        self.get_states()
        self.get_rules()
        
    # Validate all of the information
    def validate_all(self):
        self.validate_tokens()
        self.validate_literals()
        self.validate_rules()
        return self.error

    # Get the tokens map
    def get_tokens(self):
        tokens = self.ldict.get("tokens",None)
        if not tokens:
            self.log.error("No token list is defined")
            self.error = 1
            return

        if not isinstance(tokens,(list, tuple)):
            self.log.error("tokens must be a list or tuple")
            self.error = 1
            return
        
        if not tokens:
            self.log.error("tokens is empty")
            self.error = 1
            return

        self.tokens = tokens

    # Validate the tokens
    def validate_tokens(self):
        terminals = {}
        for n in self.tokens:
            if not _is_identifier.match(n):
                self.log.error("Bad token name ''%s''",n)
                self.error = 1
            if n in terminals:
                self.log.warning("Token ''%s'' multiply defined", n)
            terminals[n] = 1

    # Get the literals specifier
    def get_literals(self):
        self.literals = self.ldict.get("literals","")

    # Validate literals
    def validate_literals(self):
        try:
            for c in self.literals:
                if not isinstance(c,StringTypes) or len(c) > 1:
                    self.log.error("Invalid literal %s. Must be a single character", repr(c))
                    self.error = 1
                    continue

        except TypeError:
            self.log.error("Invalid literals specification. literals must be a sequence of characters")
            self.error = 1

    def get_states(self):
        self.states = self.ldict.get("states",None)
        # Build statemap
        if self.states:
             if not isinstance(self.states,(tuple,list)):
                  self.log.error("states must be defined as a tuple or list")
                  self.error = 1
             else:
                  for s in self.states:
                        if not isinstance(s,tuple) or len(s) != 2:
                               self.log.error("Invalid state specifier %s. Must be a tuple (statename,''exclusive|inclusive'')",repr(s))
                               self.error = 1
                               continue
                        name, statetype = s
                        if not isinstance(name,StringTypes):
                               self.log.error("State name %s must be a string", repr(name))
                               self.error = 1
                               continue
                        if not (statetype == ''inclusive'' or statetype == ''exclusive''):
                               self.log.error("State type for state %s must be ''inclusive'' or ''exclusive''",name)
                               self.error = 1
                               continue
                        if name in self.stateinfo:
                               self.log.error("State ''%s'' already defined",name)
                               self.error = 1
                               continue
                        self.stateinfo[name] = statetype

    # Get all of the symbols with a t_ prefix and sort them into various
    # categories (functions, strings, error functions, and ignore characters)

    def get_rules(self):
        tsymbols = [f for f in self.ldict if f[:2] == ''t_'' ]

        # Now build up a list of functions and a list of strings

        self.toknames = { }        # Mapping of symbols to token names
        self.funcsym =  { }        # Symbols defined as functions
        self.strsym =   { }        # Symbols defined as strings
        self.ignore   = { }        # Ignore strings by state
        self.errorf   = { }        # Error functions by state

        for s in self.stateinfo:
             self.funcsym[s] = []
             self.strsym[s] = []

        if len(tsymbols) == 0:
            self.log.error("No rules of the form t_rulename are defined")
            self.error = 1
            return

        for f in tsymbols:
            t = self.ldict[f]
            states, tokname = _statetoken(f,self.stateinfo)
            self.toknames[f] = tokname

            if hasattr(t,"__call__"):
                if tokname == ''error'':
                    for s in states:
                        self.errorf[s] = t
                elif tokname == ''ignore'':
                    line = func_code(t).co_firstlineno
                    file = func_code(t).co_filename
                    self.log.error("%s:%d: Rule ''%s'' must be defined as a string",file,line,t.__name__)
                    self.error = 1
                else:
                    for s in states: 
                        self.funcsym[s].append((f,t))
            elif isinstance(t, StringTypes):
                if tokname == ''ignore'':
                    for s in states:
                        self.ignore[s] = t
                    if "\\" in t:
                        self.log.warning("%s contains a literal backslash ''\\''",f)

                elif tokname == ''error'':
                    self.log.error("Rule ''%s'' must be defined as a function", f)
                    self.error = 1
                else:
                    for s in states: 
                        self.strsym[s].append((f,t))
            else:
                self.log.error("%s not defined as a function or string", f)
                self.error = 1

        # Sort the functions by line number
        for f in self.funcsym.values():
            if sys.version_info[0] < 3:
                f.sort(lambda x,y: cmp(func_code(x[1]).co_firstlineno,func_code(y[1]).co_firstlineno))
            else:
                # Python 3.0
                f.sort(key=lambda x: func_code(x[1]).co_firstlineno)

        # Sort the strings by regular expression length
        for s in self.strsym.values():
            if sys.version_info[0] < 3:
                s.sort(lambda x,y: (len(x[1]) < len(y[1])) - (len(x[1]) > len(y[1])))
            else:
                # Python 3.0
                s.sort(key=lambda x: len(x[1]),reverse=True)

    # Validate all of the t_rules collected 
    def validate_rules(self):
        for state in self.stateinfo:
            # Validate all rules defined by functions

            

            for fname, f in self.funcsym[state]:
                line = func_code(f).co_firstlineno
                file = func_code(f).co_filename
                self.files[file] = 1

                tokname = self.toknames[fname]
                if isinstance(f, types.MethodType):
                    reqargs = 2
                else:
                    reqargs = 1
                nargs = func_code(f).co_argcount
                if nargs > reqargs:
                    self.log.error("%s:%d: Rule ''%s'' has too many arguments",file,line,f.__name__)
                    self.error = 1
                    continue

                if nargs < reqargs:
                    self.log.error("%s:%d: Rule ''%s'' requires an argument", file,line,f.__name__)
                    self.error = 1
                    continue

                if not f.__doc__:
                    self.log.error("%s:%d: No regular expression defined for rule ''%s''",file,line,f.__name__)
                    self.error = 1
                    continue

                try:
                    c = re.compile("(?P<%s>%s)" % (fname,f.__doc__), re.VERBOSE | self.reflags)
                    if c.match(""):
                        self.log.error("%s:%d: Regular expression for rule ''%s'' matches empty string", file,line,f.__name__)
                        self.error = 1
                except re.error:
                    _etype, e, _etrace = sys.exc_info()
                    self.log.error("%s:%d: Invalid regular expression for rule ''%s''. %s", file,line,f.__name__,e)
                    if ''#'' in f.__doc__:
                        self.log.error("%s:%d. Make sure ''#'' in rule ''%s'' is escaped with ''\\#''",file,line, f.__name__)
                    self.error = 1

            # Validate all rules defined by strings
            for name,r in self.strsym[state]:
                tokname = self.toknames[name]
                if tokname == ''error'':
                    self.log.error("Rule ''%s'' must be defined as a function", name)
                    self.error = 1
                    continue

                if not tokname in self.tokens and tokname.find("ignore_") < 0:
                    self.log.error("Rule ''%s'' defined for an unspecified token %s",name,tokname)
                    self.error = 1
                    continue

                try:
                    c = re.compile("(?P<%s>%s)" % (name,r),re.VERBOSE | self.reflags)
                    if (c.match("")):
                         self.log.error("Regular expression for rule ''%s'' matches empty string",name)
                         self.error = 1
                except re.error:
                    _etype, e, _etrace = sys.exc_info()
                    self.log.error("Invalid regular expression for rule ''%s''. %s",name,e)
                    if ''#'' in r:
                         self.log.error("Make sure ''#'' in rule ''%s'' is escaped with ''\\#''",name)
                    self.error = 1

            if not self.funcsym[state] and not self.strsym[state]:
                self.log.error("No rules defined for state ''%s''",state)
                self.error = 1

            # Validate the error function
            efunc = self.errorf.get(state,None)
            if efunc:
                f = efunc
                line = func_code(f).co_firstlineno
                file = func_code(f).co_filename
                self.files[file] = 1

                if isinstance(f, types.MethodType):
                    reqargs = 2
                else:
                    reqargs = 1
                nargs = func_code(f).co_argcount
                if nargs > reqargs:
                    self.log.error("%s:%d: Rule ''%s'' has too many arguments",file,line,f.__name__)
                    self.error = 1

                if nargs < reqargs:
                    self.log.error("%s:%d: Rule ''%s'' requires an argument", file,line,f.__name__)
                    self.error = 1

        for f in self.files:
            self.validate_file(f)


    # -----------------------------------------------------------------------------
    # validate_file()
    #
    # This checks to see if there are duplicated t_rulename() functions or strings
    # in the parser input file.  This is done using a simple regular expression
    # match on each line in the given file.  
    # -----------------------------------------------------------------------------

    def validate_file(self,filename):
        import os.path
        base,ext = os.path.splitext(filename)
        if ext != ''.py'': return         # No idea what the file is. Return OK

        try:
            f = open(filename)
            lines = f.readlines()
            f.close()
        except IOError:
            return                      # Couldn''t find the file.  Don''t worry about it

        fre = re.compile(r''\s*def\s+(t_[a-zA-Z_0-9]*)\('')
        sre = re.compile(r''\s*(t_[a-zA-Z_0-9]*)\s*='')

        counthash = { }
        linen = 1
        for l in lines:
            m = fre.match(l)
            if not m:
                m = sre.match(l)
            if m:
                name = m.group(1)
                prev = counthash.get(name)
                if not prev:
                    counthash[name] = linen
                else:
                    self.log.error("%s:%d: Rule %s redefined. Previously defined on line %d",filename,linen,name,prev)
                    self.error = 1
            linen += 1
            
# -----------------------------------------------------------------------------
# lex(module)
#
# Build all of the regular expression rules from definitions in the supplied module
# -----------------------------------------------------------------------------
def lex(module=None,object=None,debug=0,optimize=0,lextab="lextab",reflags=0,nowarn=0,outputdir="", debuglog=None, errorlog=None):
    global lexer
    ldict = None
    stateinfo  = { ''INITIAL'' : ''inclusive''}
    lexobj = Lexer()
    lexobj.lexoptimize = optimize
    global token,input

    if errorlog is None:
        errorlog = PlyLogger(sys.stderr)

    if debug:
        if debuglog is None:
            debuglog = PlyLogger(sys.stderr)

    # Get the module dictionary used for the lexer
    if object: module = object

    if module:
        _items = [(k,getattr(module,k)) for k in dir(module)]
        ldict = dict(_items)
    else:
        ldict = get_caller_module_dict(2)

    # Collect parser information from the dictionary
    linfo = LexerReflect(ldict,log=errorlog,reflags=reflags)
    linfo.get_all()
    if not optimize:
        if linfo.validate_all():
            raise SyntaxError("Can''t build lexer")

    if optimize and lextab:
        try:
            lexobj.readtab(lextab,ldict)
            token = lexobj.token
            input = lexobj.input
            lexer = lexobj
            return lexobj

        except ImportError:
            pass

    # Dump some basic debugging information
    if debug:
        debuglog.info("lex: tokens   = %r", linfo.tokens)
        debuglog.info("lex: literals = %r", linfo.literals)
        debuglog.info("lex: states   = %r", linfo.stateinfo)

    # Build a dictionary of valid token names
    lexobj.lextokens = { }
    for n in linfo.tokens:
        lexobj.lextokens[n] = 1

    # Get literals specification
    if isinstance(linfo.literals,(list,tuple)):
        lexobj.lexliterals = type(linfo.literals[0])().join(linfo.literals)
    else:
        lexobj.lexliterals = linfo.literals

    # Get the stateinfo dictionary
    stateinfo = linfo.stateinfo

    regexs = { }
    # Build the master regular expressions
    for state in stateinfo:
        regex_list = []

        # Add rules defined by functions first
        for fname, f in linfo.funcsym[state]:
            line = func_code(f).co_firstlineno
            file = func_code(f).co_filename
            regex_list.append("(?P<%s>%s)" % (fname,f.__doc__))
            if debug:
                debuglog.info("lex: Adding rule %s -> ''%s'' (state ''%s'')",fname,f.__doc__, state)

        # Now add all of the simple rules
        for name,r in linfo.strsym[state]:
            regex_list.append("(?P<%s>%s)" % (name,r))
            if debug:
                debuglog.info("lex: Adding rule %s -> ''%s'' (state ''%s'')",name,r, state)

        regexs[state] = regex_list

    # Build the master regular expressions

    if debug:
        debuglog.info("lex: ==== MASTER REGEXS FOLLOW ====")

    for state in regexs:
        lexre, re_text, re_names = _form_master_re(regexs[state],reflags,ldict,linfo.toknames)
        lexobj.lexstatere[state] = lexre
        lexobj.lexstateretext[state] = re_text
        lexobj.lexstaterenames[state] = re_names
        if debug:
            for i in range(len(re_text)):
                debuglog.info("lex: state ''%s'' : regex[%d] = ''%s''",state, i, re_text[i])

    # For inclusive states, we need to add the regular expressions from the INITIAL state
    for state,stype in stateinfo.items():
        if state != "INITIAL" and stype == ''inclusive'':
             lexobj.lexstatere[state].extend(lexobj.lexstatere[''INITIAL''])
             lexobj.lexstateretext[state].extend(lexobj.lexstateretext[''INITIAL''])
             lexobj.lexstaterenames[state].extend(lexobj.lexstaterenames[''INITIAL''])

    lexobj.lexstateinfo = stateinfo
    lexobj.lexre = lexobj.lexstatere["INITIAL"]
    lexobj.lexretext = lexobj.lexstateretext["INITIAL"]
    lexobj.lexreflags = reflags

    # Set up ignore variables
    lexobj.lexstateignore = linfo.ignore
    lexobj.lexignore = lexobj.lexstateignore.get("INITIAL","")

    # Set up error functions
    lexobj.lexstateerrorf = linfo.errorf
    lexobj.lexerrorf = linfo.errorf.get("INITIAL",None)
    if not lexobj.lexerrorf:
        errorlog.warning("No t_error rule is defined")

    # Check state information for ignore and error rules
    for s,stype in stateinfo.items():
        if stype == ''exclusive'':
              if not s in linfo.errorf:
                   errorlog.warning("No error rule is defined for exclusive state ''%s''", s)
              if not s in linfo.ignore and lexobj.lexignore:
                   errorlog.warning("No ignore rule is defined for exclusive state ''%s''", s)
        elif stype == ''inclusive'':
              if not s in linfo.errorf:
                   linfo.errorf[s] = linfo.errorf.get("INITIAL",None)
              if not s in linfo.ignore:
                   linfo.ignore[s] = linfo.ignore.get("INITIAL","")

    # Create global versions of the token() and input() functions
    token = lexobj.token
    input = lexobj.input
    lexer = lexobj

    # If in optimize mode, we write the lextab
    if lextab and optimize:
        lexobj.writetab(lextab,outputdir)

    return lexobj

# -----------------------------------------------------------------------------
# runmain()
#
# This runs the lexer as a main program
# -----------------------------------------------------------------------------

def runmain(lexer=None,data=None):
    if not data:
        try:
            filename = sys.argv[1]
            f = open(filename)
            data = f.read()
            f.close()
        except IndexError:
            sys.stdout.write("Reading from standard input (type EOF to end):\n")
            data = sys.stdin.read()

    if lexer:
        _input = lexer.input
    else:
        _input = input
    _input(data)
    if lexer:
        _token = lexer.token
    else:
        _token = token

    while 1:
        tok = _token()
        if not tok: break
        sys.stdout.write("(%s,%r,%d,%d)\n" % (tok.type, tok.value, tok.lineno,tok.lexpos))

# -----------------------------------------------------------------------------
# @TOKEN(regex)
#
# This decorator function can be used to set the regex expression on a function
# when its docstring might need to be set in an alternative way
# -----------------------------------------------------------------------------

def TOKEN(r):
    def set_doc(f):
        if hasattr(r,"__call__"):
            f.__doc__ = r.__doc__
        else:
            f.__doc__ = r
        return f
    return set_doc

# Alternative spelling of the TOKEN decorator
Token = TOKEN

'
]

{ #category : #resources }
PythonParserTests >> source_lex_closure [
	^ '# -----------------------------------------------------------------------------
# lex_closure.py
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.lex as lex

tokens = (
        ''NAME'',''NUMBER'',
        ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
        ''LPAREN'',''RPAREN'',
        )

def make_calc():

    # Tokens

    t_PLUS    = r''\+''
    t_MINUS   = r''-''
    t_TIMES   = r''\*''
    t_DIVIDE  = r''/''
    t_EQUALS  = r''=''
    t_LPAREN  = r''\(''
    t_RPAREN  = r''\)''
    t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

    def t_NUMBER(t):
        r''\d+''
        try:
            t.value = int(t.value)
        except ValueError:
            print("Integer value too large %s" % t.value)
            t.value = 0
        return t

    t_ignore = " \t"

    def t_newline(t):
        r''\n+''
        t.lineno += t.value.count("\n")
        
    def t_error(t):
        print("Illegal character ''%s''" % t.value[0])
        t.lexer.skip(1)
        
    # Build the lexer
    return lex.lex()

make_calc()
lex.runmain(data="3+4")



'
]

{ #category : #resources }
PythonParserTests >> source_lex_doc1 [
	^ '# lex_doc1.py
#
# Missing documentation string

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
def t_NUMBER(t):
    pass

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_dup1 [
	^ '# lex_dup1.py
#
# Duplicated rule specifiers

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

t_NUMBER = r''\d+''

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_dup2 [
	^ '# lex_dup2.py
#
# Duplicated rule specifiers

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
def t_NUMBER(t):
    r''\d+''
    pass

def t_NUMBER(t):
    r''\d+''
    pass

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_dup3 [
	^ '# lex_dup3.py
#
# Duplicated rule specifiers

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_NUMBER(t):
    r''\d+''
    pass

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_empty [
	^ '# lex_empty.py
#
# No rules defined

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_error1 [
	^ '# lex_error1.py
#
# Missing t_error() rule

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_error2 [
	^ '# lex_error2.py
#
# t_error defined, but not function

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

t_error = "foo"



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_error3 [
	^ '# lex_error3.py
#
# t_error defined as function, but with wrong # args

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_error():
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_error4 [
	^ '# lex_error4.py
#
# t_error defined as function, but too many args

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_error(t,s):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_hedit [
	^ '# -----------------------------------------------------------------------------
# hedit.py
#
# Paring of Fortran H Edit descriptions (Contributed by Pearu Peterson)
#
# These tokens can''t be easily tokenized because they are of the following
# form:
#
#   nHc1...cn
#
# where n is a positive integer and c1 ... cn are characters.
#
# This example shows how to modify the state of the lexer to parse
# such tokens
# -----------------------------------------------------------------------------
import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = (
    ''H_EDIT_DESCRIPTOR'',
    )

# Tokens
t_ignore = " \t\n"

def t_H_EDIT_DESCRIPTOR(t):
    r"\d+H.*"                     # This grabs all of the remaining text
    i = t.value.index(''H'')
    n = eval(t.value[:i])
    
    # Adjust the tokenizing position
    t.lexer.lexpos -= len(t.value) - (i+1+n)
    t.value = t.value[i+1:i+1+n]
    return t                                  
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
# Build the lexer
lex.lex()
lex.runmain(data="3Habc 10Habcdefghij 2Hxy")



'
]

{ #category : #resources }
PythonParserTests >> source_lex_ignore [
	^ '# lex_ignore.py
#
# Improperly specific ignore declaration

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_ignore(t):
    '' \t''
    pass

def t_error(t):
    pass

import sys

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_ignore2 [
	^ '# lex_ignore2.py
#
# ignore declaration as a raw string

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

t_ignore = r'' \t''

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_literal1 [
	^ '# lex_literal1.py
#
# Bad literal specification

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "NUMBER",
    ]

literals = ["+","-","**"]

def t_NUMBER(t):
    r''\d+''
    return t

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_literal2 [
	^ '# lex_literal2.py
#
# Bad literal specification

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "NUMBER",
    ]

literals = 23

def t_NUMBER(t):
    r''\d+''
    return t

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_many_tokens [
	^ '# lex_many_tokens.py
#
# Test lex''s ability to handle a large number of tokens (beyond the
# 100-group limit of the re module)

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = ["TOK%d" % i for i in range(1000)]

for tok in tokens:
    if sys.version_info[0] < 3:
        exec("t_%s = ''%s:''" % (tok,tok))
    else:
        exec("t_%s = ''%s:''" % (tok,tok), globals())

t_ignore = " \t"

def t_error(t):
    pass

lex.lex(optimize=1,lextab="manytab")
lex.runmain(data="TOK34: TOK143: TOK269: TOK372: TOK452: TOK561: TOK999:")


'
]

{ #category : #resources }
PythonParserTests >> source_lex_module [
	^ '# lex_module.py
#

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex
import lex_module_import
lex.lex(module=lex_module_import)
lex.runmain(data="3+4")
'
]

{ #category : #resources }
PythonParserTests >> source_lex_module_import [
	^ '# -----------------------------------------------------------------------------
# lex_module_import.py
#
# A lexer defined in a module, but built in lex_module.py
# -----------------------------------------------------------------------------

tokens = (
    ''NAME'',''NUMBER'',
    ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
    ''LPAREN'',''RPAREN'',
    )

# Tokens

t_PLUS    = r''\+''
t_MINUS   = r''-''
t_TIMES   = r''\*''
t_DIVIDE  = r''/''
t_EQUALS  = r''=''
t_LPAREN  = r''\(''
t_RPAREN  = r''\)''
t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

def t_NUMBER(t):
    r''\d+''
    try:
        t.value = int(t.value)
    except ValueError:
        print("Integer value too large %s" % t.value)
        t.value = 0
    return t

t_ignore = " \t"

def t_newline(t):
    r''\n+''
    t.lineno += t.value.count("\n")
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
'
]

{ #category : #resources }
PythonParserTests >> source_lex_object [
	^ '# -----------------------------------------------------------------------------
# lex_object.py
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.lex as lex

class CalcLexer:
    tokens = (
        ''NAME'',''NUMBER'',
        ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
        ''LPAREN'',''RPAREN'',
        )

    # Tokens

    t_PLUS    = r''\+''
    t_MINUS   = r''-''
    t_TIMES   = r''\*''
    t_DIVIDE  = r''/''
    t_EQUALS  = r''=''
    t_LPAREN  = r''\(''
    t_RPAREN  = r''\)''
    t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

    def t_NUMBER(self,t):
        r''\d+''
        try:
            t.value = int(t.value)
        except ValueError:
            print("Integer value too large %s" % t.value)
            t.value = 0
        return t

    t_ignore = " \t"

    def t_newline(self,t):
        r''\n+''
        t.lineno += t.value.count("\n")
        
    def t_error(self,t):
        print("Illegal character ''%s''" % t.value[0])
        t.lexer.skip(1)
        

calc = CalcLexer()

# Build the lexer
lex.lex(object=calc)
lex.runmain(data="3+4")




'
]

{ #category : #resources }
PythonParserTests >> source_lex_opt_alias [
	^ '# -----------------------------------------------------------------------------
# lex_opt_alias.py
#
# Tests ability to match up functions with states, aliases, and
# lexing tables.
# -----------------------------------------------------------------------------

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

tokens = (
    ''NAME'',''NUMBER'',
    )

states = ((''instdef'',''inclusive''),(''spam'',''exclusive''))

literals = [''='',''+'',''-'',''*'',''/'', ''('','')'']

# Tokens

def t_instdef_spam_BITS(t):
    r''[01-]+''
    return t

t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

def NUMBER(t):
    r''\d+''
    try:
        t.value = int(t.value)
    except ValueError:
        print("Integer value too large %s" % t.value)
        t.value = 0
    return t

t_ANY_NUMBER = NUMBER

t_ignore = " \t"
t_spam_ignore = t_ignore

def t_newline(t):
    r''\n+''
    t.lexer.lineno += t.value.count("\n")
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)

t_spam_error = t_error

# Build the lexer
import ply.lex as lex
lex.lex(optimize=1,lextab="aliastab")
lex.runmain(data="3+4")
'
]

{ #category : #resources }
PythonParserTests >> source_lex_optimize [
	^ '# -----------------------------------------------------------------------------
# lex_optimize.py
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.lex as lex

tokens = (
    ''NAME'',''NUMBER'',
    ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
    ''LPAREN'',''RPAREN'',
    )

# Tokens

t_PLUS    = r''\+''
t_MINUS   = r''-''
t_TIMES   = r''\*''
t_DIVIDE  = r''/''
t_EQUALS  = r''=''
t_LPAREN  = r''\(''
t_RPAREN  = r''\)''
t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

def t_NUMBER(t):
    r''\d+''
    try:
        t.value = int(t.value)
    except ValueError:
        print("Integer value too large %s" % t.value)
        t.value = 0
    return t

t_ignore = " \t"

def t_newline(t):
    r''\n+''
    t.lineno += t.value.count("\n")
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
# Build the lexer
lex.lex(optimize=1)
lex.runmain(data="3+4")



'
]

{ #category : #resources }
PythonParserTests >> source_lex_optimize2 [
	^ '# -----------------------------------------------------------------------------
# lex_optimize2.py
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.lex as lex

tokens = (
    ''NAME'',''NUMBER'',
    ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
    ''LPAREN'',''RPAREN'',
    )

# Tokens

t_PLUS    = r''\+''
t_MINUS   = r''-''
t_TIMES   = r''\*''
t_DIVIDE  = r''/''
t_EQUALS  = r''=''
t_LPAREN  = r''\(''
t_RPAREN  = r''\)''
t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

def t_NUMBER(t):
    r''\d+''
    try:
        t.value = int(t.value)
    except ValueError:
        print("Integer value too large %s" % t.value)
        t.value = 0
    return t

t_ignore = " \t"

def t_newline(t):
    r''\n+''
    t.lineno += t.value.count("\n")
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
# Build the lexer
lex.lex(optimize=1,lextab="opt2tab")
lex.runmain(data="3+4")



'
]

{ #category : #resources }
PythonParserTests >> source_lex_optimize3 [
	^ '# -----------------------------------------------------------------------------
# lex_optimize3.py
#
# Writes table in a subdirectory structure.
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.lex as lex

tokens = (
    ''NAME'',''NUMBER'',
    ''PLUS'',''MINUS'',''TIMES'',''DIVIDE'',''EQUALS'',
    ''LPAREN'',''RPAREN'',
    )

# Tokens

t_PLUS    = r''\+''
t_MINUS   = r''-''
t_TIMES   = r''\*''
t_DIVIDE  = r''/''
t_EQUALS  = r''=''
t_LPAREN  = r''\(''
t_RPAREN  = r''\)''
t_NAME    = r''[a-zA-Z_][a-zA-Z0-9_]*''

def t_NUMBER(t):
    r''\d+''
    try:
        t.value = int(t.value)
    except ValueError:
        print("Integer value too large %s" % t.value)
        t.value = 0
    return t

t_ignore = " \t"

def t_newline(t):
    r''\n+''
    t.lineno += t.value.count("\n")
    
def t_error(t):
    print("Illegal character ''%s''" % t.value[0])
    t.lexer.skip(1)
    
# Build the lexer
lex.lex(optimize=1,lextab="lexdir.sub.calctab",outputdir="lexdir/sub")
lex.runmain(data="3+4")



'
]

{ #category : #resources }
PythonParserTests >> source_lex_re1 [
	^ '# lex_re1.py
#
# Bad regular expression in a string

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''(\d+''

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_re2 [
	^ '# lex_re2.py
#
# Regular expression rule matches empty string

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+?''
t_MINUS = r''-''
t_NUMBER = r''(\d+)''

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_re3 [
	^ '# lex_re3.py
#
# Regular expression rule matches empty string

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    "POUND",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''(\d+)''
t_POUND = r''#''

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_rule1 [
	^ '# lex_rule1.py
#
# Rule function with incorrect number of arguments

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = 1

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_rule2 [
	^ '# lex_rule2.py
#
# Rule function with incorrect number of arguments

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
def t_NUMBER():
    r''\d+''
    return t

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_rule3 [
	^ '# lex_rule3.py
#
# Rule function with incorrect number of arguments

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
def t_NUMBER(t,s):
    r''\d+''
    return t

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state1 [
	^ '# lex_state1.py
#
# Bad state declaration

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

states = ''comment''

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state2 [
	^ '# lex_state2.py
#
# Bad state declaration

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

states = (''comment'',''example'')

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state3 [
	^ '# lex_state3.py
#
# Bad state declaration

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

comment = 1
states = ((comment, ''inclusive''),
          (''example'', ''exclusive''))

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state4 [
	^ '# lex_state4.py
#
# Bad state declaration

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]


states = ((''comment'', ''exclsive''),)

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass



lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state5 [
	^ '# lex_state5.py
#
# Bad state declaration

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

states = ((''comment'', ''exclusive''),
          (''comment'', ''exclusive''))

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass


lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state_noerror [
	^ '# lex_state_noerror.py
#
# Declaration of a state for which no rules are defined

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

states = ((''comment'', ''exclusive''),)

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass


lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state_norule [
	^ '# lex_state_norule.py
#
# Declaration of a state for which no rules are defined

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

states = ((''comment'', ''exclusive''),
          (''example'', ''exclusive''))

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass


lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_state_try [
	^ '# lex_state_try.py
#
# Declaration of a state for which no rules are defined

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [ 
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

states = ((''comment'', ''exclusive''),)

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

t_ignore = " \t"

# Comments
def t_comment(t):
    r''/\*''
    t.lexer.begin(''comment'')
    print("Entering comment state")

def t_comment_body_part(t):
    r''(.|\n)*\*/''
    print("comment body %s" % t)
    t.lexer.begin(''INITIAL'')

def t_error(t):
    pass

t_comment_error = t_error
t_comment_ignore = t_ignore

lex.lex()

data = "3 + 4 /* This is a comment */ + 10"

lex.runmain(data=data)
'
]

{ #category : #resources }
PythonParserTests >> source_lex_token1 [
	^ '# lex_token1.py
#
# Tests for absence of tokens variable

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_token2 [
	^ '# lex_token2.py
#
# Tests for tokens of wrong type

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = "PLUS MINUS NUMBER"

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_error(t):
    pass


lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_token3 [
	^ '# lex_token3.py
#
# tokens is right type, but is missing a token for one rule

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_token4 [
	^ '# lex_token4.py
#
# Bad token name

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "-",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''
t_NUMBER = r''\d+''

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_token5 [
	^ '# lex_token5.py
#
# Return a bad token name

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    ]

t_PLUS = r''\+''
t_MINUS = r''-''

def t_NUMBER(t):
    r''\d+''
    t.type = "NUM"
    return t

def t_error(t):
    pass

lex.lex()
lex.input("1234")
t = lex.token()


'
]

{ #category : #resources }
PythonParserTests >> source_lex_token_dup [
	^ '# lex_token_dup.py
#
# Duplicate token name in tokens

import sys
if ".." not in sys.path: sys.path.insert(0,"..")

import ply.lex as lex

tokens = [
    "PLUS",
    "MINUS",
    "NUMBER",
    "MINUS"
    ]

t_PLUS = r''\+''
t_MINUS = r''-''

def t_NUMBER(t):
    r''\d+''
    return t

def t_error(t):
    pass

lex.lex()


'
]

{ #category : #resources }
PythonParserTests >> source_makedoc [
	^ '#!/usr/local/bin/python

###############################################################################
# Takes a chapter as input and adds internal links and numbering to all
# of the H1, H2, H3, H4 and H5 sections.
#
# Every heading HTML tag (H1, H2 etc) is given an autogenerated name to link
# to. However, if the name is not an autogenerated name from a previous run,
# it will be kept. If it is autogenerated, it might change on subsequent runs
# of this program. Thus if you want to create links to one of the headings,
# then change the heading link name to something that does not look like an
# autogenerated link name.
###############################################################################

import sys
import re
import string

###############################################################################
# Functions
###############################################################################

# Regexs for <a name="..."></a>
alink = re.compile(r"<a *name *= *\"(.*)\"></a>", re.IGNORECASE)
heading = re.compile(r"(_nn\d)", re.IGNORECASE)

def getheadingname(m):
    autogeneratedheading = True;
    if m.group(1) != None:
        amatch = alink.match(m.group(1))
        if amatch:
            # A non-autogenerated heading - keep it
            headingname = amatch.group(1)
            autogeneratedheading = heading.match(headingname)
    if autogeneratedheading:
        # The heading name was either non-existent or autogenerated,
        # We can create a new heading / change the existing heading
        headingname = "%s_nn%d" % (filenamebase, nameindex)
    return headingname

###############################################################################
# Main program
###############################################################################

if len(sys.argv) != 2:
    print "usage: makedoc.py filename"
    sys.exit(1)

filename = sys.argv[1]
filenamebase = string.split(filename,".")[0]

section = 0
subsection = 0
subsubsection = 0
subsubsubsection = 0
nameindex = 0

name = ""

# Regexs for <h1>,... <h5> sections

h1 = re.compile(r".*?<H1>(<a.*a>)*[\d\.\s]*(.*?)</H1>", re.IGNORECASE)
h2 = re.compile(r".*?<H2>(<a.*a>)*[\d\.\s]*(.*?)</H2>", re.IGNORECASE)
h3 = re.compile(r".*?<H3>(<a.*a>)*[\d\.\s]*(.*?)</H3>", re.IGNORECASE)
h4 = re.compile(r".*?<H4>(<a.*a>)*[\d\.\s]*(.*?)</H4>", re.IGNORECASE)
h5 = re.compile(r".*?<H5>(<a.*a>)*[\d\.\s]*(.*?)</H5>", re.IGNORECASE)

data = open(filename).read()            # Read data
open(filename+".bak","w").write(data)   # Make backup

lines = data.splitlines()
result = [ ] # This is the result of postprocessing the file
index = "<!-- INDEX -->\n<div class=\"sectiontoc\">\n" # index contains the index for adding at the top of the file. Also printed to stdout.

skip = 0
skipspace = 0

for s in lines:
    if s == "<!-- INDEX -->":
        if not skip:
            result.append("@INDEX@")
            skip = 1
        else:
            skip = 0
        continue;
    if skip:
        continue

    if not s and skipspace:
        continue

    if skipspace:
        result.append("")
        result.append("")
        skipspace = 0
    
    m = h2.match(s)
    if m:
        prevheadingtext = m.group(2)
        nameindex += 1
        section += 1
        headingname = getheadingname(m)
        result.append("""<H2><a name="%s"></a>%d. %s</H2>""" % (headingname,section, prevheadingtext))

        if subsubsubsection:
            index += "</ul>\n"
        if subsubsection:
            index += "</ul>\n"
        if subsection:
            index += "</ul>\n"
        if section == 1:
            index += "<ul>\n"

        index += """<li><a href="#%s">%s</a>\n""" % (headingname,prevheadingtext)
        subsection = 0
        subsubsection = 0
        subsubsubsection = 0
        skipspace = 1        
        continue
    m = h3.match(s)
    if m:
        prevheadingtext = m.group(2)
        nameindex += 1
        subsection += 1
        headingname = getheadingname(m)
        result.append("""<H3><a name="%s"></a>%d.%d %s</H3>""" % (headingname,section, subsection, prevheadingtext))

        if subsubsubsection:
            index += "</ul>\n"
        if subsubsection:
            index += "</ul>\n"
        if subsection == 1:
            index += "<ul>\n"

        index += """<li><a href="#%s">%s</a>\n""" % (headingname,prevheadingtext)
        subsubsection = 0
        skipspace = 1        
        continue
    m = h4.match(s)
    if m:
        prevheadingtext = m.group(2)
        nameindex += 1
        subsubsection += 1
        subsubsubsection = 0
        headingname = getheadingname(m)
        result.append("""<H4><a name="%s"></a>%d.%d.%d %s</H4>""" % (headingname,section, subsection, subsubsection, prevheadingtext))

        if subsubsubsection:
            index += "</ul>\n"
        if subsubsection == 1:
            index += "<ul>\n"

        index += """<li><a href="#%s">%s</a>\n""" % (headingname,prevheadingtext)
        skipspace = 1        
        continue
    m = h5.match(s)
    if m:
        prevheadingtext = m.group(2)
        nameindex += 1
        subsubsubsection += 1
        headingname = getheadingname(m)
        result.append("""<H5><a name="%s"></a>%d.%d.%d.%d %s</H5>""" % (headingname,section, subsection, subsubsection, subsubsubsection, prevheadingtext))

        if subsubsubsection == 1:
            index += "<ul>\n"

        index += """<li><a href="#%s">%s</a>\n""" % (headingname,prevheadingtext)
        skipspace = 1
        continue
    
    result.append(s)

if subsubsubsection:
    index += "</ul>\n"

if subsubsection:
    index += "</ul>\n"

if subsection:
    index += "</ul>\n"

if section:
    index += "</ul>\n"

index += "</div>\n<!-- INDEX -->\n"

data = "\n".join(result)

data = data.replace("@INDEX@",index) + "\n";

# Write the file back out
open(filename,"w").write(data)


'
]

{ #category : #resources }
PythonParserTests >> source_readSampleClass [
	^ '#!/usr/bin/python
import sys
sys.path = ["../"] + sys.path
import CppHeaderParser
try:
    cppHeader = CppHeaderParser.CppHeader("SampleClass.h")
except CppHeaderParser.CppParseError as e:
    print(e)
    sys.exit(1)

print("CppHeaderParser view of %s"%cppHeader)

sampleClass = cppHeader.classes["SampleClass"]
print("Number of public methods %d"%(len(sampleClass["methods"]["public"])))
print("Number of private properties %d"%(len(sampleClass["properties"]["private"])))
meth3 = [m for m in sampleClass["methods"]["public"] if m["name"] == "meth3"][0] #get meth3
meth3ParamTypes = [t["type"] for t in meth3["parameters"]] #get meth3s parameters
print("Parameter Types for public method meth3 %s"%(meth3ParamTypes))

print("\nReturn type for meth1:")
print(cppHeader.classes["SampleClass"]["methods"]["public"][1]["rtnType"])

print("\nDoxygen for meth2:")
print(cppHeader.classes["SampleClass"]["methods"]["public"][2]["doxygen"])

print("\nParameters for meth3:")
print(cppHeader.classes["SampleClass"]["methods"]["public"][3]["parameters"])

print("\nDoxygen for meth4:")
print(cppHeader.classes["SampleClass"]["methods"]["public"][4]["doxygen"])

print("\nReturn type for meth5:")
print(cppHeader.classes["SampleClass"]["methods"]["private"][0]["rtnType"])

print("\nDoxygen type for prop1:")
print(cppHeader.classes["SampleClass"]["properties"]["private"][0]["doxygen"])

print("\nType for prop5:")
print(cppHeader.classes["SampleClass"]["properties"]["private"][1]["type"])

print("\nNamespace for AlphaClass is:")
print(cppHeader.classes["AlphaClass"]["namespace"])

print("\nReturn type for alphaMethod is:")
print(cppHeader.classes["AlphaClass"]["methods"]["public"][0]["rtnType"])

print("\nNamespace for OmegaClass is:")
print(cppHeader.classes["OmegaClass"]["namespace"])

print("\nType for omegaString is:")
print(cppHeader.classes["AlphaClass"]["properties"]["public"][0]["type"])

print("\nFree functions are:")
for func in cppHeader.functions:
    print(" %s"%func["name"])

print("\n#includes are:")
for incl in cppHeader.includes:
    print(" %s"%incl)

print("\n#defines are:")
for define in cppHeader.defines:
    print(" %s"%define)
'
]

{ #category : #resources }
PythonParserTests >> source_test_0 [
	^ '
a = 1

'
]

{ #category : #resources }
PythonParserTests >> source_test_1 [
	^ '
def ident(x):
    return x
def boing(c, d):
    return ident(c)
aap = boing(1,1.0)

'
]

{ #category : #resources }
PythonParserTests >> source_test_10 [
	^ '
class fred:                              # hallo: [int]
   pass

a = fred()                               # [fred_int]
a.hallo = 1                              # [int]
b = a.hallo                              # [int]

c = fred()                               # [fred_str]
c.a = ''god''                              # [str]
d = c.a                                  # [str]

'
]

{ #category : #resources }
PythonParserTests >> source_test_100 [
	^ '
print [1,2] == [1,2]                     # [int]
print [(1,2),(2,3)] == [(1,2),(2,3)]     # [int]
print [(1,4),(2,3)] == [(1,2),(2,3)]     # [int]

print 1 in (1,2,3)                       # [int]
print 1 in (1,2)                         # [int]
print 3 in (1,2)                         # [int]

print (1,2) in [(1,2),(2,3)]             # [int]
print (1,4) in [(1,2),(2,3)]             # [int]

print ((1,)) in [((2,)),((1,))]          # [int]
print ((3,)) in [((2,)),((1,))]          # [int]

print [1] in ([2],[1])                   # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_102 [
	^ '
a = (1,2)                                # [tuple2(int, int)]
a in [(1,2),(3,4)]                       # [int]
(1,2) in [(1,2),(3,4)]                   # [int]

a == (2,3)                               # []
(1,2) == a                               # []

b = [1]                                  # [list(int)]
b == []                                  # [int]
[] == b                                  # [list(int)]
b == [1]                                 # [int]
1 in b                                   # [int]
1 in [1]                                 # [int]
[1] == [1]                               # [int]

#b == ''hoi''                               # [int]
#''hoi'' == b                               # [int]
''hoi'' == ''hoi''                           # [int]

for c in [(2,3),(3,4)]:                  # [tuple2(int, int)]
    if c == (2,3):                       # []
        pass

[v for v in [(1,),(2,),(3,)] if v != (1,)] # [list(tuple(int))]

e = 1
a in [(1,e)]                             # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_103 [
	^ '

class fred:                              # x: [float, int]*
    def bla(self):                       # self: [fred(A)]
        self.meth_templ(1, 1)            # [int]
        self.meth_templ(1.0, 1)          # [float]

        self.hop(self.x)                 # [A]

    def meth_templ(self, x, z):          # self: [fred(A)], x: [B]r, z: [int]
        y = x                            # [B]
        return y                         # [B]

    def hop(self, x):                    # self: [fred(A)], x: [A]r
        return x                         # [A]

a = fred()                               # [fred(int)]
a.x = 1                                  # [int]
a.bla()                                  # []

b = fred()                               # [fred(float)]
b.x = 1.0                                # [float]
b.bla()                                  # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_104 [
	^ '
class fred:                              # y: [int]*
    def __eq__(self, x):                 # self: [fred], x: [fred]
        return self.y == x.y             # [int]

a = fred()                               # [fred]
a.y = 1                                  # [int]
b = fred()                               # [fred]
b.y = 2                                  # [int]

print a == b                             # [int]
print a == a                             # [int]
print b == b                             # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_105 [
	^ '
def bla():
    return x, y                          # [tuple2(int, int)]

def blu():
    global x
    x = 2                                # [int]

y = 2                                    # [int]
blu()                                    # []
print bla()                              # [tuple2(int, int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_106 [
	^ '
def escapement():
    a = vars1()                          # [list(int)]
    return a                             # [list(int)]

def vars1():
    return [1,2]                         # [list(int)]

x = escapement()                         # [list(int)]
y = escapement()                         # [list(int)]
y.append(3)                              # []
print x                                  # [list(int)]


def escapement2():
    bla(vars3())                         # []

def bla(x):                              # x: [list(int)]*
    global bye
    bye = x                              # [list(int)]

def vars3():
    return [1]                           # [list(int)]

def joink():
    x = vars3()                          # [list(int)]

escapement2()                            # []
bye.append(2)                            # []
joink()                                  # []
print bye                                # [list(int)]


def transitive():
    a = vars2()                          # [list(int)]
    hoi()                                # []
    print a                              # [list(int)]

def vars2():
    return [1,2]                         # [list(int)]

def hoi():
    a = vars2()                          # [list(int)]
    a.append(3)                          # []

transitive()                             # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_107 [
	^ '
n = 8                                    # [int]
count = 0                                # [int]

f = 1                                    # [int]
s = 1                                    # [int]
nums = []                                # [list(tuple2(int, int))]
while n > 0:                             # [int]
   count += 1                            # [int]
   nums.append((count, f))               # []
   temp = f                              # [int]
   f = s                                 # [int]
   s = temp + s                          # [int]
   n -= 1                                # [int]
print nums                               # [list(tuple2(int, int))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_108 [
	^ '
t = (1,2,3)                              # [tuple(int)]
v = (1,)                                 # [tuple(int)]
w = (1,2,3)                              # [tuple(int)]

e = {}                                   # [dict(tuple(int), int)]
e[t] = 1                                 # [int]
e[v] = 2                                 # [int]
e[w] = 3                                 # [int]

print e[t], e[v], e[w]                   # [int], [int], [int]


'
]

{ #category : #resources }
PythonParserTests >> source_test_109 [
	^ '
board = 1                                # [int]

def best_move(board):                    # board: [int]
    max_move = (1,2)                     # [tuple2(int, int)]
    max_mobility = 1                     # [int]

    return max_move, max_mobility        # [tuple2(tuple2(int, int), int)]

move, mob = best_move(board)                 # [tuple2(tuple2(int, int), int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_11 [
	^ '
class fred:                              # a: []
    def huh(self):                       # []
        self.a = 1                       # [int]

a = fred()                               # [fred]
a.huh()
b = a.a                                  # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_110 [
	^ '
def row_perm_rec(numbers):               # numbers: [list(int)]
    range(numbers[0])                    # [list(int)]

puzzlecolumns = [[7]]                    # [list(list(int))]
puzzlerows = [[8]]                         # [list(int)]

[''u'']                          # [list(str)]

row_perm_rec(puzzlerows[0])                 # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_111 [
	^ '
a = (1,2)                                # [tuple(int)]
b = (1,2,3)                              # [tuple(int)]

c = a                                    # [tuple(int)]
c = b                                    # [tuple(int)]

d = a+b                                  # [tuple(int)]
print d                                  # [tuple(int)]

def bla(x):                              # x: [A]
    pass

bla(a)                                   # []
bla(b)                                   # []
bla([1,2,3])                               # []

dc = {}                                  # [dict(tuple(int), int)]
dc[a] = 2                                # [int]
dc[b] = 3                                # [int]

print a, dc[a], b, dc[b]                 # [tuple(int)], [int], [tuple(int)], [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_112 [
	^ '
def row_perm_rec(numbers):               # numbers: [list(int)]
        hoppa_row = []                   # []
        hoppa_row = [''.'']                # [list(str)]

def solve_row(numbers, old_row):                  # numbers: [list(int)]
    old_row.append(''u'')

    row_perm_rec(8)                # []


puzzlerows = [[2]]                       # [list(list(int))]

puzzleboard = [['''']]                     # [list(list(str))]

solve_row(17, puzzleboard[0])                 # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_113 [
	^ '
a = [1,2,3]                              # [list(int)]

print a[0], a[1], a[-2], a[-1]           # [int], [int], [int], [int]

d = {-1: 2}                              # [dict(int, int)]

print d[-1]                              # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_114 [
	^ '
def bla():
    a = []                               # [list(int)]
    a.append(1)                          # []

    b = a                                # [list(int)]

    a = []                               # [list(int)]
    a.append(2)                          # []

    print b                              # [list(int)]

bla()                                    # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_115 [
	^ '
d = (1, (1.1, ''u''))

a, (b, c) = d
e, f = d


for x,(y,z) in [d]:
    x
    y
    z

l = [((v,u),w) for u,(v,w) in [d]]
print ''uh'', ''%.2f %d'' % l[0][0], l[0][1], len(l)


'
]

{ #category : #resources }
PythonParserTests >> source_test_118 [
	^ '
class node:                              # activation: [int]*
    def __init__(self, euh, input):      # self: [node], euh: [int], input: [list(int)]
        pass

d = [11]                                 # [list(int)]
e = [12]                                 # [list(int)]

x = []                                   # [list(int)]
y = x                                    # [list(int)]
#a = node(1, y)                           # [node]
b = node(2, d)                           # [node]
c = node(3, e)                           # [node]


'
]

{ #category : #resources }
PythonParserTests >> source_test_119 [
	^ '
a = [1,2,3,4,5]                          # [list(int)]

print a[:-1]                             # [list(int)]
print a[1:3]                             # [list(int)]
print a[::]                              # [list(int)]
print a[:3:]                             # [list(int)]
print a[::-1]                            # [list(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_12 [
	^ '
class integer:
    def __gt__(self, b):
        return True
    def __repr__(self):
        return ''integer!''

def maxi(a, b):                           # [integer], [integer]
    if a > b:                            # [bool]
        return a                         # [integer]
    return b                             # [integer]

a = integer()                            # [integer]
b = integer()                            # [integer]
c = maxi(a, b)                            # [integer]
d = a > b                                # [bool]
print a, b, c, d

'
]

{ #category : #resources }
PythonParserTests >> source_test_120 [
	^ '
l = [(b,a) for a,b in enumerate([1,2,3])] # [list(tuple(int))]
print l                                  # [list(tuple(int))]

for a,b in enumerate([1.1,2.2,3.3]):     # [tuple2(int, float)]
    print ''huhu'', a, ''%.1f'' % b                   # [str], [int], [float]

def bla():
    return (''1'',2.2)                     # [tuple2(str, float)]

x,y = bla()                              # [tuple2(str, float)]
z,v = bla()                              # [tuple2(str, float)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_122 [
	^ '
# (c) Mark Dufour
# --- mark.dufour@gmail.com

import random
random.seed(42)
from math import sqrt, e

sigmoid = lambda x: pow((1+pow(e,-x)),-1) # [lambda0]
deriv = lambda x: pow(e,-x) * pow((1+pow(e,-x)),-2) # [lambda0]

class link:                             # in_node: [node], weight: [float], activation: [], out_node: [node], delta: [], input: [], output: [], unit: []
    def __init__(self, in_node, out_node): # self: [nlink], in_node: [node]*, out_node: [node]*
        self.in_node = in_node; self.out_node = out_node # [node]
        self.weight = (random.random()-0.5)/2  # [float]

class node:                              # in_node: [], weight: [], activation: [float], out_node: [], delta: [float], output: [list(nlink)], input: [list(nlink)], unit: []
    def __init__(self, input_nodes):     # self: [node], input_nodes: [list(node)]
        self.input, self.output = [], []    # [list(nlink)], [list(nlink)]
        for node in input_nodes:         # [list(node)]
            l = link(node,self)         # [nlink]
            self.input.append(l)         # []
            node.output.append(l)        # []

def incoming(node): return sum([link.in_node.activation * link.weight for link in node.input]) # [float]

def neural_network_output(network, input): # network: [list(list(node))], input: [list(int)]
    # set input layer activations
    for index, node in enumerate(network[0]): # [tuple(int, node)]
        node.activation = input[index]   # [int]

    # forward propagate output
    for layer in network[1:]:            # [list(list(node))]
        for node in layer:               # [list(node)]
            node.activation = sigmoid(incoming(node)) # [float]

    return [node.activation for node in network[-1]] # [list(float)]

def back_propagate_error(network, answer): # network: [list(list(node))], answer: [list(int)]
    #output = [node.activation for node in network[-1]] # [list(float)]

    # output layer deltas
    for index, node in enumerate(network[-1]): # [tuple(int, node)]
        node.delta = deriv(incoming(node)) * (answer[index] - node.activation) # [float]

    # backward propagate error
    for layer in network[-2::-1]:        # [list(list(node))]
        for node in layer:               # [list(node)]
            node.delta = deriv(incoming(node)) * sum([link.out_node.delta * link.weight for link in node.output]) # [float]
            for link in node.output:     # [list(nlink)]
                link.weight += alpha * node.activation * link.out_node.delta # [float]

def append_error(network, examples):     # network: [list(list(node))], examples: [list(tuple(list(int)))]
    compare = [(neural_network_output(network, example)[0], answer[0]) for example, answer in examples] # [list(tuple(float, int))]
    errors.append(sqrt((1.0/len(examples))*sum([pow(answer-output,2) for output, answer in compare]))) # [tuple(float, int)]

def train_network(network, examples, epochs): # network: [list(list(node))], examples: [list(tuple(list(int)))], epochs: [int]
    global errors
    errors = []                          # [list(float)]
    append_error(network, examples)      # []

    for epoch in range(epochs):          # [list(int)]
        for example, answer in examples: # [tuple(list(int))]
            output = neural_network_output(network, example) # [list(float)]
            back_propagate_error(network, answer) # []
            #print_weights(network)

        append_error(network, examples)         # []

#def print_weights(network):
#    for number, layer in enumerate(network[-2::-1]):
#        print ''layer'', number
#        for node in layer:
#           print [link.weight for link in node.output]

alpha = 0.5                              # [float]

input_layer = [node([]) for n in range(10)] # [list(node)]
hidden_layer = [node(input_layer) for n in range(4)] # [list(node)]
output_layer = [node(hidden_layer) for n in range(1)] # [list(node)]

network = [input_layer, hidden_layer, output_layer] # [list(list(node))]

examples = [ ([1,0,0,1,1,2,0,1,0,0], [1]), # [list(tuple(list(int)))]
             ([1,0,0,1,2,0,0,0,2,2], [0]), # [tuple(list(int))]
             ([0,1,0,0,1,0,0,0,3,0], [1]),      # [list(int)]
             ([1,0,1,1,2,0,1,0,2,1], [1]),      # [tuple(list(int))]
             ([1,0,1,0,2,2,0,1,0,3], [0]),     # [tuple(list(int))]
             ([0,1,0,1,1,1,1,1,1,0], [1]),      # [tuple(list(int))]
             ([0,1,0,0,0,0,1,0,3,0], [0]),      # [list(int)]
             ([0,0,0,1,1,1,1,1,2,0], [1]),      # [list(int)]
             ([0,1,1,0,2,0,1,0,3,3], [0]),      # [list(int)]
             ([1,1,1,1,2,2,0,1,1,1], [0]),      # [list(int)]
             ([0,0,0,0,0,0,0,0,2,0], [0]),      # [list(int)]
             ([1,1,1,1,2,0,0,0,3,2], [1]) ]     # [list(int)]

epochs = 1000                            # [int]
train_network(network, examples, epochs) # []
for hup in [neural_network_output(network, example) for example, answer in examples]:
    print [(''%.2f''%hap) for hap in hup]

'
]

{ #category : #resources }
PythonParserTests >> source_test_123 [
	^ '
# (c) Jack Ha
# --- jack.ha@gmail.com

def validMove(puzzle, x, y, number):     # puzzle: [list(list(int))], x: [int], y: [int], number: [int]
        #see if the number is in any row, column or his own 3x3 square
        blnOK = True                     # [int]
        px = x / 3                       # [int]
        py = y / 3                       # [int]
        if puzzle[x][y] != 0:            # [int]
                blnOK = False            # [int]
        if blnOK:                        # []
                for i in range(9):       # [list(int)]
                        if puzzle[i][y] == number: # [int]
                                blnOK = False # [int]
        if blnOK:                        # []
                for j in range(9):       # [list(int)]
                        if puzzle[x][j] == number: # [int]
                                blnOK = False # [int]
        if blnOK:                        # []
                for i in range(3):       # [list(int)]
                        for j in range(3): # [list(int)]
                                if puzzle[px*3+i][py*3+j] == number: # [int]
                                        blnOK = False # [int]
        return blnOK                     # [int]

def findallMoves(puzzle,x,y):            # puzzle: [list(list(int))], x: [int], y: [int]
        returnList = []                  # [list(int)]
        for n in range(1,10):            # [list(int)]
                if validMove(puzzle, x, y, n): # [int]
                        returnList.append(n) # []
        return returnList                # [list(int)]

def solvePuzzleStep(puzzle):             # puzzle: [list(list(int))]
        isChanged = False                # [int]
        for y in range(9):               # [list(int)]
                for x in range(9):       # [list(int)]
                        if puzzle[x][y] == 0: # [int]
                                allMoves = findallMoves(puzzle, x, y) # [list(int)]
                                if len(allMoves) == 1: # [int]
                                        puzzle[x][y] = allMoves[0] # [int]
                                        isChanged = True # [int]
        return isChanged                 # [int]

#try to solve as much as possible without lookahead
def solvePuzzleSimple(puzzle):           # puzzle: [list(list(int))]
        iterationCount = 0               # [int]
        while solvePuzzleStep(puzzle) == True: # [int]
                iterationCount += 1      # [int]

hashtable = {}                           # [dict(int, int)]

def calc_hash(puzzle):                   # puzzle: [list(list(int))]
        hashcode = 0                     # [int]
        for c in range(9):               # [list(int)]
                hashcode = hashcode * 17 + hash(tuple(puzzle[c])) # [int]
        return hashcode                  # [int]

def hash_add(puzzle):                    # puzzle: [list(list(int))]
        hashtable[calc_hash(puzzle)] = 1 # [int]

def hash_lookup(puzzle):                 # puzzle: [list(list(int))]
        return hashtable.has_key(calc_hash(puzzle)) # [int]

#solve with lookahead
#unit is 3x3, (i,j) is coords of unit. l is the list of all todo''s
def perm(puzzle, i, j, l, u):            # puzzle: [list(list(int))], i: [int], j: [int], l: [list(int)], u: [list(tuple(int))]
        global iterations
        iterations += 1                  # [int]
        if (u == []) and (l == []):      # [int]
                print "Solved!"          # [str]
                #printpuzzle(puzzle)      # []
                print "iterations: ", iterations # [str], [int]
                return True              # [int]
        else:
                if l == []:              # [int]
                        #here we have all permutations for one unit

                        #some simple moves
                        puzzlebackup = [] # [list(tuple(int))]
                        for c in range(9): # [list(int)]
                                puzzlebackup.append(tuple(puzzle[c])) # []
                        solvePuzzleSimple(puzzle) # []

                        #next unit to fill
                        for c in range(len(u)): # [list(int)]
                                if not hash_lookup(puzzle): # [int]
                                        inew, jnew = u.pop(c) # [tuple(int)]
                                        l = genMoveList(puzzle, inew, jnew) # [list(int)]
                                        #only print new situations
                                        #print "inew, jnew, l, u:", inew, jnew, l, u # [str], [int], [int], [list(int)], [list(tuple(int))]
                                        #printpuzzle(puzzle) # []
                                        #print "iterations: ", iterations # [str], [int]
                                        if perm (puzzle, inew, jnew, l, u): # [int]
                                                return True # [int]
                                        else:
                                                hash_add(puzzle) # []
                                        u.insert(c, (inew, jnew)) # []

                        #undo simple moves
                        for y in range(9): # [list(int)]
                                for x in range(9): # [list(int)]
                                        puzzle[x][y] = puzzlebackup[x][y] # [int]
                        hash_add(puzzle) # []
                        return False     # [int]
                else:
                        #try all possibilities of one unit
                        ii = i * 3       # [int]
                        jj = j * 3       # [int]
                        for m in range(len(l)): # [list(int)]
                                #find first empty
                                for y in range(3): # [list(int)]
                                        for x in range(3): # [list(int)]
                                                if validMove(puzzle, x+ii, y+jj, l[m]): # [int]
                                                        puzzle[x+ii][y+jj] = l[m] # [int]
                                                        backup = l.pop(m) # [int]
                                                        if (perm(puzzle, i, j, l, u)): # [int]
                                                                return True # [int]
                                                        else:
                                                                hash_add(puzzle) # []
                                                        l.insert(m, backup) # []
                                                        puzzle[x+ii][y+jj] = 0 # [int]
                        return False     # [int]

#gen move list for unit (i,j)
def genMoveList(puzzle, i, j):           # puzzle: [list(list(int))], i: [int], j: [int]
        l = range(1,10)                  # [list(int)]
        for y in range(3):               # [list(int)]
                for x in range(3):       # [list(int)]
                        p = puzzle[i*3+x][j*3+y] # [int]
                        if p != 0:       # [int]
                                l.remove(p) # []
        return l                         # [list(int)]

def printpuzzle(puzzle):                 # puzzle: [list(list(int))]
        for x in range(9):               # [list(int)]
                s = '' ''                  # [str]
                for y in range(9):       # [list(int)]
                        p = puzzle[x][y] # [int]
                        if p == 0:       # [int]
                                s += ''.'' # [str]
                        else:
                                s += str(puzzle[x][y]) # [str]
                        s += '' ''         # [str]
                print s                  # [str]

def main():
        puzzle = [[0, 9, 3, 0, 8, 0, 4, 0, 0], # [list(list(int))]
                          [0, 4, 0, 0, 3, 0, 0, 0, 0], # [list(int)]
                          [6, 0, 0, 0, 0, 9, 2, 0, 5], # [list(int)]
                          [3, 0, 0, 0, 0, 0, 0, 9, 0], # [list(int)]
                          [0, 2, 7, 0, 0, 0, 5, 1, 0], # [list(int)]
                          [0, 8, 0, 0, 0, 0, 0, 0, 4], # [list(int)]
                          [7, 0, 1, 6, 0, 0, 0, 0, 2], # [list(int)]
                          [0, 0, 0, 0, 7, 0, 0, 6, 0], # [list(int)]
                          [0, 0, 4, 0, 1, 0, 8, 5, 0]] # [list(int)]

        #create todo unit(each 3x3) list (this is also the order that they will be tried!)
        u = []                           # [list(tuple(int))]
        lcount = []                      # [list(int)]
        for y in range(3):               # [list(int)]
                for x in range(3):       # [list(int)]
                        u.append((x,y))  # []
                        lcount.append(len(genMoveList(puzzle, x, y))) # []

        #sort
        for j in range(0,9):             # [list(int)]
                for i in range(j,9):     # [list(int)]
                        if i != j:       # [int]
                                if lcount[i] < lcount[j]: # [int]
                                        u[i], u[j] = u[j], u[i]
                                        lcount[i], lcount[j] = lcount[j], lcount[i]

        l = genMoveList(puzzle, 0, 0)    # [list(int)]
        perm (puzzle, 0, 0, l, u)        # [int]

iterations = 0                           # [int]
for x in range(30):
    main()                                   # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_124 [
	^ '
# A simple program to find the prime factors of a given number.
# (c) Rohit Krishna Kumar
# --- http://www.geocities.com/rohitkkumar

import math

def prime(n):                            # n: [int]
    if(n==1):                            # [int]
        return False                     # [int]
    if(n==2):                            # [int]
        return True                      # [int]
    if(not n%2):                         # [int]
        return False                     # [int]
    for i in range(3,int(math.sqrt(n))+1,2): # [list(int)]
        if(not n%i):                     # [int]
            return False                 # [int]
    return True                          # [int]

def factorize(n,l):                      # n: [int], l: [list(int)]
    for i in range(2,int(math.sqrt(n))+1): # [list(int)]
        if(not n%i):                     # [int]
            if(prime(i)):                # [int]
                l.append(i)              # []
            else:
                factorize(i,l)           # []
            if(prime(n/i)):              # [int]
                l.append(n/i)            # []
            else:
                factorize(n/i,l)         # []
            break

factors=[]                               # [list(int)]
n=''2079283419''                             # [int]
#raw_input("Number to factorize:")      # [str]
factorize(int(n),factors)                # []
print factors                            # [list(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_125 [
	^ '
print ''hello, world!''

for x in range(10,14):                   # [list(int)]
    print x**3                           # [int]

y = ''luis''                               # [str]
for i in y:                              # [str]
    print i                              # [str]

print [i*2 for i in ''luis'']              # [list(str)]

f = open(''testdata/hoppa'')                        # [file]
print ''lc'', [l for l in f]               # [str], [list(str)]
f.close()                                # []

f = open(''testdata/hoppa'')                        # [file]
print ''read'', f.read()                   # [str], [str]
f.close()                                # []

f = file(''testdata/hoppa'')                        # [file]
print ''lines'', f.readlines()             # [str], [list(str)]
f.close()                                # []

conv = {"A": 0, "B": 1}                  # [dict(str, int)]
print conv["A"], conv["B"]               # [int], [int]

print [{"A": 0, "B": 1}[c] for c in "ABABABA"] # [list(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_126 [
	^ '
# (c) Wensheng Wang

from math import sqrt

def primes(n):                           # n: [int]
   "primes(n): return a list of prime numbers <=n."

   if n == 2:                            # [int]
       return [2]                        # [list(int)]
   elif n<2:                             # [int]
       return []                         # [list(int)]
   s = range(3, n+2, 2)                  # [list(int)]
   mroot = n ** 0.5                      # [float]
   #mroot = sqrt(n)
   half = len(s)                         # [int]
   i = 0                                 # [int]
   m = 3                                 # [int]
   while m <= mroot:                     # [int]
       if s[i]:                          # [int]
           j = (m*m - 3) / 2             # [int]
           s[j] = 0                      # [int]
           while j < half:               # [int]
               s[j] = 0                  # [int]
               j += m                    # [int]
       i += 1                            # [int]
       m = 2 * i + 3                     # [int]
   if s[-1] > n:
       s[-1] = 0
   #return [2] + filter(None, s)
   return [2] + [x for x in s if x]      # [list(int)]

print primes(100)                        # [list(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_127 [
	^ '
print ''hello, world!''                    # [str]

l = ''luis gonzales''                      # [str]
print l[3:7]                             # [str]
print l[1::2]                            # [str]

t = (1,2,3,4,5)                          # [tuple(int)]
print t[1:4]                             # [tuple(int)]

s = ''we are testing shedskin on windows'' # [str]

d = {}                                   # [dict(str, int)]

for i in s:                              # [str]
    if not i in d:                       # []
        d[i]= 1                          # [int]
    else:
        d[i]= d[i] + 1                   # [int]

for k,v in d.items():                    # [tuple(str, int)]
    if k == '' '':
        print k, '':'', v                      # [str], [str], [int]

x=[]                                     # [list(dude)]

class dude:                              # age: [int], last: [str], name: [str]
    def __init__(self, name, last , age): # self: [dude], name: [str]*, last: [str]*, age: [int]*
        self.name = name                 # [str]
        self.last = last                 # [str]
        self.age = age                   # [int]
        x.append(self)                   # []
    def __repr__(self):                  # self: [dude]
        return ''%s %s is %s years old'' %(self.name, self.last, str(self.age)) # [str]

dude(''luis'',''gonzalez'',35)               # [dude]
print x[0]                               # [dude]

'
]

{ #category : #resources }
PythonParserTests >> source_test_128 [
	^ '
def main():
   ws = open("testdata/hoppa","r").read().split()
   d = {}
   for i, w in enumerate(ws):
       s = "".join(sorted(list(w.lower())))
       d.setdefault(s, []).append(i)
   for l in d.values():
       if len(l) > 1:
           print [ws[i] for i in l]

main()

def subsets(sequence):
   result = [[]] * (2**len(sequence))
   for i,e in enumerate(sequence):
       i2, el = 2**i, [e]
       for j in xrange(i2):
           result[j+i2] = result[j] + el
   return result

print subsets(range(4))


'
]

{ #category : #resources }
PythonParserTests >> source_test_129 [
	^ '
import sys

a = [(2,3),(3,2),(),(2,),(3,4,5),(2,2),(1,4),(4,1),(4,2),(4,3),(3,4),(4,4),(4,5),(1,5),(1,20),(20,1),(20,2)]
print sorted(a)

b = [[3,2],[1,3]]
print sorted(b)

c = [''b'',''c'',''aa'']
print sorted(c)

print sys.argv[1:]

if (0 or 0 or 1) and 1:
    print ''yay''

ah = ''hatsie flatsie pots''
print ah.split(), ah == '' ''.join(ah.split())

print ''hoei hoei''.split()
print ''hoei hoei\\n''.split()

print [''hoei\\n'']
print ''hoei\\n''

'
]

{ #category : #resources }
PythonParserTests >> source_test_13 [
	^ '
class fred:                              # thingy: [int]
    def hottum(self, x):                 # [fred], [str]
        b = 4                            # [int]
        return b                         # [int]

def hottum():
    pass

h = fred()                               # [fred]
c = h.hottum(''jo'')                       # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_130 [
	^ '
a = range(10)
b = a[1::3]
print b

del a[9]
print a
del a[1:3]
print a
del a[::2]
print a

d = {1: 4, 2: 5}
del d[1]
print d

'
]

{ #category : #resources }
PythonParserTests >> source_test_131 [
	^ '
# (c) Bearophile

import random
random.seed(42)
#from sets import Set

points = [ (random.random(), random.random()) for i in xrange(200) ]

def isntRightTurn(e):
    p0, p1 = e[-3]
    q0, q1 = e[-2]
    r0, r1 = e[-1]
    return q0*r1 + p0*q1 + r0*p1 >= q0*p1 + r0*q1 + p0*r1

def half(points):
    extrema = points[0:2]
    for p in points[2:]:
        extrema.append(p)
        while len(extrema)>2 and isntRightTurn(extrema):
            del extrema[-2]
    return extrema

points = sorted(set(points))
upper = half(points)
points.reverse()
lower = half(points)
print [(''%.2f'' % x, ''%.2f'' % y) for x, y in upper + lower[1:-1]]

'
]

{ #category : #resources }
PythonParserTests >> source_test_132 [
	^ '
# From: http://en.wikipedia.org/wiki/Eight_queens_puzzle

def n_queens(n, width):
    if n == 0:
        return [[]] # one solution, the empty list
    else:
        return add_queen(n-1, width, n_queens(n-1, width))

def add_queen(new_row, width, previous_solutions):
    solutions = []
    for sol in previous_solutions:
        for new_col in range(width):
            if safe_queen(new_row, new_col, sol):
                solutions.append(sol + [new_col])
    return solutions

def safe_queen(new_row, new_col, sol):
    for row in range(new_row):
        if (sol[row] == new_col or
            sol[row] + row == new_col + new_row or
            sol[row] - row == new_col - new_row):
                return 0
    return 1

n = 12
solutions = n_queens(n, n)
print len(solutions), "solutions."


'
]

{ #category : #resources }
PythonParserTests >> source_test_133 [
	^ '
def mandelbrot(max_iterations=1000):
    # By Daniel Rosengren, modified
    #   http://www.timestretch.com/FractalBenchmark.html
    # See also vectorized Python+Numeric+Pygame version:
    #   http://www.pygame.org/pcr/mandelbrot/index.php
    bailout = 16
    for y in xrange(-39, 39):
        line = []
        for x in xrange(-39, 39):
            cr = y/40.0 - 0.5
            ci = x/40.0
            zi = 0.0
            zr = 0.0
            i = 0
            while True:
                i += 1
                temp = zr * zi
                zr2 = zr * zr
                zi2 = zi * zi
                zr = zr2 - zi2 + cr
                zi = temp + temp + ci
                if zi2 + zr2 > bailout:
                    line.append(" ")
                    break
                if i > max_iterations:
                    line.append("#")
                    break
        print "".join(line)

for x in range(10):
    mandelbrot()

'
]

{ #category : #resources }
PythonParserTests >> source_test_134 [
	^ '
def pascal(n):
    """pascal(n): print n first lines of Pascal''s
    triangle (shortest version)."""
    r = [[1]]
    for i in xrange(1, n):
        r += [[1] + [sum(r[-1][j:j+2]) for j in range(i)]]
    return r

print pascal(9)

'
]

{ #category : #resources }
PythonParserTests >> source_test_135 [
	^ '
# Textual Voronoi code modified from: <abhishek@ocf.berkeley.edu>
# http://www.ocf.berkeley.edu/~Eabhishek/

import random # for generateRandomPoints
random.seed(42)
from math import sqrt

def generateRandomPoints(npoints=6):
    """Generate a few random points v1...vn"""
    print npoints, "points x,y:"
    points = []
    for i in xrange(npoints):
        xrand, yrand = random.random(), random.random()
        print ''%.2f'' % xrand, ''%.2f'' % yrand
        for xoff in range(-1, 2):
            for yoff in range(-1, 2):
                points.append( (xrand + xoff, yrand + yoff) )
    return points


def closest(x,y,points):
    """Function to find the closest of the vi."""
    best,good = 99.0*99.0, 99.0*99.0
    for px, py in points:
        dist = (x-px)*(x-px) + (y-py)*(y-py)
        if dist < best:
            best, good = dist, best
        elif dist < good:
            good = dist
    return sqrt(best) / sqrt(good)


def generateScreen(points, rows=40, cols=80):
    yfact = 1.0 / cols
    xfact = 1.0 / rows
    screen = []
    chars = " -.,+*$&#~~"
    for i in xrange(rows):
        x = i*xfact
        line = [ chars[int(10*closest(x, j*yfact, points))] for j in xrange(cols) ]
        screen.extend( line )
        screen.append("\n")
    return "".join(screen)


from time import clock
points = generateRandomPoints(10)
print
t1 = clock()
print generateScreen(points, 40, 80)
t2 = clock()
round(t2-t1, 3)
'
]

{ #category : #resources }
PythonParserTests >> source_test_136 [
	^ '
print ''hello, world!''

from random import *
x = 10*random()

from sys import stdin, stdout
for line in sorted(file(''testdata/words'')):
    print sorted(set(line.strip()))
#stdout.write(stdin.read())

print int(''12''), int(''ff'', 16), int(''20'', 8)
print ''%d %s %x'' % (255, ''255'', 255), ''%o'' % 10

char = 2
typedef = 3
typename = 4
std = 6
public = 7
template = 8
virtual = 9
static = 10
namespace = 11
using = 12
private = 13
protected = 14
new = 15
delete = 16

t = (1,2)
t2 = (1.0,2)

""" "\n\t" """
print """ "\n\t" """

print set({1:2})
aa = set()
aa.add(1); aa.add(2)
print aa.union(set([1,3]))

l = [1,2,3]
if l: print l
while l: print l.pop()

a, b = "ab"
print a, b
a, b, c, d, e = "abcde"
print a, b, c, d, e
a, b = tuple("ab")
print a, b
a, b, c, d, e = tuple("abcde")
print a, b, c, d, e

print max({1:2, 3:4})

s1 = set([1,2,3])
s2 = set([3,4,5])
print str(s1.copy())+'' - ''+str(s2.copy())+'' ='', s1.difference(s2), ''='', s1 - s2
s1.difference_update(s2)
s2.clear()
print s1, s2
s1.remove(1)
s1.discard(2)
print s1, s1.issubset(s2), set([2,1]).issubset(set([3,1,2,4]))
s1.update(set([1,2]))
print s1.issuperset(set([1]))

af = set([1,2,3])
print af.intersection(s1)
af.intersection_update(s1)
print af

s3 = set([3,2,1])
while s3: print s3.pop()


s6 = set(["a", "b", "c"])

assert not s6.isdisjoint(s6)
assert not s6.isdisjoint(["a"])
assert s6.isdisjoint(["d"])

import random as rr
from random import randint as ri
#print rr.randint(0,0), rr.randint(0,2), ri(8, 12)

def union(): pass
union()

for (i,ee) in reversed(list(enumerate(reversed([1,2,3])))):
    print i, ee

print set([1,2,3]).symmetric_difference(set([2,3,4]))

###################################################################
sa1 = set([1,2,3])
sa2 = set([3,4,5])
sa3 = set([4,5,6])

assert sa1.difference(sa2) == set([1, 2])
assert sa1.difference(sa3) == sa1
assert sa1.difference([1, 2, 3]) == set([])
assert sa2.difference([4, 5, 6]) == set([3])

assert sa1.intersection([4, 5, 6]) == set([])
assert sa1.intersection([3, 4, 5, 6]) == set([3])

sa4 = set(["a", "b", "d"])
sa5 = set(["d", "e", "f"])

assert sa4.intersection(sa5) == sa4.intersection(["d", "e", "f"])
###################################################################

print {1:2, 2:3}.copy()

ff = file(''testdata/bla'',''w'')
print >>ff, ''niet op scherm''
print >>file(''testdata/bla2'',''w''), ''huhuhu''

ss = "abcdefghijklmnopqrst"; print ss[2:9:2]
mm = [""]; print ["*" for c in mm if c]

print "yxxy".split("x")
print "   ".split(" ")
print "hopplop".split("op")
print "x\t\nxxx\r".split()

class CNF:
    def CNF(self):
        print ''CNF''

cnf = CNF()
cnf.CNF()

class Tester:
    def __init__(self):
        self.data = None
    def isempty(self):
        return self.data is None

Tester().isempty()

class void:
    def bla(self): pass
vv = void(); vv.bla()

def mapp():
    allchr = [chr(c) for c in xrange(256)]
    return allchr
print mapp()[-10:]

ap = set([1])
bp = set([2])
print ap > bp, ap >= bp, ap == bp, ap != bp, [2,3] <= [1,2,3]
print sorted([[3],[2,1],[4,5,6]])

class Test:
    def __init__(self):
        self.n = 5
        print [i for i in range(self.n)]
test = Test()

print sum([1,2,3])
print sum([1,2,3],4)
print sum([[1],[2],[3,4]], [0])
print sum([[1],[2],[3,4]], [])

print dict.fromkeys([1,2,3])
print dict.fromkeys([1,2,3])

print dict.fromkeys([1,2,3], 7)
print dict.fromkeys([1,2,3], 4.0)
print dict.fromkeys([1,2,3], ''string'')

if 4 > 2 > 1:
    print ''hoihoi''
print 1 <= 2 == 2
if 1<2: print ''1<2''

class fred:
    def __eq__(self, b):
        return True
fr = fred()

if fr == fr:
    print ''fred = fred''
# the following line should give a warning
if fr == fr == fr:
    print ''fred = fred = fred''

mmt = mma, mmb = 3, 4
print mmt, mma, mmb

mmc = mmd = mme = 1
print mmc, mmd, mme

mmf = mmg = mmh = 9*mma
print mmf, mmg, mmh

mma = 9
from math import sqrt
mmi = mmj = sqrt(mma)
print int(mmi), int(mmj)

mma, mmb = mmb, mma
print mma, mmb

mma, mmb = 1, 2
print mma, mmb

mmt = 1, 2
mma, mmb = mmt
print mmt, mma, mmb

mma,mmb = mmt = mmc,mmd = 1,2
print mma, mmb

mma, mmb = mmb, mma = 1, 2
print mma, mmb

meuk = [1,2]
mma, mmb = meuk
print mma, mmb

mmx = [1,2]
print mmx


from sys import exit
exit()
exit(-1)

'
]

{ #category : #resources }
PythonParserTests >> source_test_137 [
	^ '
class node:
    def __init__(self):
        self.input = [8]

def incoming(node):
    return [link for link in node.input]

print incoming(node())

'
]

{ #category : #resources }
PythonParserTests >> source_test_138 [
	^ '
x = [0,1]
i, x[i] = 1, 2
print x

from math import *
sin(pi)

print repr(''    ''.strip())

print ''a\vb''.split()

s1={1:"a",2:"b"}; s2={1:"a",2:"b"}; print s1 == s2, s1 != s2

print "ab cd\tef\ngh\ril\vmn\fop".split()

a=2; b=3; print bool(a==b)

def test():
    s1, s2 = "ab", "AB"
    alist = ["_"] * 2
    for pos in range(2):
        alist[ord(s1[pos])-ord(''a'')] = s2[pos]
    return alist
print test()

def f(s): return [s[0] for j in xrange(1)]

print [(i,j+k) for (k,j) in enumerate(xrange(3)) for i in xrange(j) for z in range(2)]

print "a".join(["a","b"])
"".join(set(["he", "oh"]))
"**".join({" oh":1, "he":0})


'
]

{ #category : #resources }
PythonParserTests >> source_test_139 [
	^ '
def gen():
    m = []
    l = [1]
    m.append(l)

    return m

m = gen()
print m

z=1 and 1

a = range(10)
a.__delslice__(1,4)
print a

import copy

b=[[0,1]]

c=copy.deepcopy(b)
c[0].pop(0)

print c, b

AH = [1,2]
print [[1 for x in AH] for y in AH]

for x in xrange(2,1,-1):
    print x

print []*10

a = range(5); del a[0:2]; print a

class Individual:
    def __init__(self, ngenes): self.genome = [True] * ngenes
individual = Individual(3)
individual.genome[1] = not individual.genome[1]
print individual.genome

#d,e = -1e500, 1e500; print d, e

if not (1==2 or 2==3):
    print ''jammer''

class wahoe:
    def hoe(self):
        for self.smurf in range(3):
            print self.smurf

wahoe().hoe()

def fun():
    global aa
    aa += 1
    return 200
aa = 1
print aa
print 97 <= fun() <= 122
print aa
print 200 == fun() == 150
print aa

def true(): return True

print true() == true() in [True]
print 1 < 2 < 3 < 4

print ''hash(l)'', [hash(i) for i in xrange(3)]
#print ''hash(float(l))'', [hash(float(i)) for i in xrange(3)] XXX difference
[hash(float(i)) for i in xrange(3)]

class Toggle:
    def __init__(self, start_state):
        self.bool = start_state
    def value(self):
        return(self.bool)
    def activate(self):
        self.bool = not self.bool
        return(self)
t = Toggle(True)
print t.value()
t.activate()
print t.value()

print [None for i in xrange(3)]

maxint = 2147483647
minint = -maxint-1
print maxint
print minint

s1 = set((1,2,3)); s4 = set([1,4]); print s4 > s1, s4 >= s1

#python 2.4
#print set([1,2,3]).issubset((1,2,3))
#print set([1,2,3]).issuperset((1,2,3))

s1 = set((1,2,3)); s2 = set([1,4]); print sorted(set((1,2,3)) & set([1,4]))
s1 = set((1,2,3)); s2 = set([1,4]); s3 = set([5]); print sorted(s1 | s2 | s3) # associativity
print sorted(set([1,2]).union((2,)).union([3]))
s5 = set("abcd"); s6 = set("cdef"); print sorted(s5 ^ s6) # mixing
print

s1 &= s2
print sorted(s2)
s1 -= s2
print sorted(s1)
s1 ^= s2
print sorted(s1)

s7 = set([(1,2),(1,3),(1,4)])
s7 |= set([(1,6)]) # not (1,6)
print sorted(s7)

ah = [(2.1, 4), (1.0, 9), (1.0, 7)]
ah.sort()
print [''%.2f %d'' % trt for trt in ah]

p, q, r = set(''ab''), set(''abcde''), set(''def'')
print q <= q, q > r, q >= r

y = ("a", "b", "c")
zed = "a"
print zed is y[0]

class Printer:
    def __str__(self): return "10"
    def __repr__(self): return "20"
pr = Printer(); print Printer(), pr, repr(pr)

class Printer2:
    def __repr__(self): return "20"
print Printer2(), repr(Printer2())

class Printer3:
    pass

#print Printer3()

def test(): pass
print test()

l = []; print [l.append(i%2) for i in xrange(5)]

def test2(x):
    if x:
        return (1,"a")
print test2(1)
print test2(0)

uh = [1]
uh = None
print uh

def fun3(): a = 1
result = fun3()
print result

s = dict.fromkeys(xrange(2))
for i in xrange(2):
    if i in s: print "*"

b2 = 3; b2 *= 1.5; print ''%.1f'' % b2

class A:
  def __init__(self, a): self.a = a
  def __add__(self, V): return A(self.a+V.a)
  def __mul__(self, n): return A(self.a*n)

v = A(1); v += A(2); print v.a
v = A(1) + A(2); print v.a
print (v * 2).a
v *= 2; print v.a

def mut1(aap=[1]):
    aap.append(2)
    print aap
mut1(); mut1(); mut1()

def mut2(a=None):
    if a is None:
        a = []
    print a
    a.append("*")
mut2(); mut2(); mut2()

def fun2(a, b=4, c=''1''):
    return (a+b)*c
print fun2(c=''2'', a=3, b=4), fun2(a=1, b=2, c=''8'')

def fun4(a, b=7, c=''1'', d=1, e=1.0):
    print a, b, c, d, int(e)

fun4(1,2,e=2.0,c=''8'')


'
]

{ #category : #resources }
PythonParserTests >> source_test_140 [
	^ '
class father(object):
    def __init__(self,a):
        self.a=a
        b=1
    def f(self,x):
            return x*self.a

class son(father):
    def g(self,x):
        return x*self.a*self.a

myfather=father(3)
print myfather.f(4)
myson=son(4)
print myson.g(5)

class mother(object):
    def __init__(self,a):
        self.a=a
        b=1
    def f(self,x):
            return x*self.a

class daughter(mother):
    def g(self,x):
        return x*self.a*self.a

mydaughter = daughter(4)
print mydaughter.g(5)


'
]

{ #category : #resources }
PythonParserTests >> source_test_141 [
	^ '
class renderobject:
        def __init__(self, shader):
                self.shader=shader

class plane(renderobject):
        def __init__(self,plane,dist,shader):
                renderobject.__init__(self,shader)
                self.plane=plane
                self.dist=dist

class sphere(renderobject):
        def __init__(self, pos, radius, shader):
                renderobject.__init__(self,shader)
                self.pos=pos
                self.radius=radius

class world:
    def __init__(self):
        self.objects = []

w = world()
w.objects.append(plane(6,7,8))
w.objects.append(sphere(6,7,8))

'
]

{ #category : #resources }
PythonParserTests >> source_test_142 [
	^ '
class renderobject: pass
class plane(renderobject): pass
class sphere(renderobject): pass

class light:
    def hoei(self): print ''hoei!''

class parallellight(light): pass
class pointlight(light): pass

objects = []
objects.append(plane())
objects.append(sphere())

lights = []
lights.append(parallellight())
lights.append(pointlight())

lights[0].hoei()

'
]

{ #category : #resources }
PythonParserTests >> source_test_143 [
	^ '
class renderobject:
        def intersect(self,l):
                return "none", (l, l)

class plane(renderobject):
        def intersect(self,l):
                return "one", (l, l)

class sphere(renderobject):
    def intersect(self,l):
        return "none", (l, l)

p = plane()
s = sphere()

print p.intersect(1)
print s.intersect(2)

meuk = [p, s]
for obj in meuk:
    print obj.intersect(1)

'
]

{ #category : #resources }
PythonParserTests >> source_test_144 [
	^ '
class huhuhu:
    pass

obj = huhuhu()
if obj is obj:
    print ''ok1''
if obj is not None:
    print ''ok2''

obj = None
if obj is None:
    print ''ok3''
if obj == None:
    print ''ok4''
if obj is not None:
    print ''bad''
if obj != None:
    print ''bad''

if not obj:
    print ''ok5''

bla = "hoei"
if bla == ''hoei'':
    print ''ok6''
if bla is ''hoei'':
    print ''ok7''
if bla != ''meuk'':
    print ''ok8''
if bla is not ''meuk'':
    print ''ok9''

'
]

{ #category : #resources }
PythonParserTests >> source_test_146 [
	^ '
class C1:
  def m1(self): self.a1 = 1
  def m2(self): self.a2 = 2
class C2(C1):
  def m2(self): self.a = 3
class C3(C2):
  def m2(self): self.a2 = 4
c3 = C3()
c3.m1()
c3.m2()
print c3.a1, c3.a2

'
]

{ #category : #resources }
PythonParserTests >> source_test_147 [
	^ '
class meuk: pass

try:
    raise meuk()
    print ''bad!''
except meuk:
    print ''ok!''
except int:
    print ''bad..''

try:
    assert 1 == 0
except AssertionError:
    print ''crap!''

def crapfunction():
    a,b,c=1,2,3
    assert a > b < c, "the universe won''t collapse"
try:
    crapfunction()
except AssertionError, msg:
    print ''more crap!'', msg

class ueuk:
    def __init__(self, msg):
        self.msg = msg
    def __repr__(self):
        return ''ueukrepr!''

#try:
#    raise ueuk, ''aha! error.''
#except ueuk, x:
#    print x.msg

try:
    raise ueuk(''aha! error.'')
except ueuk, x:
    print x

try:
    hum = [1,2,3]
    print hum.index(4)
except ValueError:
    print ''exceptions are stupid :D''

try:
    raise ValueError(''exceptions are stupid :D'')
except ValueError, y:
    print y

try:
    {1:2}[3]
except KeyError, z:
    print ''bah!'', z

try:
    [1].index(2)
except ValueError, v:
    print ''hah''


'
]

{ #category : #resources }
PythonParserTests >> source_test_148 [
	^ '
# (c) Peter Goodspeed
# --- coriolinus@gmail.com

#import random
from math import exp
#from sets import Set
#set = Set

#functions
def sigmoid(x):
        return float(1)/(1 + exp(-x))

def sig(x, xshift=0, xcompress=1):
        return 0 + (1 * sigmoid(xcompress * (x - xshift)))

#exceptions
class SpaceNotEmpty(Exception):
        pass

class MultiVictory(Exception):
        def __init__(self, victorslist):
                self.victors = victorslist

#classes
class rectBoard(object):
        def __init__(self, edge=3):
                self.edge = edge
                self.__board = [edge * [0] for i in xrange(edge)]
                self.__empty = edge**2

        def assign(self, row, col, value):
                if(self.__board[row][col] == 0):
                        self.__board[row][col] = value
                        self.__empty -= 1
                else:
                        raise SpaceNotEmpty()

        def isfull(self):
                return self.__empty == 0

        #def valueof(self, row, col):
        #        return self.__board[row][col]

        def isvictory(self):
                victors = []
                #examine rows
                for row in self.__board:
                        if len(set(row)) == 1:
                                if row[0] != 0: victors.append(row[0])

                #examine cols
                for i in xrange(self.edge):
                        col = [row[i] for row in self.__board]
                        if len(set(col)) == 1:
                                if col[0] != 0: victors.append(col[0])

                #examine diagonals
                #left diagonal
                ld = []
                for i in xrange(self.edge): ld.append(self.__board[i][i])
                if len(set(ld)) == 1:
                        if ld[0] != 0: victors.append(ld[0])

                #right diagonal
                rd = []
                for i in xrange(self.edge): rd.append(self.__board[i][self.edge-(1+i)])
                if len(set(rd)) == 1:
                        if rd[0] != 0: victors.append(rd[0])

                #return
                if len(victors) == 0:
                        return 0
                if len(set(victors)) > 1:
                        raise MultiVictory(set(victors))
                return victors[0]

        def __str__(self):
                ret = ""
                for row in xrange(self.edge):
                        if row != 0:
                                ret += "\n"
                                for i in xrange(self.edge):
                                        if i != 0: ret += ''+''
                                        ret += "---"
                                ret += "\n"
                        ret += " "
                        for col in xrange(self.edge):
                                if col != 0: ret += " | "
                                if self.__board[row][col] == 0: ret += '' ''
                                else: ret += str(self.__board[row][col])
                return ret

        def doRow(self, fields, indices, player, scores):
                players = set(fields).difference(set([0]))

                if(len(players) == 1):
                        if list(players)[0] == player:
                                for rown, coln in indices:
                                        scores[rown][coln] += 15 * sig(fields.count(player) / float(self.edge), .5, 10)
                        else:
                                for rown, coln in indices:
                                        scores[rown][coln] += 15 * fields.count(list(players)[0]) / float(self.edge)

        def makeAImove(self, player):
                scores = [self.edge * [0] for i in xrange(self.edge)]

                for rown in xrange(self.edge):
                        row = self.__board[rown]
                        self.doRow(row, [(rown, i) for i in xrange(self.edge)], player, scores)

                for coln in xrange(self.edge):
                        col = [row[coln] for row in self.__board]
                        self.doRow(col, [(i, coln) for i in xrange(self.edge)], player, scores)

                indices = [(i, i) for i in xrange(self.edge)]
                ld = [self.__board[i][i] for i in xrange(self.edge)]
                self.doRow(ld, indices, player, scores)
                #also, because diagonals are just more useful
                for rown, coln in indices:
                        scores[rown][coln] += 1

                #now, we do the same for right diagonals
                indices = [(i, (self.edge - 1) - i) for i in xrange(self.edge)]
                rd = [self.__board[i][(self.edge - 1) - i] for i in xrange(self.edge)]
                self.doRow(rd, indices, player, scores)
                #also, because diagonals are just more useful
                for rown, coln in indices:
                        scores[rown][coln] += 1

                scorelist = []
                for rown in xrange(self.edge):
                        for coln in xrange(self.edge):
                                if(self.__board[rown][coln] == 0):
                                        scorelist.append((scores[rown][coln],(rown,coln)))
                scorelist.sort()
                scorelist.reverse()
                #print scorelist
                scorelist = [x for x in scorelist if x[0] == scorelist[0][0]]

                #return random.choice([(x[1], x[2]) for x in scorelist])

                #scorelist = [(random.random(), x[1],x[2]) for x in scorelist]
                #scorelist.sort()

                return (scorelist[0][1][0], scorelist[0][1][1])


def aigame(size=30, turn=1, players=2):
        b = rectBoard(size)

        while((not b.isfull()) and (b.isvictory() == 0)):
                if(turn==1):
                        #player turn
                        #print
                        #print b
                        r, c = b.makeAImove(turn)
                        b.assign(r,c,1)
                        turn = 2
                else:
                        #computer turn
                        r, c = b.makeAImove(turn)
                        b.assign(r,c,turn)
                        if(turn == players): turn = 1
                        else: turn += 1
        #print
        #print b.__str__()
        #print
        if(b.isvictory() == 0):
                print "Board is full! Draw!"
        else:
                print "Victory for player "+str(b.isvictory())+"!"

aigame()

'
]

{ #category : #resources }
PythonParserTests >> source_test_15 [
	^ '
class xevious:                           # y: [int]*, z: [str]*
    def solvalou(self, x):               # x: [int]*, self: [xevious_str]
        return x                         # [int]

def pacman(a):                           # a: [int]
    return 1                             # [int]

def qbert():                             # a: [int], c: [int], b: [int]*, e: [int]*, d: [int]*, x: [xevious_str]
    c = 1                                # [int]
    a = 1                                # [int]
    pacman(a)                            # [int]
    b = 1                                # [int]
    a = c                                # [int]
    d = 1                                # [int]
    e = 1                                # [int]
    x = xevious()                        # [xevious_str]
    x.y = d                              # [int]
    x.z = ''hoi''                          # [str]
    x.solvalou(e)                        # [int]

    return b                             # [int]

qbert()                                  # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_150 [
	^ '
# (c) Bearophile

from random import random, randint, choice
from math import sin, pi
from copy import copy

infiniteNeg = -1e302


class Individual:
    def __init__(self, ngenes):
        self.ngenes = ngenes
        self.genome = [random()<0.5 for i in xrange(ngenes)]
        self.fitness = infiniteNeg
    def bin2dec(self, inf=0, sup=0): # Sup has to be None, SS workaround *************
        if sup == 0: sup = self.ngenes - 1 # if sup is None: ...
        result = 0
        for i in xrange(inf, sup+1):
            if self.genome[i]:
                result += 1 << (i-inf)
        return result
    def computeFitness(self):
        self.fitness = self.fitnessFun(self.computeValuesGenome())
    def __repr__(self):
        return "".join([str(int(gene)) for gene in self.genome])

    def fitnessFun(self, x):
        return x + abs(sin(32*x))
    def computeValuesGenome(self, xMin=0, xMax=pi):
        scaleFactor = (xMax-xMin) / (1<<self.ngenes)
        return self.bin2dec() * scaleFactor


class SGA:
    def __init__(self):
        self.popSize = 200            # Ex. 200
        self.genomeSize = 16          # Ex. 16
        self.generationsMax = 16      # Ex. 100
        self.crossingOverProb = 0.75  # In [0,1] ex. 0.75
        self.selectivePressure = 0.75 # In [0,1] ex. 0.75
        self.geneMutationProb = 0.005  # Ex. 0.005

    def generateRandomPop(self):
        self.population = [Individual(self.genomeSize) for i in xrange(self.popSize)]

    def computeFitnessPop(self):
        for individual in self.population:
            individual.computeFitness()

    def mutatePop(self):
        nmutations = int(round(self.popSize * self.genomeSize * self.geneMutationProb))
        for i in xrange(nmutations):
            individual = choice(self.population) # don''t forget to import choice too :D
            gene = randint(0, self.genomeSize-1)
            individual.genome[gene] = not individual.genome[gene] # this was a type inference problem.. thanks for detecting it! :) the aux variable you used, btw.. was polymorphic, both boolean and Individual

    def tounamentSelectionPop(self):
        pop2 = []
        for i in xrange(self.popSize):
            individual1 = choice(self.population)
            individual2 = choice(self.population)
            if random() < self.selectivePressure:
                if individual1.fitness > individual2.fitness:
                    pop2.append(individual1)
                else:
                    pop2.append(individual2)
            else:
                if individual1.fitness > individual2.fitness:
                    pop2.append(individual2)
                else:
                    pop2.append(individual1)
        return pop2 # fixed

    def crossingOverPop(self):
        nCrossingOver = int(round(self.popSize * self.crossingOverProb))
        for i in xrange(nCrossingOver):
            ind1 = choice(self.population)
            ind2 = choice(self.population)
            crossPosition = randint(0, self.genomeSize-1)
            for j in xrange(crossPosition+1):
                ind1.genome[j], ind2.genome[j] = ind2.genome[j], ind1.genome[j]

    def showGeneration_bestIndFind(self):
        fitnessTot = 0.0
        bestIndividualGeneration = self.population[0]
        for individual in self.population:
            fitnessTot += individual.fitness
            if individual.fitness > bestIndividualGeneration.fitness:
                bestIndividualGeneration = individual
        if self.bestIndividual.fitness < bestIndividualGeneration.fitness:
            self.bestIndividual = copy(bestIndividualGeneration) # shallow copies should work now..


    def run(self):
        self.generateRandomPop()
        self.bestIndividual = Individual(self.genomeSize)
        for self.generation in xrange(1, self.generationsMax+1): # works now
            self.computeFitnessPop()
            self.showGeneration_bestIndFind()
            self.population = self.tounamentSelectionPop()
            self.mutatePop()
            self.crossingOverPop()

sga = SGA()
sga.generationsMax = 3000
sga.genomeSize = 20
sga.popSize = 30
sga.geneMutationProb = 0.01
sga.run()

'
]

{ #category : #resources }
PythonParserTests >> source_test_151 [
	^ '
# (c) Dave Griffiths
# --- http://www.pawfal.org/index.php?page=PyGmy

from math import sin, cos, sqrt
import random, sys

def sq(a):
    return a*a


def conv_value(col):
    if col >= 1.0:
        return "255"
    elif col <= 0.0:
        return "0"
    else:
        return str(int(col*255.0))


class Shaderinfo:
    pass


class vec:
    def __init__(self, x, y, z):
        self.x = float(x)
        self.y = float(y)
        self.z = float(z)

    def __add__(self,other):
        return vec(self.x+other.x, self.y+other.y, self.z+other.z)

    def __sub__(self,other):
        return vec(self.x-other.x, self.y-other.y, self.z-other.z)

    def __mul__(self,amount):
        return vec(self.x*amount, self.y*amount, self.z*amount)

    def __div__(self,amount):
        return vec(self.x/amount, self.y/amount, self.z/amount)

    def __neg__(self):
        return vec(-self.x, -self.y, -self.z)

    def dot(self,other):
        return self.x*other.x + self.y*other.y + self.z*other.z

    def dist(self,other):
        return sqrt((other.x-self.x)*(other.x-self.x)+
                    (other.y-self.y)*(other.y-self.y)+
                    (other.z-self.z)*(other.z-self.z))

    def sq(self):
        return sq(self.x) + sq(self.y) + sq(self.z)

    def mag(self):
        return self.dist(vec(0.0, 0.0, 0.0))

    def norm(self):
        mag = self.mag()
        if mag != 0:
            self.x = self.x/mag
            self.y = self.y/mag
            self.z = self.z/mag

    def reflect(self,normal):
        vdn = self.dot(normal)*2
        return self - normal*vdn


class line:
    def __init__(self, start, end):
        self.start = start
        self.end = end

    def vec(self):
        return self.end - self.start


class renderobject:
    def __init__(self, shader):
        self.shader = shader


class plane(renderobject):
    def __init__(self, plane, dist, shader):
        renderobject.__init__(self, shader)
        self.plane = plane
        self.dist = dist

    def intersect(self,l):
        vd = self.plane.dot(l.vec())
        if vd == 0:
            return "none",(vec(0.0, 0.0, 0.0),vec(0.0, 0.0, 0.0))
        v0 = -(self.plane.dot(l.start)+self.dist)
        t = v0/vd
        if t<0 or t>1:
            return "none",(vec(0.0, 0.0, 0.0),vec(0.0, 0.0, 0.0))
        return "one", (l.start+(l.vec()*t), self.plane)


class sphere(renderobject):
    def __init__(self, pos, radius, shader):
        renderobject.__init__(self, shader)
        self.pos = pos
        self.radius = radius

    def intersect(self,l):
        lvec = l.vec()
        a = sq(lvec.x) + sq(lvec.y) + sq(lvec.z)

        b = 2*(lvec.x*(l.start.x-self.pos.x)+                lvec.y*(l.start.y-self.pos.y)+                lvec.z*(l.start.z-self.pos.z))

        c = self.pos.sq()+l.start.sq() -             2*(self.pos.x*l.start.x+self.pos.y*l.start.y+self.pos.z*l.start.z)-sq(self.radius)

        i = b*b - 4*a*c

        intersectiontype = "none"
        pos = vec(0.0, 0.0, 0.0)
        norm = vec(0.0, 0.0, 0.0)
        t = 0.0

        if i > 0:
            if i == 0:
                intersectiontype="one"
                t = -b/(2*a)
            else:
                intersectiontype="two"
                t = (-b - sqrt( b*b - 4*a*c )) / (2*a)

            if t>0 and t<1:
                pos = l.start + lvec*t
                norm = pos - self.pos
                norm.norm()
            else:
                intersectiontype="none"

        return intersectiontype, (pos, norm)


class light:
    def checkshadow(self, obj, objects,l):
        for ob in objects:
            if ob is not obj:
                intersects,(pos, norm) = ob.intersect(l)
                if intersects is not "none":
                    return 1
        return 0


class parallellight(light):
    def __init__(self, direction, col):
        direction.norm()
        self.direction = direction
        self.col=  col

    def inshadow(self, obj, objects, pos):
        l = line(pos, pos+self.direction*1000.0)
        return self.checkshadow(obj, objects,l)

    def light(self, shaderinfo):
        if self.inshadow(shaderinfo.thisobj, shaderinfo.objects, shaderinfo.position):
            return vec(0.0, 0.0, 0.0)
        return self.col*self.direction.dot(shaderinfo.normal)


class pointlight(light):
    def __init__(self, position, col):
        self.position = position
        self.col = col

    def inshadow(self, obj, objects, pos):
        l = line(pos, self.position)
        return self.checkshadow(obj, objects,l)

    def light(self, shaderinfo):
        if self.inshadow(shaderinfo.thisobj, shaderinfo.objects, shaderinfo.position):
            return vec(0.0, 0.0, 0.0)
        direction = shaderinfo.position - self.position
        direction.norm()
        direction = -direction
        return self.col*direction.dot(shaderinfo.normal)


class shader:
    def getreflected(self, shaderinfo):
        depth = shaderinfo.depth
        col = vec(0.0, 0.0, 0.0)
        if depth > 0:
            lray = line(shaderinfo.ray.start, shaderinfo.ray.end) #copy.copy(shaderinfo.ray)
            ray = lray.vec()
            normal = vec(shaderinfo.normal.x, shaderinfo.normal.y, shaderinfo.normal.z) #copy.copy(shaderinfo.normal)

            ray = ray.reflect(normal)
            reflected = line(shaderinfo.position,shaderinfo.position+ray)
            obj = shaderinfo.thisobj
            objects = shaderinfo.objects

            newshaderinfo = Shaderinfo() #copy.copy(shaderinfo) # XXX
            newshaderinfo.thisobj = shaderinfo.thisobj
            newshaderinfo.objects = shaderinfo.objects
            newshaderinfo.lights = shaderinfo.lights
            newshaderinfo.position = shaderinfo.position
            newshaderinfo.normal = shaderinfo.normal

            newshaderinfo.ray = reflected
            newshaderinfo.depth = depth - 1

            # todo - depth test
            for ob in objects:
                if ob is not obj:
                    intersects,(position,normal) = ob.intersect(reflected)
                    if intersects is not "none":
                        newshaderinfo.thisobj = ob
                        newshaderinfo.position = position
                        newshaderinfo.normal = normal
                        col = col + ob.shader.shade(newshaderinfo)
        return col

    def isoccluded(self, ray, shaderinfo):
        dist = ray.mag()
        test = line(shaderinfo.position, shaderinfo.position+ray)
        obj = shaderinfo.thisobj
        objects = shaderinfo.objects
        # todo - depth test
        for ob in objects:
            if ob is not obj:
                intersects,(position,normal) = ob.intersect(test)
                if intersects is not "none":
                    return 1
        return 0

    def doocclusion(self, samples, shaderinfo):
        # not really very scientific, or good in any way...
        oc = 0.0
        for i in xrange(samples):
            ray = vec(float(random.randrange(-100,100)),float(random.randrange(-100,100)),float(random.randrange(-100,100)))
            ray.norm()
            ray = ray * 2.5
            if self.isoccluded(ray, shaderinfo):
                oc = oc + 1
        oc = oc / float(samples)
        return 1-oc

    def shade(self,shaderinfo):
        col = vec(0.0, 0.0, 0.0)
        for lite in shaderinfo.lights:
            col = col + lite.light(shaderinfo)
        return col


class world:
    def __init__(self,width,height):
        self.lights = []
        self.objects = []
        self.cameratype = "persp"
        self.width = width
        self.height = height
        self.backplane = 2000.0
        self.imageplane = 5.0
        self.aspect = self.width/float(self.height)

    def render(self, filename):
        out_file = file(filename, ''w'')
        # PPM header
        print >>out_file, "P3"
        print >>out_file, self.width, self.height
        print >>out_file, "256"
        total = self.width * self.height
        count = 0

        for sy in xrange(self.height):
            pixel_line = []
            for sx in xrange(self.width):
                x = 2 * (0.5-sx/float(self.width)) * self.aspect
                y = 2 * (0.5-sy/float(self.height))
                if self.cameratype=="ortho":
                    ray = line(vec(x, y, 0.0),vec(x, y, self.backplane))
                else:
                    ray = line(vec(0.0, 0.0, 0.0),vec(x, y, self.imageplane))
                    ray.end=ray.end*self.backplane

                col = vec(0.0, 0.0, 0.0)
                depth = self.backplane
                shaderinfo = Shaderinfo() #{"ray":ray,"lights":self.lights,"objects":self.objects,"depth":2}
                shaderinfo.ray = ray
                shaderinfo.lights = self.lights
                shaderinfo.objects = self.objects
                shaderinfo.depth = 2

                for obj in self.objects:
                    intersects,(position,normal) = obj.intersect(ray)
                    if intersects is not "none":
                        if position.z<depth and position.z>0:
                            depth = position.z
                            shaderinfo.thisobj = obj
                            shaderinfo.position = position
                            shaderinfo.normal = normal
                            col = obj.shader.shade(shaderinfo)

                pixel_line.append( conv_value(col.x) )
                pixel_line.append( conv_value(col.y) )
                pixel_line.append( conv_value(col.z) )
                count = count + 1

            print >>out_file, " ".join(pixel_line)
            percentstr = str(int((count/float(total))*100))+"%"
            print "" + percentstr
        out_file.close()


class everythingshader(shader):
    def shade(self,shaderinfo):
        col = shader.shade(self,shaderinfo)
        ref = self.getreflected(shaderinfo)
        col = col*0.5+ref*0.5
        return col*self.doocclusion(10,shaderinfo)


class spotshader(shader):
    def shade(self,shaderinfo):
        col = shader.shade(self, shaderinfo)
        position = shaderinfo.position
        jitter = sin(position.x) + cos(position.z)
        if jitter > 0.5:
            col = col / 2
        ref = self.getreflected(shaderinfo)
        return ref*0.5 + col*0.5*self.doocclusion(10,shaderinfo)


# Main
# Give sixe x and y of the image
if len(sys.argv) == 3:
    nx, ny = int(sys.argv[1]), int(sys.argv[2])
else:
    nx, ny = 160, 120
w = world(nx, ny)
numballs = 10.0
offset = vec(0.0,-5.0,55.0)
rad = 12.0
radperball = (2 * 3.141592) / numballs

for i in xrange(int(numballs)):
    x = sin(0.3+radperball*float(i))*rad
    y = cos(0.3+radperball*float(i))*rad
    w.objects.append(sphere(vec(x,0.0,y)+offset,2.0,everythingshader()))

w.objects.append(sphere(vec(3.0,3.0,0.0)+offset,5.0,everythingshader()))
w.objects.append(plane(vec(0.0,1.0,0.0),7.0, spotshader()))
w.lights.append(parallellight(vec(1.0,1.0,-1.0), vec(0.3,0.9,0.1)))
w.lights.append(pointlight(vec(5.0,100.0,-5.0), vec(0.5,0.5,1.0)))

w.render(''test.ppm'')

'
]

{ #category : #resources }
PythonParserTests >> source_test_152 [
	^ '
x = ''0,0''
b = str(x)
print b

a = [[1]]
c = [None, [2]]

print a == c

d = [3]; d = None
e = [4]; e = None

print d == e, None == d, e == None, a == None, c[0] == None, c[1] == None

class board(object):
    def mergemask(self):
        print ''mergemask''

    def solve(self, board):
        global bekos
        bekos += 1

        #[board.mergemask() for x in range(1)] # XXX list(none) ..
        board.mergemask()
        board.mergemask()

bekos = 0
bo = board()
bo.solve(bo)

class heuk:
    aha = 4
    def bla(self):
        heuk.aha += 1
        self.ahah = 2
        print self.ahah, heuk.aha

h = heuk()
h.lala = 1
h.bla()

heuk.aha
heuk.aha += 1
print heuk.aha

heuk.noinit = 3
print heuk.noinit, h.ahah

class myiter:
    def __init__(self, container):
        self.container = container
        self.count = -1
    def next(self):
        self.count +=1
        if self.count < len(self.container):
            return self.container[self.count]
        raise StopIteration

class container:
    def __init__(self):
        self.unit = range(3)
    def __getitem__(self, i):
        return self.unit[i]
    def __iter__(self):
        return myiter(self)
    def __len__(self):
        return len(self.unit)

def iter_(x):
    return x.__iter__()

i = iter_(container())
try:
    while 1:
        y = i.next()
        print y
except StopIteration: pass

'
]

{ #category : #resources }
PythonParserTests >> source_test_153 [
	^ '
# (c) (the sister of) Peter Goodspeed
# --- coriolinus@gmail.com

#plife.py - conway''s game of life, with no object-orientation,
# a 20x20 non-wrapping grid, and no exceptions

#functions
def rawBoard():
        return [200 * [False] for i in xrange(200)]

#def fromKb():
#        eventLoop(lambda arg: raw_input(arg))

def nextI(qstr):
        global source
        if source == 1: #from keyboard
                return raw_input(qstr)
        elif source == 2: #from file
                global flines
                global fcur
                if fcur < len(flines):
                        ret = flines[fcur]
                        fcur += 1
                        return ret


def pb(board):
        #print board
        print "-" * 20
        for row in board:
                ro = ''''
                for i in xrange(len(row)):
                        if row[i]: ro += "X"
                        else: ro += " "
                print ro
        print "-" * 20

def eventLoop(nextInput):
       cont = ''p''
       while cont.lower()[0] == ''p'':
                board = rawBoard()

                #how many inputs should we expect?
                numcells = int(nextInput("how many cells? "))

                #get that many cells
                for i in xrange(numcells):
                        xy = str(nextInput("x,y: ")).split('','')
                        x,y = int(xy[0]),int(xy[1])
                        #set those cells
                        board[x][y] = True

                #pb(board)
                runSim(board)

                cont = nextInput("play again? (p for yes; anything else for no): ")

def runSim(board):
        #main loop for simulating life
        turns = 0
        ob = None # old board

        while turns < 10 and board != ob:
                turns += 1
                ob = board
                board = nextgen(board)
                #pb(board)
                #print
        if turns >= 10000: print "10 turns exhausted"
        else: print "stabilized on turn %s" % str(turns + 1)

def nextgen(board):
        #transform the old board into a new one
        nb = rawBoard()

        for rown in xrange(len(board)):
                for coln in xrange(len(board[rown])):
                        nn = 0
                        for r,c in neighbors(rown, coln):
                                if board[r][c]: nn += 1
                        if nn == 3: nb[rown][coln] = True
                        elif nn >= 4 or nn < 2: nb[rown][coln] = False
                        else: nb[rown][coln] = board[rown][coln]

        return nb

def neighbors(x,y):
        rl = []
        for mx in [-1,0,1]:
                for my in [-1,0,1]:
                        if not (mx == 0 and my == 0):
                                r = (x + mx, y + my)
                                if r[0] >= 0 and r[0] < 20 and r[1] >= 0 and r[1] < 20:
                                        rl.append(r)
        return rl

#main
source = 0
while source not in [1,2]:
        source = 2 #int(raw_input("1 for input from keyboard; 2 for input from file: "))

if source==2:
        fp = open(''testdata/life.txt'')
        flines = [line for line in fp]
        fp.close()
        fcur = 0

eventLoop(nextI)

'
]

{ #category : #resources }
PythonParserTests >> source_test_154 [
	^ '
# (c) Peter Goodspeed
# --- coriolinus@gmail.com

from math import ceil
from time import time
import sys

class bmp(object):
        def __init__(self, vals=9*[True], n=-1):
                self.v = vals[0:9]
                if n>=0: self.v[n] = not self.v[n]
        def __and__(self, other):
                return bmp([self.v[i] and other.v[i] for i in xrange(9)])
        def cnt(self):
                return len([i for i in self.v if i])

class boardRep(object):
        def __init__(self, board):
                self.__fields = list(board.final)
        def fields(self):
                return self.__fields
        def __eq__(self, other):
                return self.__fields==other.fields()
        def __ne__(self, other):
                return self.__fields!=other.fields()
        def __hash__(self):
                rep=""
                for i in xrange(9):
                        for j in xrange(9):
                                rep += str(self.__fields[i][j])
                return hash(rep)

class board(object):
        notifyOnCompletion = True               #let the user know when you''re done computing a game
        completeSearch = False                  #search past the first solution

        def __init__(self):
                #final numbers: a 9 by 9 grid
                self.final = [9 * [0] for i in xrange(9)]
                self.rows = 9 * [bmp()]
                self.cols = 9 * [bmp()]
                self.cels = [3 * [bmp()] for i in xrange(3)]

                #statistics
                self.__turns = 0
                self.__backtracks = 0
                self.__starttime = 0
                self.__endtime = 0
                self.__status = 0
                self.__maxdepth = 0
                self.__openspaces = 81

                #a set of all solved boards discovered so far
                self.solutions = set()
                #a set of all boards examined--should help reduce the amount of search duplication
                self.examined = set()

        def fread(self,fn=''''):
                #self.__init__()
                if fn=='''':
                        fn = raw_input("filename: ")
                f = file(fn, ''r'')
                lines = f.readlines()
                for row in xrange(9):
                        for digit in xrange(1,10):
                                try:
                                        self.setval(row,lines[row].index(str(digit)),digit)
                                except ValueError:
                                        pass
                f.close()

        def setval(self, row, col, val):
                #add the number to the grid
                self.final[row][col] = val
                self.__openspaces -= 1

                #remove the number from the potential masks
                mask = bmp(n = val - 1)
                #rows and cols
                self.rows[row] = self.rows[row] & mask
                self.cols[col] = self.cols[col] & mask
                #cels
                cr = self.cell(row)
                cc = self.cell(col)
                self.cels[cr][cc] = self.cels[cr][cc] & mask

        def cell(self, num):
                return int(ceil((num + 1) / 3.0)) - 1

        def __str__(self):
                ret = ""
                for row in xrange(9):
                        if row == 3 or row == 6: ret += (((3 * "---") + "+") * 3)[:-1] + "\n"
                        for col in xrange(9):
                                if col == 3 or col == 6: ret += "|"
                                if self.final[row][col]: c = str(self.final[row][col])
                                else: c = " "
                                ret += " "+c+" "
                        ret += "\n"
                return ret

        def solve(self, notify=True, completeSearch=False):
                if self.__status == 0:
                        self.__status = 1
                        self.__starttime = time()
                        board.notifyOnCompletion = notify
                        board.completeSearch = completeSearch
                        self.__solve(self, 0)

        def openspaces(self):
                return self.__openspaces

        def __solve(self, _board, depth):
                global bekos
                bekos += 1
                if bekos == 5000:
                    self.onexit()
                    sys.exit()

                if boardRep(_board) not in self.examined:
                        self.examined.add(boardRep(_board))

                        #check for solution condition:
                        if _board.openspaces() <= 0:
                                self.solutions.add(boardRep(_board))
                                print ''sol'', _board
                                if depth == 0: self.onexit()
                                if not board.completeSearch:
                                        self.onexit()

                        else:
                                #update the statistics
                                self.__turns += 1
                                if depth > self.__maxdepth: self.__maxdepth = depth

                                #figure out the mincount
                                mincnt, coords = _board.findmincounts()
                                if mincnt <= 0:
                                        self.__backtracks += 1
                                        if depth == 0: self.onexit()
                                else:
                                        #coords is a list of tuples of coordinates with equal, minimal counts
                                        # of possible values. Try each of them in turn.
                                        for row, col in coords:
                                                #now we iterate through possible values to put in there
                                                broken = False
                                                for val in [i for i in xrange(9) if _board.mergemask(row, col).v[i] == True]:
                                                        if not board.completeSearch and self.__status == 2:
                                                            broken = True
                                                            break
                                                        val += 1
                                                        t = _board.clone()
                                                        t.setval(row, col, val)
                                                        self.__solve(t, depth + 1)
                                                #if we broke out of the previous loop, we also want to break out of
                                                # this one. unfortunately, "break 2" seems to be invalid syntax.
                                                if broken: break
                                                #else: didntBreak = True
                                                #if not didntBreak: break

        def clone(self):
                ret = board()
                for row in xrange(9):
                        for col in xrange(9):
                                if self.final[row][col]:
                                        ret.setval(row, col, self.final[row][col])
                return ret

        def mergemask(self, row, col):
                return self.rows[row] & self.cols[col] & self.cels[self.cell(row)][self.cell(col)]

        def findmincounts(self):
                #compute the list of lenghths of merged masks
                masks = []
                for row in xrange(9):
                        for col in xrange(9):
                                if self.final[row][col] == 0:
                                        numallowed = self.mergemask(row, col).cnt()
                                        masks.append((numallowed, row, col))
                #return the minimum number of allowed moves, and a list of cells which are
                # not currently occupied and which have that number of allowed moves
                return min(masks)[0], [(i[1],i[2]) for i in masks if i[0] == min(masks)[0]]

        def onexit(self):
                self.__endtime = time()
                self.__status = 2

                if board.notifyOnCompletion: print self.stats()[''turns'']

        def stats(self):
                if self.__status == 1: t = time() - self.__starttime
                else: t = self.__endtime - self.__starttime
                return {''max depth'' : self.__maxdepth, ''turns'' : self.__turns, ''backtracks'' : self.__backtracks, ''elapsed time'' : int(t), ''boards examined'': len(self.examined), ''number of solutions'' : len(self.solutions)}


bekos = 0
puzzle = board()
puzzle.fread(''testdata/b6.pz'')
#print puzzle
puzzle.solve()

'
]

{ #category : #resources }
PythonParserTests >> source_test_155 [
	^ '
# (c) Peter Cock
# --- http://www2.warwick.ac.uk/fac/sci/moac/currentstudents/peter_cock/python/sudoku/

TRIPLETS = [[0,1,2],[3,4,5],[6,7,8]]

ROW_ITER = [[(row,col) for col in range(0,9)] for row in range(0,9)]
COL_ITER = [[(row,col) for row in range(0,9)] for col in range(0,9)]
TxT_ITER = [[(row,col) for row in rows for col in cols] for rows in TRIPLETS for cols in TRIPLETS]

class soduko:
    def __init__(self, start_grid=None) :
        self.squares =[ [range(1,10)  for col in range(0,9)] for row in range(0,9)]

        if start_grid is not None:
            assert len(start_grid)==9, "Bad input!"
            for row in range(0,9) :
                self.set_row(row, start_grid[row])

        self._changed=False

    def copy(self) :
        soduko_copy = soduko(None)
        for row in range(0,9) :
            for col in range(0,9) :
                soduko_copy.squares[row][col] = self.squares[row][col][:]
        soduko_copy._changed=False
        return soduko_copy

    def set_row(self,row, x_list) :
        assert len(x_list)==9, ''not 9''
        for col in range(0,9) :
            try :
                x = int(x_list[col])
            except :
                x = 0
            self.set_cell(row,col,x)

    def set_cell(self,row,col,x):
        if self.squares[row][col] == [x] :
            pass
        elif x not in range(1,9+1) :
            pass
        else:
            assert x in self.squares[row][col], "bugger2"

            self.squares[row][col] = [x]
            self.update_neighbours(row,col,x)
            self._changed=True

    def cell_exclude(self, row,col,x) :
        assert x in range(1,9+1), ''inra''
        if x in self.squares[row][col] :
            self.squares[row][col].remove(x)
            assert len(self.squares[row][col]) > 0, "bugger"
            if len(self.squares[row][col]) == 1 :
                self._changed=True
                self.update_neighbours(row,col,self.squares[row][col][0])
        else :
            pass
        return

    def update_neighbours(self,set_row,set_col,x) :
        for row in range(0,9) :
            if row <> set_row :
                self.cell_exclude(row,set_col,x)
        for col in range(0,9) :
            if col <> set_col :
                self.cell_exclude(set_row,col,x)
        for triplet in TRIPLETS :
            if set_row in triplet : rows = triplet[:]
            if set_col in triplet : cols = triplet[:]
        rows.remove(set_row)
        cols.remove(set_col)
        for row in rows :
            for col in cols :
                assert row <> set_row or col <> set_col , ''meuh''
                self.cell_exclude(row,col,x)

    def get_cell_digit_str(self,row,col) :
        if len(self.squares[row][col])==1 :
            return str(self.squares[row][col][0])
        else :
            return "0"

    def __str__(self):
        answer = "   123   456   789\n"
        for row in range(0,9) :
            answer = answer + str(row+1)                         +   " [" + "".join([self.get_cell_digit_str(row,col).replace("0","?") for col in range(0,3)])                         + "] [" + "".join([self.get_cell_digit_str(row,col).replace("0","?") for col in range(3,6)])                         + "] [" + "".join([self.get_cell_digit_str(row,col).replace("0","?") for col in range(6,9)])                         + "]\n"
            if row+1 in [3,6] :
              answer = answer + "   ---   ---   ---\n"
        return answer

    def check(self) :
        self._changed=True
        while self._changed:
            self._changed=False
            self.check_for_single_occurances()
            self.check_for_last_in_row_col_3x3()
        return

    def check_for_single_occurances(self):
        for check_type in [ROW_ITER, COL_ITER, TxT_ITER]:
            for check_list in check_type :
                for x in range(1,9+1) : #1 to 9 inclusive
                    x_in_list = []
                    for (row,col) in check_list :
                        if x in self.squares[row][col] :
                            x_in_list.append((row,col))
                    if len(x_in_list)==1 :
                        (row,col) = x_in_list[0]
                        if len(self.squares[row][col]) > 1 :
                            self.set_cell(row,col,x)

    def check_for_last_in_row_col_3x3(self):
        for (type_name, check_type) in [("Row",ROW_ITER),("Col",COL_ITER),("3x3",TxT_ITER)]:
            for check_list in check_type :
                unknown_entries = []
                unassigned_values = range(1,9+1) #1-9 inclusive
                known_values = []
                for (row,col) in check_list :
                    if len(self.squares[row][col]) == 1 :
                        assert self.squares[row][col][0] not in known_values, "bugger3"

                        known_values.append(self.squares[row][col][0])

                        assert self.squares[row][col][0] in unassigned_values, "bugger4"

                        unassigned_values.remove(self.squares[row][col][0])
                    else :
                        unknown_entries.append((row,col))
                assert len(unknown_entries) + len(known_values) == 9, ''bugger5''
                assert len(unknown_entries) == len(unassigned_values), ''bugger6''
                if len(unknown_entries) == 1 :
                    x = unassigned_values[0]
                    (row,col) = unknown_entries[0]
                    self.set_cell(row,col,x)
        return

    def one_level_supposition(self):
        progress=True
        while progress :
            progress=False
            for row in range(0,9) :
                for col in range(0,9):
                    if len(self.squares[row][col]) > 1 :
                        bad_x = []
                        for x in self.squares[row][col] :
                            soduko_copy = self.copy()
                            try:
                                soduko_copy.set_cell(row,col,x)
                                soduko_copy.check()
                            except AssertionError, e :
                                bad_x.append(x)
                            del soduko_copy
                        if len(bad_x) == 0 :
                            pass
                        elif len(bad_x) < len(self.squares[row][col]) :
                            for x in bad_x :
                                self.cell_exclude(row,col,x)
                                self.check()
                            progress=True
                        else :
                            assert False, "bugger7"


for x in range(50):
    t = soduko(["800000600",
                   "040500100",
                   "070090000",
                   "030020007",
                   "600008004",
                   "500000090",
                   "000030020",
                   "001006050",
                   "004000003"])

    t.check()
    t.one_level_supposition()
    t.check()
    print t

'
]

{ #category : #resources }
PythonParserTests >> source_test_156 [
	^ '
print ''he\\"''

class A:
    def __init__(self):
        pass

a = A()
a.__init__()

class B:
    def __init__(self, n):
        print ''b init with'', n

    def huhu(self):
        self.__init__(4)

b = B(5)
b.huhu()

class C:
    def __init__(self):
        pass

c = C()


# Probably simpler OOP problems
#class Pet:
#    def speak(self): pass
#class Cat(Pet):
#    def speak(self): print "meow!"
#class Dog(Pet):
#    def speak(self): print "woof!"
#def command(pet): pet.speak()
#pets = Cat(), Dog()
#for pet in pets: command(pet)
#for pet in (pets[1], pets[0]): command(pet)

clearCastlingOpportunities = [None]
clearCastlingOpportunities[0] = (10,)

board = [1,2,3]
board[0] = 0

print clearCastlingOpportunities, board

print range(-17, -120, -17)

v = -1
w = 4

for x in range(w,-2,v):
    print x

for x in range(w+1,-2,2*v):
    print x

for x in range(0,w+1,1):
    print x

d = [i for i in xrange(10)]
print d
d[::2] = [1,2,3,4,5]
print d
d[::-2] = range(5)
print d

e = ["X" for i in xrange(10)]
e[::2] = "abcde"
print e

f = ["Y" for i in xrange(10)]
f[1::2] = tuple("abcde")
print f

def sgn(x):
    if x < 0: return -1
    else: return 1
for j in [-2, -1]:
    print [i for i in xrange(-10*sgn(j), -1*sgn(j), j) if True for k in range(2) if k]


'
]

{ #category : #resources }
PythonParserTests >> source_test_157 [
	^ '
# This is an extremely simple chess like speed test program written in Python
# This program can be distributed under GNU General Public License Version 2.
# (C) Jyrki Alakuijala 2005
#
# Despite its looks, this program was written in Python, not converted to it.
# This program is incomplete, castlings, enpassant situation etc. are not properly implemented
# game ending is not recognized. The evaluator as simple as it ever could be.
#
# The board is an 160-element array of ints, Nones and Booleans,
# The board contains the real board in squares indexed in variable ''squares''
# The oversized board is to allow for "0x88" chess programming trick for move generation.
# Other board data:
# 4x castling flags, indices [10-13], queen side white, king side white, queen side black, king side white
# turn, enpassant [26, 27]

from copy import copy

iNone = -999
iTrue = 1
iFalse = 0

setup = (4, 2, 3, 5, 6, 3, 2, 4, iNone, iNone) + (iTrue,)*4 + (iNone, iNone) +   (1,) * 8 + (iNone, iNone, iTrue, iNone, iNone, iNone, iNone, iNone,) +   ((0, ) * 8 + (iNone,) * 8) * 4 +   (-1,) * 8 + (iNone,) * 8 +   (-4, -2, -3, -5, -6, -3, -2, -4) + (iNone,) * 40

squares = tuple([i for i in range(128) if not i & 8])
knightMoves = (-33, -31, -18, -14, 14, 18, 31, 33)
bishopLines = (tuple(range(17, 120, 17)), tuple(range(-17, -120, -17)), tuple(range(15, 106, 15)), tuple(range(-15, -106, -15)))
rookLines = (tuple(range(1, 8)), tuple(range(-1, -8, -1)), tuple(range(16, 128, 16)), tuple(range(-16, -128, -16)))
queenLines = bishopLines + rookLines
kingMoves = (-17, -16, -15, -1, 1, 15, 16, 17)

linePieces = ((), (), (), bishopLines, rookLines, queenLines, (), (), queenLines, rookLines, bishopLines, (), ())

clearCastlingOpportunities = [None] * 0x80
for (i, v) in ((0x0, (10,)), (0x4, (10, 11)), (0x7, (11,)), (0x70, (12,)), (0x74, (12, 13)), (0x77, (13,))):
  clearCastlingOpportunities[i] = v

pieces = ".pnbrqkKQRBNP"

def evaluate(board):
  evals = (0, 100, 300, 330, 510, 950, 100000, -100000, -950, -510, -330, -300, -100)
  return sum([evals[board[i]] for i in squares])

def printBoard(board):
  for i in range(7,-1,-1):
    for j in range(8):
      ix = i * 16 + j
      print pieces[board[ix]],
    print

def move(board, mv):
  ix = (mv >> 8) & 0xff
  board[mv & 0xff] = board[ix]
  board[ix] = 0
  if clearCastlingOpportunities[ix]:
    for i in clearCastlingOpportunities[ix]:
      board[i] = iFalse

  board[26] = int(not board[26]) # Turn
  if (mv & 0x7fff0000) == 0:
    return
  if (mv & 0x01000000): # double step
    board[27] = mv & 7
  else:
    board[27] = iNone # no enpassant
  if (mv & 0x04000000): # castling
    toix = mv & 0xff
    if toix == 0x02:
      board[0x00] = 0
      board[0x03] = 4
    elif toix == 0x06:
      board[0x07] = 0
      board[0x05] = 4
    elif toix == 0x72:
      board[0x70] = 0
      board[0x73] = -4
    elif toix == 0x76:
      board[0x77] = 0
      board[0x75] = -4
    else:
      raise "faulty castling"
  if mv & 0x08000000: # enpassant capture
    if board[26]: # turn after this move
      board[mv & 0x07 + 64] = 0
    else:
      board[mv & 0x07 + 48] = 0
  if mv & 0x10000000: # promotion
    a = (mv & 0xff0000) >> 16
    if (a >= 0x80):
      a = a - 0x100
    board[mv & 0xff] = a

def toString(move):
  fr = (move >> 8) & 0xff
  to = move & 0xff
  letters = "abcdefgh"
  numbers = "12345678"
  mid = "-"
  if (move & 0x04000000):
    if (move & 0x7) == 0x02:
      return "O-O-O"
    else:
      return "O-O"
  if move & 0x02000000:
    mid = "x"
  retval = letters[fr & 7] + numbers[fr >> 4] + mid + letters[to & 7] + numbers[to >> 4]
  return retval

def moveStr(board, strMove):
  moves = pseudoLegalMoves(board)
  for m in moves:
    if strMove == toString(m):
      move(board, m)
      return
  for m in moves:
    print toString(m)
  raise "no move found" #, strMove

def rowAttack(board, attackers, ix, dir):
  own = attackers[0]
  for k in [i + ix for i in dir]:
    if k & 0x88:
      return False
    if board[k]:
      return (board[k] * own < 0) and board[k] in attackers

def nonpawnAttacks(board, ix, color):
  return (max([board[ix + i] == color * 2 for i in knightMoves]) or
          max([rowAttack(board, (color * 3, color * 5), ix, bishopLine) for bishopLine in bishopLines]) or
          max([rowAttack(board, (color * 4, color * 5), ix, rookLine) for rookLine in rookLines]))

nonpawnBlackAttacks = lambda board, ix: nonpawnAttacks(board, ix, -1)
nonpawnWhiteAttacks = lambda board, ix: nonpawnAttacks(board, ix, 1)

def pseudoLegalMovesWhite(board):
  retval = pseudoLegalCapturesWhite(board)
  for sq in squares:
    b = board[sq]
    if b >= 1:
      if b == 1 and not (sq + 16 & 0x88) and board[sq + 16] == 0:
        if sq >= 16 and sq < 32 and board[sq + 32] == 0:
          retval.append(sq * 0x101 + 32)
        retval.append(sq * 0x101 + 16)
      elif b == 2:
        for k in knightMoves:
          if board[k + sq] == 0:
            retval.append(sq * 0x101 + k)
      elif b == 3 or b == 5:
        for line in bishopLines:
          for k in line:
            if (k + sq & 0x88) or board[k + sq] != 0:
              break
            retval.append(sq * 0x101 + k)
      if b == 4 or b == 5:
        for line in rookLines:
          for k in line:
            if (k + sq & 0x88) or board[k + sq] != 0:
              break
            retval.append(sq * 0x101 + k)
      elif b == 6:
        for k in kingMoves:
          if not (k + sq & 0x88) and board[k + sq] == 0:
            retval.append(sq * 0x101 + k)
  if (board[10] and board[1] == 0 and board[2] == 0 and board[3] == 0 and
      not -1 in board[17:22] and
      not nonpawnBlackAttacks(board, 2) and not nonpawnBlackAttacks(board, 3) and not nonpawnBlackAttacks(board, 4)):
    retval.append(0x04000000 + 4 * 0x101 - 2)
  if (board[11] and board[5] == 0 and board[6] == 0 and
      not -1 in board[19:24] and
      not nonpawnBlackAttacks(board, 4) and not nonpawnBlackAttacks(board, 5) and not nonpawnBlackAttacks(board, 6)):
    retval.append(0x04000000 + 4 * 0x101 + 2)
  return retval

def pseudoLegalMovesBlack(board):
  retval = pseudoLegalCapturesBlack(board)
  for sq in squares:
    b = board[sq]
    if b < 0:
      if b == -1 and not (sq + 16 & 0x88) and board[sq - 16] == 0:
        if sq >= 96 and sq < 112 and board[sq - 32] == 0:
          retval.append(sq * 0x101 - 32)
        retval.append(sq * 0x101 - 16)
      elif b == -2:
        for k in knightMoves:
          if board[k + sq] == 0:
            retval.append(sq * 0x101 + k)
      elif b == -3 or b == -5:
        for line in bishopLines:
          for k in line:
            if (k + sq & 0x88) or board[k + sq] != 0:
              break
            retval.append(sq * 0x101 + k)

      if b == -4 or b == -5:
        for line in rookLines:
          for k in line:
            if (k + sq & 0x88) or board[k + sq] != 0:
              break
            retval.append(sq * 0x101 + k)
      elif b == -6:
        for k in kingMoves:
          if not (k + sq & 0x88) and board[k + sq] == 0:
            retval.append(sq * 0x101 + k)
  if (board[12] and board[0x71] == 0 and board[0x72] == 0 and board[0x73] == 0 and
      not 1 in board[0x61:0x65] and
      not nonpawnWhiteAttacks(board, 0x72) and not nonpawnWhiteAttacks(board, 0x73) and not nonpawnWhiteAttacks(board, 0x74)):
    retval.append(0x04000000 + 0x74 * 0x101 - 2)
  if (board[11] and board[0x75] == 0 and board[0x76] == 0 and
      not -1 in board[0x63:0x68] and
      not nonpawnWhiteAttacks(board, 0x74) and not nonpawnWhiteAttacks(board, 0x75) and not nonpawnWhiteAttacks(board, 0x76)):
    retval.append(0x04000000 + 0x74 * 0x101 + 2)
  return retval

def pseudoLegalMoves(board):
  if board[26]:
    return pseudoLegalMovesWhite(board)
  else:
    return pseudoLegalMovesBlack(board)

def pseudoLegalCapturesWhite(board):
  retval = []
  for sq in squares:
    b = board[sq]
    if b >= 1:
      if b == 1:
        if not (sq + 17 & 0x88) and board[sq + 17] < 0:
          retval.append(0x02000000 + sq * 0x101 + 17)
        if not (sq + 15 & 0x88) and board[sq + 15] < 0:
          retval.append(0x02000000 + sq * 0x101 + 15)
        if sq >= 64 and sq < 72 and abs((sq & 7) - board[27]) == 1: # enpassant
          retval.append(0x02000000 + sq * 0x100 + (sq & 0x70) + 16 + board[27])
      elif b == 2:
        for k in knightMoves:
          if not (sq + k & 0x88) and board[k + sq] < 0:
            retval.append(0x02000000 + sq * 0x101 + k)
      elif b == 6:
        for k in kingMoves:
          if not(k + sq & 0x88) and board[k + sq] < 0:
            retval.append(0x02000000 + sq * 0x101 + k)
      else:
        for line in linePieces[b]:
          for k in line:
            if (sq + k & 0x88) or board[k + sq] >= 1:
              break
            if board[k + sq] < 0:
              retval.append(0x02000000 + sq * 0x101 + k)
              break
  return retval

def pseudoLegalCapturesBlack(board):
  retval = []
  for sq in squares:
    b = board[sq]
    if b < 0:
      if b == -1:
        if board[sq - 17] >= 1:
          retval.append(0x02000000 + sq * 0x101 - 17)
        if board[sq - 15] >= 1:
          retval.append(0x02000000 + sq * 0x101 - 15)
        if sq >= 48 and sq < 56 and abs((sq & 7) - board[27]) == 1: # enpassant
          retval.append(0x0a000000 + sq * 0x100 + (sq & 0x70) - 16 + board[27])
      elif b == -2:
        for k in knightMoves:
          if not (sq + k & 0x88) and board[k + sq] >= 1:
            retval.append(0x02000000 + sq * 0x101 + k)
      elif b == -3:
        for line in bishopLines:
          for k in line:
            if board[k + sq] < 0:
              break
            if board[k + sq] >= 1:
              retval.append(0x02000000 + sq * 0x101 + k)
              break
      elif b == -4:
        for line in rookLines:
          for k in line:
            if board[k + sq] < 0:
              break
            if board[k + sq] >= 1:
              retval.append(0x02000000 + sq * 0x101 + k)
              break
      elif b == -5:
        for line in queenLines:
          for k in line:
            if board[k + sq] < 0:
              break
            if board[k + sq] >= 1:
              retval.append(0x02000000 + sq * 0x101 + k)
              break
      elif b == -6:
        for k in kingMoves:
          if board[k + sq] >= 1:
            retval.append(0x02000000 + sq * 0x101 + k)
  return retval

def pseudoLegalCaptures(board):
  if board[26]:
    return pseudoLegalCapturesWhite(board)
  else:
    return pseudoLegalCapturesBlack(board)

def legalMoves(board):
  allMoves = pseudoLegalMoves(board)
  retval = []
  #from copy import copy
  kingVal = 6
  if board[26]:
    kingVal = -kingVal
  for mv in allMoves:
    board2 = copy(board)
    move(board2, mv)
    #print "trying to reduce move", toString(mv)
    if not [i for i in pseudoLegalCaptures(board2) if board2[i & 0xff] == kingVal]:
      retval.append(mv)
  return retval

def alphaBetaQui(board, alpha, beta, n):
  e = evaluate(board)
  if not board[26]:
    e = -e
  if e >= beta:
    return (beta, iNone) # XXX
  if (e > alpha):
    alpha = e
  bestMove = iNone # XXX
  if n >= -4:
    #from copy import copy
    for mv in pseudoLegalCaptures(board):
      newboard = copy(board)
      move(newboard, mv)
      value = alphaBetaQui(newboard, -beta, -alpha, n - 1)
      value = (-value[0], value[1])
      if value[0] >= beta:
        return (beta, mv)
      if (value[0] > alpha):
        alpha = value[0]
        bestMove = mv
  return (alpha, bestMove)

def alphaBeta(board, alpha, beta, n):
  if n == 0:
    return alphaBetaQui(board, alpha, beta, n)
#  from copy import copy
  bestMove = iNone # XXX

  for mv in legalMoves(board):
    newboard = copy(board)
    move(newboard, mv)
    value = alphaBeta(newboard, -beta, -alpha, n - 1)
    value = (-value[0], value[1])
    if value[0] >= beta:
      return (beta, mv)
    if (value[0] > alpha):
      alpha = value[0]
      bestMove = mv
  return (alpha, bestMove)

def speedTest():
  board = list(setup)
  moveStr(board, "c2-c4")
  moveStr(board, "e7-e5")
  moveStr(board, "d2-d4")

  res = alphaBeta(board, -99999999, 99999999, 4)
  print res
  moveStr(board, "d7-d6")
  res = alphaBeta(board, -99999999, 99999999, 4)
  print res

speedTest()

'
]

{ #category : #resources }
PythonParserTests >> source_test_158 [
	^ '
def appl(predicate, x): return predicate(x)
print [0,1][appl(lambda n: n>5, 10)], [0,1][appl(lambda n: n>10, 8)]

def split(seq, predicate):
    pair = [], []
    for el in seq:
        pair[not predicate(el)].append(el)
    return pair
print split(range(-5,6), lambda n: n%2==0)

#class Obj:
#    def __init__(self, n): self.n = n
#    def __gt__(self, other): return self.n > other.n
#    def __str__(self): return str(self.n)
#def mymax(seq):
#    maxval = seq[0]
#    for el in seq:
#        if el > maxval: # gives error
#            maxval = el
#    return maxval
#l = [Obj(i) for i in xrange(100)]
#print mymax(l), mymax(range(100))

class Num:
    def __init__(self, n): self.n = float(n)
    def __str__(self): return str(self.n)
    def __add__(self, other): return Num(self.n + other.n)
print sum([Num(i) for i in range(5)], Num(0))
print sum(range(5))

for a in 1,2: print a
for a in [1,2]: print a
for a in 1,2,3: print a

print ''aaaa''.replace(''a'',''b'', 2)
print ''aaaa''.replace(''a'',''b'', -1)

print ''aaaa''.split(''a'', 2)
print ''aaaa''.split(''a'', -1)


'
]

{ #category : #resources }
PythonParserTests >> source_test_159 [
	^ '
# (c) Reinhold P. Weicker,  CACM Vol 27, No 10, 10/84 pg. 1013.
# --- Translated from ADA to C by Rick Richardson.
# --- Translated from C to Python by Guido van Rossum.

from time import clock

LOOPS = 50000
Ident1, Ident2, Ident3, Ident4, Ident5 = range(1,6)

class Record:
    def __init__(self, PtrComp = None, Discr = 0, EnumComp = 0,
                       IntComp = 0, StringComp = ''''): # XXX '''' should be None
        self.PtrComp = PtrComp
        self.Discr = Discr
        self.EnumComp = EnumComp
        self.IntComp = IntComp
        self.StringComp = StringComp

    def copy(self):
        return Record(self.PtrComp, self.Discr, self.EnumComp,
                      self.IntComp, self.StringComp)

def main(loops=LOOPS):
    benchtime, stones = pystones(loops)
#    print "Pystone(%s) time for %d passes = %g" % #          (__version__, loops, benchtime)
#    print "This machine benchmarks at %g pystones/second" % stones

def pystones(loops=LOOPS):
    return Proc0(loops)

IntGlob = 0
BoolGlob = False
Char1Glob = '' '' # !
Char2Glob = '' ''
Array1Glob = [0]*51
#Array2Glob = map(lambda x: x[:], [Array1Glob]*51)
Array2Glob = [x[:] for x in [Array1Glob]*51]
PtrGlb = None
PtrGlbNext = None

def Proc0(loops=LOOPS):
    global IntGlob
    global BoolGlob
    global Char1Glob
    global Char2Glob
    global Array1Glob
    global Array2Glob
    global PtrGlb
    global PtrGlbNext

    starttime = clock()
    for i in range(loops):
        pass
    nulltime = clock() - starttime

    PtrGlbNext = Record()
    PtrGlb = Record()
    PtrGlb.PtrComp = PtrGlbNext
    PtrGlb.Discr = Ident1
    PtrGlb.EnumComp = Ident3
    PtrGlb.IntComp = 40
    PtrGlb.StringComp = "DHRYSTONE PROGRAM, SOME STRING"
    String1Loc = "DHRYSTONE PROGRAM, 1''ST STRING"
    Array2Glob[8][7] = 10

    starttime = clock()

    for i in range(loops):
        Proc5()
        Proc4()
        IntLoc1 = 2
        IntLoc2 = 3
        String2Loc = "DHRYSTONE PROGRAM, 2''ND STRING"
        EnumLoc = Ident2
        BoolGlob = not Func2(String1Loc, String2Loc)
        while IntLoc1 < IntLoc2:
            IntLoc3 = 5 * IntLoc1 - IntLoc2
            IntLoc3 = Proc7(IntLoc1, IntLoc2)
            IntLoc1 = IntLoc1 + 1
        Proc8(Array1Glob, Array2Glob, IntLoc1, IntLoc3)
        PtrGlb = Proc1(PtrGlb)
        CharIndex = ''A''
        while CharIndex <= Char2Glob:
            if EnumLoc == Func1(CharIndex, ''C''):
                EnumLoc = Proc6(Ident1)
            CharIndex = chr(ord(CharIndex)+1)
        IntLoc3 = IntLoc2 * IntLoc1
        IntLoc2 = IntLoc3 / IntLoc1
        IntLoc2 = 7 * (IntLoc3 - IntLoc2) - IntLoc1
        IntLoc1 = Proc2(IntLoc1)

    benchtime = clock() - starttime - nulltime
    return benchtime, (loops / benchtime)

def Proc1(PtrParIn):
    PtrParIn.PtrComp = NextRecord = PtrGlb.copy()
    PtrParIn.IntComp = 5
    NextRecord.IntComp = PtrParIn.IntComp
    NextRecord.PtrComp = PtrParIn.PtrComp
    NextRecord.PtrComp = Proc3(NextRecord.PtrComp)
    if NextRecord.Discr == Ident1:
        NextRecord.IntComp = 6
        NextRecord.EnumComp = Proc6(PtrParIn.EnumComp)
        NextRecord.PtrComp = PtrGlb.PtrComp
        NextRecord.IntComp = Proc7(NextRecord.IntComp, 10)
    else:
        PtrParIn = NextRecord.copy()
    NextRecord.PtrComp = None
    return PtrParIn

def Proc2(IntParIO):
    IntLoc = IntParIO + 10
    while 1:
        if Char1Glob == ''A'':
            IntLoc = IntLoc - 1
            IntParIO = IntLoc - IntGlob
            EnumLoc = Ident1
        if EnumLoc == Ident1:
            break
    return IntParIO

def Proc3(PtrParOut):
    global IntGlob

    if PtrGlb is not None:
        PtrParOut = PtrGlb.PtrComp
    else:
        IntGlob = 100
    PtrGlb.IntComp = Proc7(10, IntGlob)
    return PtrParOut

def Proc4():
    global Char2Glob

    BoolLoc = Char1Glob == ''A''
    BoolLoc = BoolLoc or BoolGlob
    Char2Glob = ''B''

def Proc5():
    global Char1Glob
    global BoolGlob

    Char1Glob = ''A''
    BoolGlob = False

def Proc6(EnumParIn):
    EnumParOut = EnumParIn
    if not Func3(EnumParIn):
        EnumParOut = Ident4
    if EnumParIn == Ident1:
        EnumParOut = Ident1
    elif EnumParIn == Ident2:
        if IntGlob > 100:
            EnumParOut = Ident1
        else:
            EnumParOut = Ident4
    elif EnumParIn == Ident3:
        EnumParOut = Ident2
    elif EnumParIn == Ident4:
        pass
    elif EnumParIn == Ident5:
        EnumParOut = Ident3
    return EnumParOut

def Proc7(IntParI1, IntParI2):
    IntLoc = IntParI1 + 2
    IntParOut = IntParI2 + IntLoc
    return IntParOut

def Proc8(Array1Par, Array2Par, IntParI1, IntParI2):
    global IntGlob

    IntLoc = IntParI1 + 5
    Array1Par[IntLoc] = IntParI2
    Array1Par[IntLoc+1] = Array1Par[IntLoc]
    Array1Par[IntLoc+30] = IntLoc
    for IntIndex in range(IntLoc, IntLoc+2):
        Array2Par[IntLoc][IntIndex] = IntLoc
    Array2Par[IntLoc][IntLoc-1] = Array2Par[IntLoc][IntLoc-1] + 1
    Array2Par[IntLoc+20][IntLoc] = Array1Par[IntLoc]
    IntGlob = 5

def Func1(CharPar1, CharPar2):
    CharLoc1 = CharPar1
    CharLoc2 = CharLoc1
    if CharLoc2 != CharPar2:
        return Ident1
    else:
        return Ident2

def Func2(StrParI1, StrParI2):
    IntLoc = 1
    while IntLoc <= 1:
        if Func1(StrParI1[IntLoc], StrParI2[IntLoc+1]) == Ident1:
            CharLoc = ''A''
            IntLoc = IntLoc + 1
    if CharLoc >= ''W'' and CharLoc <= ''Z'':
        IntLoc = 7
    if CharLoc == ''X'':
        return True
    else:
        if StrParI1 > StrParI2:
            IntLoc = IntLoc + 7
            return True
        else:
            return False

def Func3(EnumParIn):
    EnumLoc = EnumParIn
    if EnumLoc == Ident3: return True
    return False

main(LOOPS)


'
]

{ #category : #resources }
PythonParserTests >> source_test_16 [
	^ '
class integer:
    def __gt__(self, b):            # self: [integer], b: [integer]
        return True

def maxi(a, b):                           # a: [integer]r, b: [integer]r
    if a > b:                            # [bool]
        return a                         # [integer]
    return b                             # [integer]

def qbert():                             # a: [integer], c: [integer]r, b: [integer]
    a = integer()                        # [integer]
    b = integer()                        # [integer]
    c = maxi(a, b)                        # [integer]
    return c                             # [integer]

qbert()                                  # [integer]

'
]

{ #category : #resources }
PythonParserTests >> source_test_160 [
	^ '
#  Based on original version written in BCPL by Dr Martin Richards
#  in 1981 at Cambridge University Computer Laboratory, England
#  and a C++ version derived from a Smalltalk version written by
#  L Peter Deutsch.
#  Translation from C++, Mario Wolczko
#  Outer loop added by Alex Jacoby

# Task IDs
I_IDLE = 1
I_WORK = 2
I_HANDLERA = 3
I_HANDLERB = 4
I_DEVA = 5
I_DEVB = 6

# Packet types
K_DEV = 1000
K_WORK = 1001

# Packet

BUFSIZE = 4

BUFSIZE_RANGE = range(BUFSIZE)

class Packet(object):
    def __init__(self,l,i,k):
        self.link = l
        self.ident = i
        self.kind = k
        self.datum = 0
        self.data = [0] * BUFSIZE

    def append_to(self,lst):
        self.link = None
        if lst is None:
            return self
        else:
            p = lst
            next = p.link
            while next is not None:
                p = next
                next = p.link
            p.link = self
            return lst

# Task Records

class TaskRec(object):
    pass

class DeviceTaskRec(TaskRec):
    def __init__(self):
        self.pending = None

class IdleTaskRec(TaskRec):
    def __init__(self):
        self.control = 1
        self.count = 10000

class HandlerTaskRec(TaskRec):
    def __init__(self):
        self.work_in = None
        self.device_in = None

    def workInAdd(self,p):
        self.work_in = p.append_to(self.work_in)
        return self.work_in

    def deviceInAdd(self,p):
        self.device_in = p.append_to(self.device_in)
        return self.device_in

class WorkerTaskRec(TaskRec):
    def __init__(self):
        self.destination = I_HANDLERA
        self.count = 0
# Task

class TaskState(object):
    def __init__(self):
        self.packet_pending = True
        self.task_waiting = False
        self.task_holding = False

    def packetPending(self):
        self.packet_pending = True
        self.task_waiting = False
        self.task_holding = False
        return self

    def waiting(self):
        self.packet_pending = False
        self.task_waiting = True
        self.task_holding = False
        return self

    def running(self):
        self.packet_pending = False
        self.task_waiting = False
        self.task_holding = False
        return self

    def waitingWithPacket(self):
        self.packet_pending = True
        self.task_waiting = True
        self.task_holding = False
        return self

    def isPacketPending(self):
        return self.packet_pending

    def isTaskWaiting(self):
        return self.task_waiting

    def isTaskHolding(self):
        return self.task_holding

    def isTaskHoldingOrWaiting(self):
        return self.task_holding or (not self.packet_pending and self.task_waiting)

    def isWaitingWithPacket(self):
        return self.packet_pending and self.task_waiting and not self.task_holding





tracing = False
layout = 0

def trace(a):
    global layout
    layout -= 1
    if layout <= 0:
        print
        layout = 50
    print a
    print a,


TASKTABSIZE = 10

class TaskWorkArea(object):
    def __init__(self):
        self.taskTab = [None] * TASKTABSIZE

        self.taskList = None

        self.holdCount = 0
        self.qpktCount = 0

taskWorkArea = TaskWorkArea()

class Task(TaskState):


    def __init__(self,i,p,w,initialState,r):
        self.link = taskWorkArea.taskList
        self.ident = i
        self.priority = p
        self.input = w

        self.packet_pending = initialState.isPacketPending()
        self.task_waiting = initialState.isTaskWaiting()
        self.task_holding = initialState.isTaskHolding()

        self.handle = r

        taskWorkArea.taskList = self
        taskWorkArea.taskTab[i] = self

    def fn(self,pkt,r):
        raise NotImplementedError


    def addPacket(self,p,old):
        if self.input is None:
            self.input = p
            self.packet_pending = True
            if self.priority > old.priority:
                return self
        else:
            p.append_to(self.input)
        return old


    def runTask(self):
        if self.isWaitingWithPacket():
            msg = self.input
            self.input = msg.link
            if self.input is None:
                self.running()
            else:
                self.packetPending()
        else:
            msg = None

        self
        return self.fn(msg,self.handle)


    def waitTask(self):
        self.task_waiting = True
        return self


    def hold(self):
        taskWorkArea.holdCount += 1
        self.task_holding = True
        return self.link


    def release(self,i):
        t = self.findtcb(i)
        t.task_holding = False
        if t.priority > self.priority:
            return t
        else:
            return self


    def qpkt(self,pkt):
        t = self.findtcb(pkt.ident)
        taskWorkArea.qpktCount += 1
        pkt.link = None
        pkt.ident = self.ident
        return t.addPacket(pkt,self)


    def findtcb(self,id):
        t = taskWorkArea.taskTab[id]
        if t is None:
            raise Exception("Bad task id %d" % id)
        return t


# DeviceTask


class DeviceTask(Task):
    def __init__(self,i,p,w,s,r):
        Task.__init__(self,i,p,w,s,r)

    def fn(self,pkt,r):
        d = r
        assert isinstance(d, DeviceTaskRec)
        if pkt is None:
            pkt = d.pending
            if pkt is None:
                return self.waitTask()
            else:
                d.pending = None
                return self.qpkt(pkt)
        else:
            d.pending = pkt
            if tracing: trace(str(pkt.datum))
            return self.hold()



class HandlerTask(Task):
    def __init__(self,i,p,w,s,r):
        Task.__init__(self,i,p,w,s,r)

    def fn(self,pkt,r):
        h = r
        assert isinstance(h, HandlerTaskRec)
        if pkt is not None:
            if pkt.kind == K_WORK:
                h.workInAdd(pkt)
            else:
                h.deviceInAdd(pkt)
        work = h.work_in
        if work is None:
            return self.waitTask()
        count = work.datum
        if count >= BUFSIZE:
            h.work_in = work.link
            return self.qpkt(work)

        dev = h.device_in
        if dev is None:
            return self.waitTask()

        h.device_in = dev.link
        dev.datum = work.data[count]
        work.datum = count + 1
        return self.qpkt(dev)

# IdleTask


class IdleTask(Task):
    def __init__(self,i,p,w,s,r):
        Task.__init__(self,i,0,None,s,r)

    def fn(self,pkt,r):
        i = r
        assert isinstance(i, IdleTaskRec)
        i.count -= 1
        if i.count == 0:
            return self.hold()
        elif i.control & 1 == 0:
            i.control /= 2
            return self.release(I_DEVA)
        else:
            i.control = i.control/2 ^ 0xd008
            return self.release(I_DEVB)


# WorkTask


A = ord(''A'')

class WorkTask(Task):
    def __init__(self,i,p,w,s,r):
        Task.__init__(self,i,p,w,s,r)

    def fn(self,pkt,r):
        w = r
        assert isinstance(w, WorkerTaskRec)
        if pkt is None:
            return self.waitTask()

        if w.destination == I_HANDLERA:
            dest = I_HANDLERB
        else:
            dest = I_HANDLERA

        w.destination = dest
        pkt.ident = dest
        pkt.datum = 0

        for i in BUFSIZE_RANGE: # xrange(BUFSIZE)
            w.count += 1
            if w.count > 26:
                w.count = 1
            pkt.data[i] = A + w.count - 1

        return self.qpkt(pkt)

import time



def schedule():
    t = taskWorkArea.taskList
    while t is not None:
        pkt = None

        if tracing:
            print "tcb =",t.ident

        #print ''*'', t.__class__

        if t.isTaskHoldingOrWaiting():
            t = t.link
        else:
            if tracing: trace(chr(ord("0")+t.ident))
            t = t.runTask()

class Richards(object):

    def run(self, iterations):
        for i in xrange(iterations):
            taskWorkArea.holdCount = 0
            taskWorkArea.qpktCount = 0

            IdleTask(I_IDLE, 1, 10000, TaskState().running(), IdleTaskRec())

            wkq = Packet(None, 0, K_WORK)
            wkq = Packet(wkq , 0, K_WORK)
            WorkTask(I_WORK, 1000, wkq, TaskState().waitingWithPacket(), WorkerTaskRec())

            wkq = Packet(None, I_DEVA, K_DEV)
            wkq = Packet(wkq , I_DEVA, K_DEV)
            wkq = Packet(wkq , I_DEVA, K_DEV)
            HandlerTask(I_HANDLERA, 2000, wkq, TaskState().waitingWithPacket(), HandlerTaskRec())

            wkq = Packet(None, I_DEVB, K_DEV)
            wkq = Packet(wkq , I_DEVB, K_DEV)
            wkq = Packet(wkq , I_DEVB, K_DEV)
            HandlerTask(I_HANDLERB, 3000, wkq, TaskState().waitingWithPacket(), HandlerTaskRec())

            wkq = None;
            DeviceTask(I_DEVA, 4000, wkq, TaskState().waiting(), DeviceTaskRec());
            DeviceTask(I_DEVB, 5000, wkq, TaskState().waiting(), DeviceTaskRec());

            schedule()

            if taskWorkArea.holdCount == 9297 and taskWorkArea.qpktCount == 23246:
                pass
            else:
                return False

        return True

r = Richards()
iterations = 10
result = r.run(iterations)
print result

'
]

{ #category : #resources }
PythonParserTests >> source_test_161 [
	^ '
bla = {}
meuk = (12, 13)
z = (5,(3,4))

bla[1], (c, d) = z
print bla

class X: pass
x = X()

for x.z in [1,2,3]: print x.z
x.y, (c, d) = z

print x.y, x.z

s = [''a'', ''b'', ''c'']
s = ''abc''
for y in s: print y
print
print s, str(s), repr(s)

t2 = 1, ''een''
print ''%d %s'' % t2

f = dict([(1,''1''), (2, ''2'')])
print f


'
]

{ #category : #resources }
PythonParserTests >> source_test_162 [
	^ '
class City(object):
    def __init__(self):
        self.latitude = 1

class SortedTree(object):
    def __init__(self, compareKey):
        self.compareKey = compareKey

class Map(object):
    def __init__(self):
        st = SortedTree(lambda x: x.latitude)
        st.compareKey(c)

c = City()
m = Map()

print "1, 3, 5".replace(",", "")
print "1, 3, 5".replace(",", "", -1)
print "1, 3, 5".replace(",", "", 0)
print "1, 3, 5".replace(",", "", 1)

a = []
a = [[]]
a = [[1]]

b = []
b = [1]

d = ()
d = (5,)

print a, b, d

def bla(t):
    print t

bla(())
bla((1,))

def oink():
    return [[1]]
    return [[]]

oink()

def test(t=()):
  if t:
      print t
  else:
      test(t + (5,))

test()

e = {}
e[2,3] = 4

f = {}
f[5] = 6

print e, f

import os
x = os.listdir(''.'')


'
]

{ #category : #resources }
PythonParserTests >> source_test_163 [
	^ '
import time
time.sleep(1.01)

import sys
#print ''Python version:'', sys.version
sys.stdout.flush()

a = ''\001\00\0boink''
print repr(''hello, world'')
print repr(''hello\0, world2'')

print ''hello, world''
print repr(''hello\0, world2'') # XXX no repr!

print repr(a), len(a)
print repr(chr(0)), len(chr(0)+chr(0))
print repr(''\0'')
print repr(''''.join([chr(i) for i in range(256)]))

class behh:
    def __init__(self, a, b, c):
        pass

behh(1,2,c=3)

# sudoku solver!! see: http://markbyers.com/moinmoin/moin.cgi/ShortestSudokuSolver
def r(a):
  i=a.find(''0'')
  if not ~i: print a; sys.exit()
  [m in [a[j] for j in range(81) if not (i-j)%9*(i/9^j/9)*(i/27^j/27|i%9/3^j%9/3)] or r(a[:i]+m+a[i+1:]) for m in ''3814697265625'']
  return True # because the type of an ''or'' clause is the superset of its terms, we cannot (implicitly) return None here

r(81*''0'')


'
]

{ #category : #resources }
PythonParserTests >> source_test_164 [
	^ '
# basic string module support
import string
print string.join([''hello'', ''world!'']), string.join([''hello'', ''world!''], ''_'')

# add random.shuffle
import random
l = [1,2,3,4,5]
random.shuffle(l)
print set(l)

# add __or__ to builtin.int..
class c: # grr
   def a(self):
       return 1|1
   def b(self):
       return 1&1
   def c(self):
       return 1^1
   def d(self):
       return ~1

a_c = c()
print a_c.a(), a_c.b(), a_c.c(), a_c.d()

# fake child nodes conflicting for binary tuples (e.g. one for unit and one for first)
class LowLevel:
   def comRxHeader(self):
       (''a'', ''h'')
       (7, 8)

bsl = LowLevel()
bsl.comRxHeader()

# self.mergeinh instead of self.merge XXX fix others
class LowLevel2:
   def bslTxRx(self, addr):
       addr % 2

class BootStrapLoader2(LowLevel2):
    pass

bsl2 = BootStrapLoader2()
bsl2.bslTxRx(0)

# improve parent constructor calls
class L:
    def __init__(self):
        pass

class BSL(L):
    def __init__(self, a, b):
        L.__init__(self)

BSL(1, 2)

# for/while-else construction
bla = True
while bla:
    for a in range(10):
        for b in range(10):
            pass
        else:
            print ''bah1''
        while bla:
            bla = False
            break
        else:
            print ''bah4''
        break
    else:
        print ''bah2''
else:
    print ''bah3''

# user-defined exception class problems
class MyException(Exception):
    pass

try:
    raise MyException(''hoepa'')
except MyException, m:
    print m

# parent constructor call and default arguments
class LowLevel3:
    def __init__(self, a=1):
        pass

class BootStrapLoader3(LowLevel3):
    def __init__(self):
        LowLevel3.__init__(self)

BootStrapLoader3()


'
]

{ #category : #resources }
PythonParserTests >> source_test_165 [
	^ '
print 1, 2, ''3'', ''%.2f'' % 4.1
print ''%04x'' % 0xfeda

# ''..'' % (..)
print ''%d %x %d'' % (10, 11, 12)
print ''%d %s'' % (1, ''een'')
print ''%d %s %.2f'' % (1, ''een'', 8.1)

# ''..'' % tuple
t = (10, 11, 12)
print ''%x %d %x'' % t
t2 = (''twee'', 2)
print ''%s %04x'' % t2

# mod
a = ''%04x'' % 0xdefa
print a, a, ''%02x'' % 0x1234

# all chars
print ''%o'' % 10
print "%.4s %.4r\n" % ("abcdefg", "\0hoplakee")

# print to file
f = file(''testdata/binf'', ''w'')
print >>f, ''ik haat %04x\n'' % 0xfeda, ''smurven..\n''
f.close()

# conversions
print repr(''?%% %c?'' % 70), repr(''?%c?%%'' % 0), ''%c'' % ''X''
print ''!%s!'' % [1,2,3]
print ''%.2f %d %.2f %d'' % (4, 4.4, 5.5, 5)
print ''%s.'' % 1, ''%s.'' % (1,)

# %s, %r
print repr(18), repr(''x'')
print ''aha %s %r'' % (18, 19)

# class file
f = file(''testdata/hopsakee'')
print 1, f.readline(),
print f.readline(5)
print f.readline(),
f.close()

print 2, file(''testdata/hopsakee'').read()

print 3, file(''testdata/hopsakee'').readlines()

for line in file(''testdata/hopsakee''):
    print ''aha'', line,



'
]

{ #category : #resources }
PythonParserTests >> source_test_166 [
	^ '# optional start/end arguments for str.{count, startswith, endswith}

def hop(b):
    if b: print 1
    else: print 0

hop(''hoi''.startswith(''ho'', 0))
hop(''hoi''.startswith(''ho'', 0, 3))
hop(''hoi''.startswith(''ho'', 0, -1))
hop(''hoi''.endswith(''oi''))
hop(''hoi''.endswith(''oi'', 0, 3))
hop(''hoi''.endswith(''ho'', 0, -1))
hop(''hoi''.endswith(''ho'', -3, 2))
hop(''hoi''.startswith('':'', 3))
hop(''hoi:''.startswith('':'', 3))

print ''hoooi''.count(''o'')
print ''hoooi''.count(''o'', 2)
print ''hoooi''.count(''o'', 0, -2)

# mother contour (6,5) -> (1,1) instead of (1,5)
def getopt(args, longopts):
    opts = []
    opts.append(('''',))

    do_longs(opts, longopts)

def do_longs(opts, longopts):
    [o for o in longopts]

wa = ['''']

getopt(wa, wa)

# cStringIO.StringIO, file.seek
import cStringIO, sys

s = cStringIO.StringIO(file(''testdata/hopsakee'').read())
print s.readlines()

s = file(''testdata/hopsakee'')
print s.name
print s.mode
print s.read()

f = file(''testdata/hopsakee'')
print f.read()
f.seek(0)
print f.read()
f.close()

s = cStringIO.StringIO(''blaat'')
s.seek(-3, 2)
print s.read()

s = cStringIO.StringIO()
print s.tell()
s.write(''hallo\njoh'')
print s.tell()
s.seek(0, 0)
print s.tell()
print s.readlines()
print s.tell()
s.seek(0, 0)
print s.tell()
s.write(''hoi'')
print s.tell()
print s.readlines()
print s.tell()
blah = set([])
'
]

{ #category : #resources }
PythonParserTests >> source_test_167 [
	^ '
print '''',
print ''hoi'', ''huh'',
print ''hophop''
print '''',
print ''beh''

print [1,2,3,1].index(1)
print [1,2,3,1].index(1, 1)
print [1,2,3,1].index(1, -1)
print [1,2,3,1].index(1, -4)
print [1,2,3,1].index(1, -3, 4)

def RemoveElts(list):
   newlist=list[:]
   return newlist
print RemoveElts([3])

try:
    try:
       {1:2}[3]
    except KeyError, e:
       raise e
except KeyError, m:
    print m

blah = set([])
blah.add(1)
print blah

def MergeAndVerify(newModList,finalModHash):
    if newModList == []:
        return finalModHash



'
]

{ #category : #resources }
PythonParserTests >> source_test_168 [
	^ '
a = frozenset([1])
d = a & a
d = a | a
d = a - a
d = a ^ a
print a, d

c = set([1,2])
e = set([])
f = set()
print c, e, f

g = frozenset([1])
h = {}
h[g] = 4
print h
h[frozenset([3,2,1])] = 5
del h[frozenset([1])]
for x in h:
    print sorted(x), h[x]

try:
    {set([1]): 1}
except TypeError, m:
    print m

z,y  = [(1,2),(3,), (4,5,6)], [(3,),(4,5,6),(1,2)]
v, w = frozenset(z), frozenset(y)
print ''eq'', [0, 1][v == w]
print ''hash'', [0, 1][hash(v) == hash(w)]

k = set([1])
k = frozenset([2])


'
]

{ #category : #resources }
PythonParserTests >> source_test_169 [
	^ '
# --- assignment expressions
bweh = (2,[4,6])
[a, (b,c)] = bweh
print a,b,c
(a,b), (c,d) = (6,9), (8,7)
print a,b,c,d
[(a,b), (c,d)] = (9,8), (7,6)
print a,b,c,d
[(a,b), (c,d)] = [(1,8), (7,2)]
print a,b,c,d
[[a,b],c] = (5,6),3
print a,b,c
[[a,b],c] = [[4,5],6]
print a,b,c
a, [b,c] = [1, (2,3)]
print a,b,c
a, (b,c,d) = 1, (1,2,3)
print a,b,c,d
[(a,b), [c,d]] = [[1,2], (3,4)]
print a,b,c,d
njeh = [[8,7,6],[5,4,3],[2,1,0]]
[[a,b,c],[d,e,f],[g,h,i]] = njeh
print a,b,c,d,e,f,g,h,i
[dx,[a,b,c],ex] = njeh
print dx,a,b,c,ex
blah = (1,2,3,4,5,6)
a,b,c,d,e,f = blah
print a,b,c,d,e,f

# --- underscore in assignment
_ = 4
print _, _
#a, _ = 1, ''2''
#huh = 1, 2
#_, b = huh
#mtx = [[1,2,3],[4,5,6],[6,7,8]]
#[du, [x, y, _], _] = mtx
#print du, x, y
#hop = [(1,(2,3))]
#for _ in hop: print ''hop''
#for _, (a,b) in hop: print ''hop'', a, b
#for a, (_,b) in hop: print ''hop'', a, b
#for a, _ in hop: print ''hop'', a
#print [''hop'' for _ in hop]
#print [''hop %d %d'' % (a,b) for _, [a,b] in hop]
#print [''hop %d %d'' % (a,b) for a, [_,b] in hop]
#print [''hop %d'' % a for a, _ in hop]

# --- except ''tuple''
for a in range(2):
    try:
        if not a: assert 1 > 2, ''parasmurf''
        else: {1:2}[3]
    except (AssertionError, KeyError), m:
        print ''foutje3 of 4'', m

# --- getopt.GetoptError test
import getopt
try:
    opts, args = getopt.getopt([''-x''], ''nf:'', [''nowrap'', ''flags=''])
except getopt.GetoptError:
    print ''fout''


'
]

{ #category : #resources }
PythonParserTests >> source_test_170 [
	^ '
# --- model list.__str__ call to elem.__repr__
class Vertex(object):
    def __repr__(self):
        return ''rrrepr''
print [Vertex()]

# --- always true/false, but should work
print [0,1][isinstance(7.0, float)]
print [0,1][isinstance(7, int)]

# --- initialize class attrs in .cpp file
class blah:
    blah = ''blah''
    blah2 = (''blah'', ''blah'')
    blah3 = abs(-1)
print blah.blah, blah.blah2, blah.blah3

# --- inf
a,b = -1e500, 1e500; print a,b

# --- argh
print sorted(''hopla'')

# --- dict<void *, void*> *
d = {}
print d

# --- cl attr problem
class FilebasedMazeGame:
    hop = 18
    def __init__(self):
        a = FilebasedMazeGame.hop
        print a

FilebasedMazeGame()

# --- define cl before use
def print_aap():
    aap = Aap()
    print aap

class Aap:
    def __repr__(self):
        return ''hrngh!''

print_aap()

# --- virtual case
class hop:
    def hop(self):
        self.hop2()

class hop2(hop):
    def hop2(self):
        print ''hop2''

hop2().hop()

# --- str.split
s = " foo zbr bar "

print "default separator:"
print s.split(None)
print s.split(None, 0)
print s.split(None, 1)

print "space separator:"
print s.split('' '')
print s.split('' '', 0)

# --- comparison
class g: pass
e, f = g(), g()
print (e < f) + (e > f), [0,1][e == f]


'
]

{ #category : #resources }
PythonParserTests >> source_test_171 [
	^ '
# --- math.pow
import math
print int(math.pow(2,3))
print pow(2.0,3.0)
print pow(2,3.0)
print pow(2.0,3)
print pow(2,3)
print pow(1000,1000,1234)

# --- end-of-file problem
print [l for l in file(''testdata/scene.txt'') if l.startswith(''material'')]

# --- append ''.0'' when printing ''integer'' floats (but not in case of %g!)
print 8.0, ''%g'' % 8.0

# --- iterators
b = [1,2,3]
for a in b:
    print a,
print
print [a for a in b]

g = iter(b)
for x in range(3):
    print g.next(),
print
print [n for n in iter(b)]

h = iter(b)
e = iter(h)
for f in e:
    print f,
print

i = [1,2,3]
i = iter(i)
i = [1,2,3]

for j in i:
    print j,
print

print [j for j in i]

print [y for y in ''stroop'']
print [n for n in {1: ''1'', 2: ''2'', 3: ''3''}]
print [z for z in [[1],[2],[3]]]
print sorted([m for m in set([1.0,2.0,3.0])])
print [l for l in file(''testdata/hoppa'')]

# --- generators

def blah(a):
    while a > 0:
        yield a
        yield 17
        a -= 1

hop = blah(3)
for x in range(4):
    print hop.next(),
print
hop = blah(1)
try:
    for x in range(4):
        print hop.next(),
    print
except StopIteration:
    print ''klaar.''

# --- verify some things still work
import os.path
print os.path.split(''hoempa/nohu'')
import math
print ''%g'' % math.log(10)

# --- % revisited
print -2 % 3
print 2 % 3
print math.fmod(-2.0, 3)
print -2.0 % 3
print 4 % 3
print 4 % 3.0
print math.fmod(2.0, -3)
print -2.0 % -3
print -2.0 % -3.0
print 2.0 % -3.0
print ''%g'' % 3.0

# --- and/or revisited
print 0 or 5 or 4
print 0 or 0
print 1 > 2 or 3 < 4
ax = [1]
ax = []
bx = [2]
print ax or bx
print [0,1][(ax or None) is None]
print bx or None
print None or bx
print 1 and 4, 4 and 1
print bx and []

def ef(x):
    print ''hah'', x
    return 0
ef(5) and ef(6)

# --- allow mixing when result is not used
n = 1
n < 0 or bx
bx and n > 1

# --- make this compile (XXX we shouldn''t implicitly call parent constructors though)
class smurf:
    def __init__(self, a=-1):
        print ''hallo'', a

class baviaan(smurf):
    def __init__(self, a=-1):
        print ''oehoehoe'', a

smurf()
baviaan()

# --- simple itertools functions
#import itertools
#gg = itertools.count()
#print [gg.next() for i in range(10)]
#
#cycle = itertools.cycle(range(3))
#print [cycle.next() for i in range(10)]
#
#repeat = itertools.repeat([1,2,3], 10)
#print [repeat.next() for i in range(3)]

# --- xrange, enumerate, reversed as iterators
ah = xrange(10)
for x in ah: print x,
print
ah = xrange(0,10,3)
for x in ah: print x,
print
ah = xrange(10,0,-3)
for x in ah: print x,
print

bh = enumerate(xrange(10,0,-3))
print [y for y in bh]
ch = enumerate([(1.0, ''s'') for x in range(4)])
print [z for z in ch]

print [zz for zz in reversed(range(10))]
print [zzz for zzz in reversed(xrange(10))]

# --- dict.{iterkeys, itervalues, iteritems}
waa = {1: ''2'', 2: ''4''}

for wax in waa.iterkeys():
    print wax,
print
for way in waa.itervalues():
    print way,
print
for wat in waa.iteritems():
    print wat,
print


'
]

{ #category : #resources }
PythonParserTests >> source_test_172 [
	^ '

import random

# --- module-level functions
random.seed(37)
rstate = random.getstate()   # (state is not cross-compatible with CPython)
random.setstate(rstate)
for i in range(25):
    print "%.8f" % random.random()
    print random.randrange(-30,15)
    print random.randrange(-15,15,3)
    print random.randint(50,100)
    fibs = [0,1,1,2,3,5,8,13,21]
    print fibs
    print random.choice(fibs)
    print random.sample(fibs,3)
    random.shuffle(fibs)
    print fibs
    nums = [3.141, 2.71828, 1.41421, 1.0]
    print nums
    print random.choice(nums)
    print random.sample(nums,3)
    random.shuffle(nums)
    print nums
    print "%.8f" % random.uniform(-0.5,0.5)
    print "%.8f" % random.normalvariate(0.0, 1.0)
    print "%.8f" % random.lognormvariate(0.0, 1.0)
    print "%.8f" % random.expovariate(1.0)
    print "%.8f" % random.vonmisesvariate(0.0, 1.0)
    print "%.8f" % random.gammavariate(20.0, 1.0)
    print "%.8f" % random.gauss(0.0, 1.0)
    print "%.8f" % random.betavariate(3.0, 3.0)
    print "%.8f" % random.paretovariate(1.0)
    print "%.8f" % random.weibullvariate(1.0, 1.0)
    #print "%.8f" % random.stdgamma(1.0,1.0,1.0,1.0) # deprecated in CPython
    #print "%.8f" % random.cunifvariate(0.0,1.0)     # deprecated in CPython
    print random.getrandbits(8)
    print random.getrandbits(16)
    print random.getrandbits(30)
    print ''''

# --- (test set for RNGs)
def runrng(r):
    print "%.8f" % r.random()
    print r.randrange(0,10)
    print r.randrange(-10,10,2)
    print r.randint(-5,5)
    fibs = [0,1,1,2,3,5,8,13,21]
    print fibs
    print r.choice(fibs)
    print r.sample(fibs,4)
    r.shuffle(fibs)
    print fibs
    nums = [3.141, 2.71828, 1.41421, 1.0]
    print nums
    print random.choice(nums)
    print random.sample(nums,1)
    random.shuffle(nums)
    print nums
    print "%.8f" % r.uniform(-0.5,0.5)
    print "%.8f" % r.normalvariate(0.0, 1.0)
    print "%.8f" % r.lognormvariate(0.0, 1.0)
    print "%.8f" % r.expovariate(1.0)
    print "%.8f" % r.vonmisesvariate(0.0, 1.0)
    print "%.8f" % r.gammavariate(20.0, 1.0)
    print "%.8f" % r.gauss(0.0, 1.0)
    print "%.8f" % r.betavariate(3.0, 3.0)
    print "%.8f" % r.paretovariate(1.0)
    print "%.8f" % r.weibullvariate(1.0, 1.0)
    #print "%.8f" % r.stdgamma(1.0, 1.0, 1.0, 1.0) # deprecated in CPython
    #print "%.8f" % r.cunifvariate(0.0, 1.0)       # deprecated in CPython
    print ''''

# --- random.Random (Mersenne Twister)
mt = random.Random()
mt.seed()
mt.seed(79)
mtstate = mt.getstate()   # (state is not cross-compatible with CPython)
mt.setstate(mtstate)
#mt.jumpahead(1000000)    # (not yet supported)
for i in range(25): runrng(mt)

# --- random.WichmannHill
wh = random.WichmannHill()
wh.seed()
wh.seed(86)
wh.whseed()
wh.whseed(41)
whstate = wh.getstate()   # (state is not cross-compatible with CPython)
wh.setstate(whstate)
wh.jumpahead(1000000)
for i in range(25): runrng(wh)


'
]

{ #category : #resources }
PythonParserTests >> source_test_173 [
	^ '
# --- division revisited
print -496 // 3, 496 // 3, -496 // -3, 496 // -3
print -496.0 // 3.0, 496.0 // 3.0, -496.0 // -3.0, 496.0 // -3.0
print -496.0 // 3, 496 // 3.0, -496.0 // -3, 496 // -3.0
print -496 / 3, 496 / 3, -496 / -3, 496 / -3

print ''%g'' % (-496.0 / 3.0), ''%g'' % (496.0 / 3.0), ''%g'' % (-496.0 / -3.0), ''%g'' % (496.0 / -3.0) # XXX no ''%g''
print ''%g'' % (-496.0 / 3), ''%g'' % (496 / 3.0), ''%g'' % (-496.0 / -3), ''%g'' % (496 / -3.0)

xx, yy, zz = divmod(-496, 3), divmod(-496.0, 3), divmod(-496, 3.0)
print xx, yy, zz

print divmod(-496, 3), divmod(496, 3), divmod(-496, -3), divmod(496,-3)
print divmod(-496.0, 3.0), divmod(496.0, 3.0), divmod(-496.0, -3.0), divmod(496.0,-3.0)
print divmod(-496.0, 3), divmod(496, 3.0), divmod(-496.0, -3), divmod(496,-3.0)

# --- don''t crash
print [0]*-4, (0,)*-4, repr(''0''*-4)

# --- list.extend takes iterable
w = [1,2]
w.extend(set([3]))
print w

# --- use %.12g to print floats
print 1/3.0, 1.1234123412341234, 1.1, 8.0
#print 9.12341234e20 # XXX difference on win, e020?

# --- slice assignment (random test)
import random
random.seed(10)

for x in range(1000):
    l,u,s = random.randrange(-5,5), random.randrange(-5,5), random.randrange(-5,5)
    a = range(5)
    print a, ''lower'', l, ''upper'', u, ''step'', s
    try:
        z = range(random.randrange(0,5))
        print ''xrange'', z
        a[l:u:s] = z
        print ''done'', a
    except ValueError, v:
        print v

ax = range(10)
ax[-2:-3] = [0,1]
print ax

# --- do not print space after 14
print 14,
print
print ''boe''

# --- aug assignment revisited
class hoepa:
    def __init__(self):
        self.elems = [1,2,3]
        self.smurf = 1
    def __getitem__(self, index):
        print ''get'', index
        return self.elems[index]
    def __setitem__(self, index, elem):
        print ''set'', index, elem
        self.elems[index] = elem

uh = hoepa()

uh[2] = 3
print uh[2]
uh[2] += 4
print uh.elems

ux = 1
ux += 1
print ux

uy = [1]
uy += [2]
print uy

uh.smurf += 1
print uh.smurf

blah = [1,2,4]
blah[2] += 5
print blah

ud = {''7'': 7}
print ud[''7'']
ud[''7''] = 8
ud[''7''] += 1
print ud

class hoepa2:
    def __init__(self):
       self.hop = {}
    def __getitem__(self, index):
        print ''get'', index
        return self.hop[index]
    def __setitem__(self, index, elem):
        print ''set'', index, elem
        self.hop[index] = elem
    def __delitem__(self, index):
        del self.hop[index]

yh = hoepa2()
yh[1,2] = 10
yh[1,2] += 10
print yh[1,2]

# --- __delitem__
print yh.hop
del yh[1,2]
print yh.hop

yx = [1,2,3]
del yx[1]
print yx

# --- some string tests
import string
print string.join([''a'',''b''])
print string.join([''a'',''b''], ''_'')
print string.find(''abc'', ''b'')
print string.find(''abc'', ''b'', 0)
print string.find(''abc'', ''b'', 0, 3)
print string.split(''a b c'')
print string.split(''a b c'', '' '')
print string.split(''a b c'', '' '', 1)
print string.replace(''abc'', ''c'', ''d'')
print string.replace(''abc'', ''c'', ''d'', 1)
print string.count(''abc'', ''b'')
print string.count(''abc'', ''b'', 0)
print string.count(''abc'', ''b'', 0, 3)
print string.expandtabs(''abc'')
print string.expandtabs(''abc'', 4)
print string.strip('' abc '')
print string.strip(''xabcx'', ''x'')
print string.ljust(''abc'', 8)
print string.ljust(''abc'', 8, ''_'')
print string.rsplit(''a b c'', '' '', 1)

# --- recursive generator test
def A003714():
    yield 1
    for x in A003714():
        yield 2*x
        if not (x & 1):
            yield 2*x+1

hop = A003714()
for x in range(20):
    print hop.next(),
print

# --- allow ''self'' as formal argument in non-method function
def blahx(self, x):
    print self, x
blahx(18, 19)



'
]

{ #category : #resources }
PythonParserTests >> source_test_174 [
	^ '
# iter.__len__
print len(xrange(10))

# try.. else
try: print ''probeer''
except Exception: pass
else: print ''geen exceptie..''

# collections
from collections import deque

d = deque([3,2,1])
d.append(4)
d.appendleft(0)

print len(d)

for i in range(len(d)):
    print d[i],
print

print d.pop(), d.popleft()

print d

while d:
    print d
    d.pop()

d = deque([3,2,1])
e = iter(d)
print [x for x in e]

d.extend(set([4,5]))
print d
d.extendleft(set([6,7]))
print d

print sorted(d), [e for e in reversed(d)]

d[2] = d[-2] = 4
print d

print [0,1][4 in d], [0,1][9 in d]

#d.remove(1) # python 2.5
#print d

d.rotate(3)
print d
d.rotate(-2)
print d

d = deque()
print d

d.rotate(1) # no error
print d

d.clear()
print d

d.extend(xrange(10))
del d[-4]
print d

print [e for e in reversed(deque(xrange(10)))]

# bisect
from bisect import *

def blah(s, e):
    print bisect_left(s, e)
    print bisect_left(s, e, 0)
    print bisect_left(s, e, 0, len(s))
    print bisect_right(s, e)
    print bisect(s, e)

    insort_left(s, e)
    insort_right(s, e)
    insort(s, e)
    print s


blah([1,2,3,4,5,6,6,7], 4)
#blah([''1'',''2'',''3'',''4'',''5'',''6'',''7''], ''4'')

# copy
import copy

kb = [1,2]
ka = copy.copy(kb)
ka.append(3)
print ka, kb, copy.copy(178)

print copy.copy((1, 2)), copy.deepcopy((2, 3))
print copy.copy(''1234''), copy.deepcopy(''1234'')
print copy.copy((1, ''1'')), copy.deepcopy((1, ''1''))
print sorted(copy.copy(set([1, 2]))), sorted(copy.deepcopy(set([1, 2])))
print copy.copy({1 : 1.0}), copy.deepcopy({1.0 : 1})
print copy.copy(deque(range(10))), copy.deepcopy(deque(xrange(10)))

kc = [1,2]
kd = (kc,)
ke = copy.deepcopy(kd)
ke[0][0] = 3
print kd, ke

rll = [1, 2]
bll = [rll, rll]
cll = copy.deepcopy(bll)
cll[0].append(3)
print cll

class bert:
    pass

abert = bert()
abert.a = 7.0

cbert = bert()
cbert.a = 1.0

print abert.a, cbert.a

copy.copy(abert)
copy.deepcopy(abert)

class dert:
    pass

adert = dert()
adert.a = [1,2]

bdert = copy.copy(adert)
bdert = copy.deepcopy(adert)
bdert.a.append(3)

# reversed(xrange)
import random
random.seed(1)

for z in range(1000):
    l,u,s = random.randrange(-5,5), random.randrange(-5,5), random.randrange(-5,5)
    print l, u, s

    try:
        x = xrange(l,u,s)
        y = reversed(xrange(l,u,s))

        xl = [e for e in x]
        yl = [e for e in y]

        print xl, yl, [0, 1][xl == list(reversed(yl))]

    except ValueError, v:
        print v

# for _ in (x)range
total = 0
for _ in range(10):
    for _ in range(10):
        total += 1
print total

print [0 for _ in range(10)]

# remove ifa_empty_constructors
fromage = []
def non_internal(ptree):
    noni = [c for c in ptree]

ptree = [1,2]
row_pointers = [None, ptree]
non_internal(row_pointers[1])

# string.maketrans
import string
si = ''abcde''
t1 = string.maketrans(''abc'', ''xyz'')
print si.translate(t1)

# optimize dict[..] += ..
dd = {}
dd[''hoi''] = 0
dd[''hoi''] += 10
print dd[''hoi'']



'
]

{ #category : #resources }
PythonParserTests >> source_test_175 [
	^ '
# --- out of bounds can be okay
a = range(5)
print a[:10], a[:10:2]
print a[-10:], a[-10::2]

# --- abs
class C:
  def __abs__(self):
      return self
  def __neg__(self):
      return self
  def __repr__(self):
      return ''C''

print abs(C()), abs(23), abs(-1.3), -abs(C())

# --- str.translate problem
import string
atable = string.maketrans("bc", "ef")
print ''abcdeg''.translate(atable, "cde")
gtable = string.maketrans("", "")
word = ''aachen\n''
key = word.translate(gtable, "a\n")
print ''word'', repr(word)

# --- string.{capitalize, capwords, swapcase, center, atoi, atol, atof}
print string.capitalize(''hoi''), '' hoi''.capitalize()
print string.capwords(''yo   momma'')+''!''+string.capwords('' yo momma '')+''!''+string.capwords('' yo momma '', ''mm'')+''!''
allchars = ''''.join([chr(x) for x in range(256)])
print repr(allchars.swapcase()), repr(string.swapcase(allchars))
print string.center(''hoi'', 10), string.center(''hoi'', 10, ''u'')
print ''hoi''.center(10, ''u'')
for i in range(10):
    print ''!''+''hoi''.center(i)+''!''
print string.atoi(''+0x10'', 0), string.atol(''-100l'', 0), string.atof(''-1.234'')

# --- improve overloading
class D:
    def __int__(self): return 7
    def __float__(self): return 7.0
    def __str__(self): return ''__str__''
    def __repr__(self): return ''__repr__''
    def __cmp__(self, b): return 1
    def __nonzero__(self): return True
    def __len__(self): return 1

d = D()

print [0,1][bool(d)], str(d), int(d), float(d), max([d,d]), min([d,d])
if 5: print 5
if d: print 6


'
]

{ #category : #resources }
PythonParserTests >> source_test_176 [
	^ '
# --- string formatting problem
print ''%i%%-%i%%'' % (1,2)
numbers = (1,2)
print ''%i%%-%i%%'' % numbers
print ''%i%%-%s%%'' % (12, ''21'')
t2 = (12, ''21'')
print ''%i%%-%s%%'' % t2

# --- aug assign problem (or: the value of testing)
a = [1,2,3,4,5]
c = a
b = [6,7,8,9,10]

a += b
print a, c

ah = ''12345''
ch = ah
bh = ''67890''
ah += bh
print ah, ch

# --- __iadd__ etc.
class C:
    def __init__(self, value):
        self.value = value

    def __iadd__(self, other):
        self.value += other.value
        return self

    def __floordiv__(self, b):
        return C(self.value // b.value)

    def __ifloordiv__(self, b):
        self.value //= b.value
        return self

    def __str__(self):
        return str(self.value)

x = C(4)
x += x
x.__iadd__(x)
print x

print [1,2].__iadd__([2,3])

y = [1,2,3]
y += set([4,5])
print y

v = 3
v += 1.5
print v

hm = []
hm += set([1])
print hm

d = C(8)
print d // C(3)
d //= C(3)
print d

# --- inheritance problem
class Maze(object):
    def __init__(self):
        self.maze = [[0]]
        self.maze[0][0] |= 1

class ASCIIMaze(Maze):
    pass

maze = ASCIIMaze()


'
]

{ #category : #resources }
PythonParserTests >> source_test_177 [
	^ '
# --- import problem
from testdata.bert import *
z = zeug()

# --- ''_'' renaming mangle
import testdata.bert

class hello:
    def hello(self):
        testdata.bert.hello(1)

s=hello().hello()


'
]

{ #category : #resources }
PythonParserTests >> source_test_178 [
	^ '
# --- more aug assignment
f = -112
print f
f /= -3
print f, f / -3
f %= -3
print f
f //= -1
print f

d={}

somme = 9.0
i=4
j=5

d[i,j] = 3.0
d[i,j] += somme
d[i,j] *= somme
d[i,j] /= somme

print d

e = {}
e[i,j] = -7
e[i,j] /= -2
e[i,j] *= -2
e[i,j] %= -2
e[i,j] //= -2

print e

# --- tests these for once
print max([1])
print max(1, 2)
print max(7.7, 7)
print max(7, 7.7)
print max(1, 2, 3)
print max(1, 2, 3, 4, 5)

print min([1])
print min(1, 2)
print min(6.7, 7)
print min(7, 6.7)
print min(1, 2, 3)
print min(1, 2, 3, 4, 5)

# --- virtual test case 1
class Z:
    def boink(self, a):
        pass

    def beh(self):
        print self.boink(9)

class Y(Z):
    def boink(self, a):
        return a

y = Y()
y.beh()

# --- virtual test case 2
class C:
    def boink(self):
        print ''C''

class D(C):
    pass

class A(C):
    def boink(self):
        print ''A''

class B(C):
    pass

c = D()
c.boink()

b = B()
b = A()
b.boink()

# --- virtual case 3
class CC:
    pass

class AA(CC):
    def __init__(self):
        self.a = 4

class BB(CC):
    def __init__(self):
        self.a = 5

cc = AA()
cc = BB()
print cc.a

# --- just in case
this = 1


'
]

{ #category : #resources }
PythonParserTests >> source_test_179 [
	^ '
#simple fixes
print 8+(2 if 1 else 3)
print repr(''\377ai\37aoi\001123\00hoi\01hoi\0hoi'')

# add_strs()
print ''x''+''x''+''x''

#os.path
import os.path

print os.path.join(''heuk'')
print os.path.join(''heuk'', ''emeuk'')
print os.path.join(''heuk'', ''emeuk'', ''meuk'')

from os.path import *

print join(''a'',''b'',''c'')

realpath(''run.py'')
commonprefix([''xxx'', ''xxxx''])
normcase(''hoei'')
splitext(''hoei/woei'')
splitdrive(''hoei/woei'')
basename(''hoei/woei'')
dirname(''hoei/woei'')
exists(''testdata'')
lexists(''testdata'')
isdir(''testdata'')
isfile(''testdata'')

def bleh(arg, top, names):
    pass
def bleh2(arg, top, names):
    pass

walk(''testdata'', bleh, 77)
walk(''testdata'', bleh2, ''hoei'')

getsize(''run.py'')
getatime(''run.py'')
getctime(''run.py'')
getmtime(''run.py'')

#locally overloading builtin definition
str = ''4''

t = (''aha'', 2)
str, x = t

def heuk(str):
    pass
heuk(''aha'')

for str in [''hah'']:
    pass
[0 for str in [''hah'']]

for (str,bah) in [(''hah'', ''bah'')]:
    pass
[0 for (str,bah) in [(''hah'', ''bah'')]]

#missing string methods
print ''ab\ncd\r\nef\rghi\n''.splitlines()
print ''ab\ncd\r\nef\rghi\n''.splitlines(1)
print int(''This Is A Title''.istitle())
print int(''This is not a title''.istitle())
print ''a and b and c''.partition(''and'')
print ''a and b and c''.rpartition(''and'')

#default argument problem
def msplit(sep=0, spl=-1):
    return ['''']

cnf = msplit()

#ctype
import string
print repr(string.lowercase)
print repr(string.uppercase)
print repr(string.letters)
print repr(string.printable)
print repr(string.punctuation)
print repr(string.whitespace)
print repr(string.digits)
print repr(string.hexdigits)
print repr(string.octdigits)

#dict.get problem
print {''wah'': 2}.get(''aap'', 3)

#finish getopt
from getopt import getopt, gnu_getopt

args = [''-ahoei'', ''--alpha=4'', ''meuk'']

print getopt(args, "a:b", ["alpha=", "beta"])
print getopt(args, "a:b", {"alpha=" : 0, "beta" : 0})
print gnu_getopt(args, "a:b", ["alpha=", "beta"])
print gnu_getopt(args, "a:b", {"alpha=" : 0, "beta" : 0})
print getopt(args, "a:b", "alpha=")
print gnu_getopt(args, "a:b", "alpha=")

#OSError
import os

try:
    os.chdir(''ontehunoe'')

except OSError, e:
#    print e
#    print repr(e)
    print e.errno
#    print e.strerror
    print e.filename

#int(), float(), str(); test all
print int(), float(), list(), dict(), set(), tuple(), frozenset(), # XXX repr(str())

#collections.defaultdict
from collections import defaultdict

s1 = ''mississippi''
d1 = defaultdict(int)
for k1 in s1:
    d1[k1] += 1

print sorted(d1.items())

s2 = [(''yellow'', 1), (''blue'', 2), (''yellow'', 3), (''blue'', 4), (''red'', 1)]
d2 = defaultdict(list)
for k2, v2 in s2:
    d2[k2].append(v2)

print sorted(d2.items())

s3 = [(''red'', 1), (''blue'', 2), (''red'', 3), (''blue'', 4), (''red'', 1), (''blue'', 4)]
d3 = defaultdict(set)
for k3, v3 in s3:
    d3[k3].add(v3)

print sorted(d3.items())


'
]

{ #category : #resources }
PythonParserTests >> source_test_18 [
	^ '
cube = []                                # [list_float_int]
#cube.append(1)                           # [None]
cube.append(1.0)                         # [None]

'
]

{ #category : #resources }
PythonParserTests >> source_test_180 [
	^ '
#re
import re

try:
        a = re.compile(r''\b(?P<email_name>[\w.-]+?)@(?P<email_domain>[a-z.-]{3,})\b'', re.IGNORECASE)
        b = ''bob (BoB@gmaiL.com) said to sally (sally123_43.d@hOtmail.co.uk) that no-name (not_a-real@em_ail.dres) was annoying...''

        print a.search(b, 20).group(0)
        print a.match(b, 5).expand(r''the found name: \g<email_name>\nthe domain: \g<email_domain>'')
        print a.subn(r''\1 AT \g<email_domain>'', b)
        print a.sub(r''<a href="mailto:\g<0>">\1</a>'', b)
#       print a.findall(b)

        c = re.compile(r''''''
                \b
                (?P<protocol>https?|(ftp)|(?P<mailto>mailto))
                :(?(mailto)|//)
                (
                        (?P<user>[\w._-]+?)
                        (?(mailto)

                                |
                                        :(?P<pass>[\w._-]*?)
                        )
                        @
                )?
                (?P<domain>[\w.-]+)
                (?(mailto)

                        |
                                (?P<path>/[^\s]*)
                )
                \b
                '''''', re.X)
        d = ''fasdf mailto:bob@gmail.com, dasdfed ftp://haha:hoho@bla.com/files, http://fsesdf@asd.com orRLY!!?!L!? \
        https://example.com/OMG.html''

        allm = c.finditer(d)
        i = 1
        for mo in allm:
                s = str(i) + '': \n''
                s += ''\tfull: '' + mo.group(0)
                s += ''\n\tnamed: ''

                gd = mo.groupdict()
                for k in sorted(gd):
                        if gd[k] == None: continue
                        s += ''\n\t\t'' + k + '': '' + gd[k]

                print s
                i += 1

        print re.split(r''\W+'', b)
        print re.split(r''(\W+)'', b, 2)

except re.error, msg:
        print msg

#time
import time
try:
    print time.mktime(time.struct_time((1970, 2, 17, 23, 33, 34, 1, 48, -1)))
    print time.mktime((1970, 2, 17, 23, 33, 34, 3, 17, -1))
    print time.localtime(4142014)
#    print time.localtime()
#    print time.localtime(time.mktime(time.localtime()))
#    print time.gmtime(time.mktime(time.gmtime()))
#    print time.asctime()
    print time.asctime(time.struct_time((2008, 6, 24, 12, 50, 00, 0, 120, -1)))
#    print time.ctime()
    print time.ctime(1000000)
    y = (2008, 6, 24, 12, 50, 00, 0, 120, -1)
    x = time.struct_time(y)
    print x
    print x.tm_mon
    print x[6]
#    print time.strftime("%R",time.localtime())
#    print time.strftime("%a, %d %b %Y %H:%M:%S +0000", time.gmtime())
    print time.strftime("%a, %d %b %Y %H:%M:%S",
            (2008, 6, 24, 12, 50, 00, 0, 120, -1))
#    print time.strftime("%d %b %Y %H:%M:%S", time.strptime("2001-11-12 18:31:01", "%Y-%m-%d %H:%M:%S")) # XXX %a
#    print time.strftime("%Y", time.strptime("2001", "%Y")) # XXX %a
#    print time.timezone
    print len(time.tzname)

except TypeError, e:
    print e

#corner cases
print int(''''.isdigit())
print int(''''.isalpha())
print int(''''.isalnum())
print int(''''.islower())
print int(''''.isupper())
print int(''''.istitle())

#glob, fnmatch
import glob
print glob.glob(''run.py'')
import fnmatch
print int(fnmatch.fnmatch(''run.py'', ''run.[py]y''))

#staticmethod, property
class woef(object):
    def x(a):
        print a
    def y(self, b):
        print b

    def getz(self):
        return 15+self._x
    def setz(self, x):
        self._x = x

    x = staticmethod(x)
    z = property(getz, setz)

w = woef()
w.y(4321)
woef.x(1234)

woef.k = 1
woef.k

w.z = 14
print w.z

class base:
    def x():
        return 12

    def gety(self):
        return self.value
    def sety(self, val):
        self.value = val

    x = staticmethod(x)
    y = property(gety, sety)
    z = 21

class der(base):
    pass

print der.x()
derder = der()
derder.y = 99
print derder.y
#print der.z # XXX

#unaryadd
class V:
    def __init__(self, x):
        self.x = x
    def __pos__(self):
        return V(self.x+1)
    def __neg__(self):
        return V(self.x-1)
    def __repr__(self):
        return ''V(%d)'' % self.x

v = V(1)
print ++v, +-+-v

#multidir fixes
from testdata import crap
print crap.incrap()
import testdata.bert2 as bert
print bert.hello(1)
from testdata import crap2
crap2.incrap2()
import testdata.crap2
tc2c2 = testdata.crap2.crap2()

#int/double crap
def to_ints(l):
    return [int(x) for x in l]

print to_ints([4.0, 4.0, 61]), to_ints((4.0, 4.0, 61))
print int(min(4.0, 4.0, 2))
print int(max(4.0, 4.0, 6))
print int(min(4.0, 4.0, 4.0, 2))
print int(max(4.0, 4.0, 4, 0, 6))
l = [6]
l.append(1.0)
print to_ints(l)

#assorted fixes
[1] != []

from collections import defaultdict
print sorted(defaultdict.fromkeys(range(7,10), ''a'').items())
import collections
print sorted(collections.defaultdict.fromkeys(range(7,10), ''a'').items())

from string import *
class string: pass
string.x = 4


'
]

{ #category : #resources }
PythonParserTests >> source_test_181 [
	^ '
#time.strptime
import time
print time.strftime("%d %b %Y %H:%M:%S", time.strptime("2001-11-12 18:31:01", "%Y-%m-%d %H:%M:%S"))
print time.strftime("%Y", time.strptime("2001", "%Y"))

#improve default arguments
import testdata.bert2 as bert
print bert.def1()

print bert.def2()
bert.a = 16
print bert.huh()
print bert.def2()

print bert.def3()

def bleh(l=[1,2]):
    return l
print bleh()

bert.def4()

#C++ bool type
def h(x):
    if x in [''False'', ''0'']: return 0
    elif x in [''True'', ''1'']: return 1
    else: return 2

print hex(1==2), hex(1!=2)
print oct(1==2), oct(1!=2)
print abs(1==2), abs(1!=2)
print h(str(1==2)), h(str(1!=2))
print h(repr(1==2)), h(repr(1!=2))
print int(1==2), int(1!=2)
print float(1==2), float(1!=2)
print ord(chr(1==2)), ord(chr(1!=2))

#random.sample/choice
import random
print random.sample(xrange(1), 1)
print random.sample(set([1]), 1)

#fast_for_neg in listcomp_for
print [(i, i) for i in range(29, -1, -1)]

#works, but add as test
def ah():
   pass
def bh(func=ah):
   func()
bh()

# sorted, list.sort: cmp and reverse args
def mut(a,b):
    return -cmp(a,b)

def cmut(a,b):
    return -cmp(a,b)

print sorted([5,1,3,2,4])
print sorted([5,1,3,2,4], reverse=True)
print sorted([5,1,3,2,4], cmp=mut)
print sorted([5,1,3,2,4], cmp=mut, reverse=True)

print sorted(set([5,1,3,2,4]))
print sorted(set([5,1,3,2,4]), reverse=True)
print sorted(set([5,1,3,2,4]), cmp=mut)
print sorted(set([5,1,3,2,4]), cmp=mut, reverse=True)

print sorted(''abcde'')
print sorted(''abcde'', reverse=True)
print sorted(''abcde'', cmp=cmut)
print sorted(''abcde'', cmp=cmut, reverse=True)

l = [1,4,5,2,3]
l.sort(); print l
l.sort(cmp=mut); print l
l.sort(reverse=True); print l
l.sort(cmp=mut, reverse=True); print l

# tempvars/new nodes and inheritance (XXX add more here)
class network:
    def shortestpath(self):
        for node in set([1]):
            print node

        print [node for node in [1]]

class smallworld(network):
    pass

s = smallworld()
s.shortestpath()

# ss-progs regression
class LowLevel:
   def bslTxRx(self, blkout=None):
       pass

class BootStrapLoader(LowLevel):
   def actionRun(self):
       self.bslTxRx()

bsl = BootStrapLoader()
bsl.actionRun()

# test compilation
import socket
import stat

# test all cases
a = 1

print [x for x in range(1,10,1)]
print [x for x in range(10,1,-1)]
print [x for x in range(1,10,+1)]
print [x for x in range(1,10,a)]
print [x for x in range(10,1,-a)]
print [x for x in range(1,10,+a)]
print [x for x in range(1,10,a*1)]
print [x for x in range(1,10,-(-1))]
print [x for x in range(1,10,+(+a))]

for x in range(1,10,1): print x,
print
for x in range(1,10,+1): print x,
print
for x in range(1,10,a): print x,
print
for x in range(1,10,+a): print x,
print
for x in range(1,10,-(-1)): print x,
print
for x in range(1,10,+(+1)): print x,
print
for x in range(1,10,+(+a)): print x,
print
for x in range(10,1,-1): print x,
print
for x in range(10,1,-a): print x,
print


'
]

{ #category : #resources }
PythonParserTests >> source_test_182 [
	^ '
#equality..
hx=[''A'',''B'',''C'',''D'',''E'',''F'']
try:
    print hx.index(''A''.upper())
    print hx.count(''A''+'''')
except Exception, e:
    print e

#datetime
from datetime import date, tzinfo, timedelta, datetime

# enable keyword args
print date(2007,4,3).replace(month=11)

# template problem
class TZ2(tzinfo):
    def utcoffset(self, dt): return timedelta(0,0,0,0,-339)

try:
    dt = datetime(2007,4,3, tzinfo=TZ2())
    print dt
except Exception, e:
    print e

#random.randrange
import random

print random.randrange(1)
print random.randrange(0,1)
print random.randrange(0,1,1)

#staticmethod decorator
class C:
    @staticmethod
    def id(x):
        return x
print C.id(1)

#improve import mechanism
import os.path
print os.getcwd()

from os import path
print path.curdir

from os.path import curdir
print curdir

import os as os2
print os2.path.curdir

#mod improvements
v = ''1 %(aap)s, 1 %(aap)s, %% 2 %(bert)s..''
d = {''aap'': ''aapje'', ''bert'': ''bertjes''}
print v % d

w = ''1 %(aap)s, %% 1 %(aap)d, 2 %(bert)c..''
f = {''aap'': 70, ''bert'': 71}
print w % f

t = (70,70,70)
print ''1 %s %% %d %c..'' % t

t2 = (''x'', 71)
print '' %%%c, en %%%c.. huhu'' % t2

t3 = (70, 71, 72, 73, 74)
print ''%c %d %x %s %r'' % t3

t4 = (70.0, 71.0, 72.0, 73.0, 74.0)
v4 = ''%c %d %x %s %r''
#print v4 % t4 XXX 2.7?

print ''%(aap)s %(bert)d %% %(bert)c'' % {''aap'': ''hallo'', ''bert'': 72}

#re.sub replacement function
import re

def hexrepl(match):
   value = int(match.group())
   return hex(value)

p = re.compile(r''\d+'')
print p.sub(''****'', ''Call 65490 for printing, 49152 for user code.'', 1)
print p.sub(hexrepl, ''Call 65490 for printing, 49152 for user code.'', 1)
print p.sub(hexrepl, ''Call 65490 for printing, 49152 for user code.'')
print re.sub(r''\d+'', ''****'', ''Call 65490 for printing, 49152 for user code.'', 2)
print re.sub(r''\d+'', hexrepl, ''Call 65490 for printing, 49152 for user code.'', 2)

#do not special-case __init__
class Error(Exception):
    def __init__(self, x):
        print ''error.__init__'', x

class ParsingError(Error):
    pass

class MissingSectionHeaderError(ParsingError):
    def __init__(self):
        print ''missingsectionheadererror.__init__''
        Error.__init__(self, ''4'')

Error(''3'')
MissingSectionHeaderError()

#base class not identifier
import testdata.bert as b

class A(b.zeug):
    def hup(self):
        print self.hallo(4)

A().hup()

#property decorator
class huppa:
    @property
    def huppa(self):
        return 28

print huppa().huppa

# inherit from parent first, etc.
class InterpolationError(Exception):
    def __init__(self, option, section):
        print option, section

class InterpolationSyntaxError(InterpolationError):
    pass

InterpolationSyntaxError(''a'', ''b'')

# ignore __getattr__, __setattr__ for ancestor calls
class RawConfigParser:
    KWEK = ''kwek!''

class MyConfigParser(RawConfigParser):
    def read(self):
        self.sections = RawConfigParser.KWEK

configg = MyConfigParser()
configg.read()

# inheritance lookup
class HUP:
    def hup(self, x):
        print ''huppa'', x

class HOP(HUP):
    pass

class HOPPA(HOP):
    def __init__(self):
        HOP.hup(self, 8)
        HOPPA.hup(self, 9)

HOPPA()

#ConfigParser # XXX readfp
import ConfigParser

config = ConfigParser.ConfigParser(defaults={''aha'': ''hah''})

config.read("testdata/test.conf")

print config.getint(''ematter'', ''pages''), config.getfloat(''ematter'', ''pages'')
print int(config.getboolean(''ematter'', ''hop''))

print int(config.has_section(''ematteu''))
config.add_section(''meuk'')
config.set(''meuk'', ''submeuk1'', ''oi'')
config.set(''meuk'', ''submeuk2'', ''bwah'')
if config.has_section(''meuk'') and config.has_option(''meuk'', ''submeuk1''):
    config.remove_option(''meuk'', ''submeuk1'')
config.add_section(''bagger'')
config.remove_section(''bagger'')

# dump entire config file
for section in sorted(config.sections()):
    print section
    for option in sorted(config.options(section)):
        print " ", option, "=", config.get(section, option)

print config.get(''ematter'', ''pages'', vars={''var'': ''blah''})

fl = open(''testdata/test.ini'', ''w'')
config.write(fl)
fl.close()
print sorted(open(''testdata/test.ini'').readlines())

print config.defaults().items()
print sorted(config.items(''ematter'', vars={''var'': ''blah''}))

rcp = ConfigParser.RawConfigParser()
rcp.read(["testdata/test.conf"])

print rcp.get(''ematter'', ''pages'') #, vars={''var'': ''blah''})
print sorted(rcp.items(''ematter''))

# catch str exception
try:
    raise ''2888''
except:
    print ''welja''


'
]

{ #category : #resources }
PythonParserTests >> source_test_183 [
	^ '
# casting
class Foo:
   def __init__(self):
       a = None
       self.v = [1]
       self.v = a
       print self.v

       w = self.v
       w = a
       print w

       x = [1,2,3]
       x[1:2] = []
       x[1:2] = [4,5]
       print x

       self.x = [1,2,3]
       self.x[1:2] = []
       print self.x

f1 = Foo()

# print None
a = [None]
print a
b = None
print b

# ugliness
ss = set([frozenset([1,2,3])])
ss.discard(set([1,2,3]))
print ss

# complex
c = complex(7.1, 4.7)
print c, c.real, c.imag
d = complex(7)
print d, d.real, d.imag
e = c+d
print e, e.real, e.imag
f = 1.2+complex()
print f
g = complex()+1.3
print g
d = 7+1.1j
c += d
c += 8.4
c += 2
c += 9j
print c
print (7+4j)*(9+5j), 3*(7+4j)
c,d = 2+2j, -3+4j
print c.conjugate()
print abs(c)
print 7-c, c-7, c-d
print 2/c, c/2, c/d
print +c, ++c, -d, --d
print 1-1j
print int(1j == 1j), int(1j != 1j)
print hash(12+10j)
print int(bool(0j)), int(bool(1+1j))
print divmod((5+5j), (1+2j))
print (5+5j)//(1+2j), (5+5j)%(1+2j)
print divmod((5+5j), 2)
print (5+5j)//2, (5+5j)%2
#print divmod((5+5j), 2.2)
print (5+5j)//2.2, (5+5j)%2.2
print divmod((5.5+5.5j), 2)
print (5.5+5.5j)//2, (5.5+5.5j)%2
#print divmod((5.5+5.5j), 2.8)
print (5.5+5.5j)//2.8, (5.5+5.5j)%2.8

# complex(str)
import re

def parsevalue(s):
    if not s:
        return 0+0j
    mult = 1+0j
    if s[-1] == ''j'':
        s = s[:-1]
        mult = 0+1j
    if s in [''+'', ''-'']:
        s += ''1''
    return float(s)*mult

def hak(s):
    pat = ''(?P<%s>[+-]?([\d\.]+e[+-]?\d+|[\d\.]*)j?)''
    imag = re.compile(pat % ''one'' + pat % ''two'' + ''?$'')
    m = imag.match(s.strip())
    if m:
        return parsevalue(m.group(''one'')) + parsevalue(m.group(''two''))
    else:
        raise ValueError(''complex() arg is a malformed string'')

print hak('' 2.4+0j'' ), hak(''2.4''), hak('' .4j''), hak(''1-j'')
print hak(''-10-j''), hak(''+10.1+2.4j''), hak(''+j'')
print hak(''2e02''), hak(''2e-02-2e+01j''), hak(''-1.3e-3.1j'')

print complex('' 2.4+0j'' ), complex(''2.4''), complex('' .4j''), complex(''1-j'')
print complex(''-10-j''), complex(''+10.1+2.4j''), complex(''+j'')
#print complex(''2e02''), complex(''2e-02-2e+01j''), complex(''-1.3e-3.1j'') XXX 2.7?

class PI:
    def __float__(self):
        return 3.14
print complex(PI())

# %% woes
print "%%(%s)s" % ''ole''
print ''%%(bert)s %(bert)s'' % {''bert'': 18}
ddd = {''bert'': 19.9}
print ''%%(bert)s %(bert)s'' % ddd

# re.group multiple int/str arguments
imag = re.compile(''(a)(b)'')
m = imag.match(''ab'')
print m.group(), m.group(0), m.group(1), m.group(2)
print m.group(0, 2), m.group(2, 1, 1, 2)
imag = re.compile(''(?P<one>a)(?P<two>b)'')
m = imag.match(''ab'')
print m.group(), m.group(''one''), m.group(''two'')
print m.group(''two'', ''one'')
wap = m.group(''one'')
print wap
hop = m.group(''one'', ''two'', ''one'')
print hop

# join empty list
el = [''hap''][7:8]
print '' ''.join(el)

# this works now
#def p(msg):
#    print msg
#p(15)
#p("hello")

# hash(None)
dwek = {(''a'', ''b'', None): 18}
print dwek[(''a'', ''b'', None)]

# merge_simple_types
lrp = []
print [lrp.append(0)]

# inheritance from Exception descendant
class X(RuntimeError):
    def __init__(self, msg=None):
        RuntimeError.__init__(self, msg)
        print ''ole'', msg
X()


'
]

{ #category : #resources }
PythonParserTests >> source_test_184 [
	^ '
# locally override module name
import testdata.bert as game

class Game:
    def __init__(self):
        self.x = ''xxx''

def hup(game):
    game.__init__()
    print game.x
    if game:
        print ''game''

hup(Game())

# class attribute access across module
from testdata import bert

bert.zeug.purple += 1
blah = bert.zeug.purple
print blah

# template conflict
def opterr(x):
    pass

opterr(1)
#opterr(''1'')

# disappearing type
def ParseAction(action):
    return ('''',)

def ParseRuleLine(line):
    tmp=line.split()
    for y in tmp[-1].split():
        ParseAction(y)

for x in ''''.split():
    ParseRuleLine(x)

# working outside of list
a = range(5)
a[7:80] = range(5)
print a
a[10:15] = range(10)
print a
a[12:20] = range(10)
print a
a=range(5)
a[-8:-5] = [9,9]
a[1:1] = [8,8]
del a[-7:2]
print a
a=range(5)
a[4:1] = [7,12]
print a

lll = [1,2]
del lll[18:]
print lll

# split nothing
print ''''.split()
print ''  ''.split()

# casting problem
def hoppa():
    return [''beh'']
    return []
    return None

hop = hoppa()

# comment problem
def hoezee():
    ''''''kijk een /* C++ comment */''''''
hoezee()

# list comp scoping
def knuts(j, var):
    print ''knuts!'', j, var
    return [7]

itjes = [1]
globaltje = ''global''

def ahoi():
    localtje = ''localtje''
    twitjes = [2]
    print [1 for i in 3*twitjes for b2 in knuts(i, globaltje)]
    print [2 for i in 4*itjes if knuts(2*i, localtje)]

ahoi()

# overloading problem
file = open(''run.py'')
print file.read(10)
file.close()

# xrange reset
xrr = xrange(2)
print xrr, list(xrr), list(reversed(xrr))
for xr in xrr:
    for yr in xrr:
        print xr, yr

# tutorial example should work at least..
#class matrix:
#    def __init__(self, hop):
#        self.unit = hop
#
#m1 = matrix([1])
#m2 = matrix([1.0])


'
]

{ #category : #resources }
PythonParserTests >> source_test_185 [
	^ '
# file.next
print file(''run.py'').next().strip()

# re.groups returns tuple
import re
m = re.match(r"(\d+)\.?(\d+)?", "24")
groups = m.groups()
print groups

# overloading __getitem__ problem
class Vector3f:
    def __getitem__(self, key):
        return 19
v = Vector3f()
print v[0]

# more string formatting
print ''!''+(''%06d%6r%6.2f'' % (18,''hoi'', 1.17))+''!''
print ''!''+(''%0*d%*s%*.*f'' % (6,18,6,''hoi'',8,2,1.171))+''!''

# and/or funtest (already worked)
hoppa = (17, 18)
a, b = hoppa or (19,20)
print a, b

hoppa = None
a, b = hoppa or (19,20)
print a, b

x = [1,2]
y = [3,4,5]
c = x and y or None
print c

y = None
z = None
c = x and y or z
print c

# TI problem (seeding bool)
def rungame(strategy, verbose):
    strategy()

def s_bestinfo():
    z = [0]
    print z

def s_worstinfo():
    z = [0]
    print z

def eval_strategy(strategy):
    rungame(strategy, False)

def main():
    eval_strategy(s_bestinfo)
    eval_strategy(s_worstinfo)

main()

# test
import signal


'
]

{ #category : #resources }
PythonParserTests >> source_test_186 [
	^ '
# print space or not
print ''aha	'',
print ''hum''

# minus in front
print hex(200), hex(-200)

# import as
from sys import maxint as MAXINT
from sys import maxsize as MAXSIZE
import random
from random import random as randum
from string import *
random.seed(1)
a = MAXINT
bb = MAXSIZE
#print a
print randum()

print a == bb

#default argument problem
import getopt
flats = getopt.getopt([''a''],''a'')
print flats

#more casting problems..
def hop():
    yield ()
    yield (1,2)
h = hop()
print list(h)
print list(h)
def hap():
    return ()
    return (1,2)
print hap()

#FOR_IN_T2 for listcomp
#class animal:
#    def sound(self):
#        print ''oink''
#class dog(animal): pass
#class cat(animal): pass
#print [a.sound() for a in dog(), cat()]

#tests used for optimizing enumerate/zip
l = [(7,8),(9,10)]
class D: pass
y = D()
for a, b in enumerate(l):
    print a,b
for a, y.b in enumerate(l):
    print a,y.b
class C: pass
x = C()
for x.a, (c,d) in enumerate(l):
    print x.a,c,d
for t in enumerate(l):
    print t
print [(a, b) for a, b in enumerate(l)]
print [(a, y.b) for a, y.b in enumerate(l)]
print [(x.a, (c,d)) for x.a, (c,d) in enumerate(l)]
print [t for t in enumerate(l)]

l2 = [(7,8), (9,10)]
for a2, b2 in zip(l2, l2[::-1]+l2):
    print a2, b2
for t2 in zip(l2, l2):
    print t2
class C2: pass
c2 = C2()
for c2.x, (d2,e2) in zip(2*l2, l2):
    print c2.x, d2, e2
for (d2,e2), c2.x in zip(2*l2, l2):
    print d2, e2, c2.x
for (d2,e2), (f2,g2) in zip(l2, l2):
    print d2, e2, f2, g2
print zip(''hoi'',''hap''), zip(''ah'', ''bh'', ''ch'')
for u2,v2 in zip(''hoi'',''hap''):
    print u2+v2
print zip(''ahoi'', range(5))
print [((d2, e2), c2.x) for (d2,e2), c2.x in zip(2*l2, l2)]

#pyseq:str special cases
print ''a''.join(''hap'')
fi = file(''testdata/humba'', ''w'')
fi.writelines(''hoei'')
fi.close()
print file(''testdata/humba'').read()
print tuple(''hap'')
up = [''a'']
up.extend(''hoi'')
print up
up += ''wap''
print up
print min(''gehakt''), max(''gehakt'')
print list(reversed(''gehakt''))

#variable naming
#def sentences():
#    next = 12
#    yield next
#print list(sentences())

#defdict problem
import collections
hoppa = collections.defaultdict(int)
hoppa[4] = 5
for xxx in hoppa:
    print xxx, hoppa[xxx]

#backticks, scalar
ahh = 19
hoi = ''hoi''
print `18`, `ahh+1`, `hoi`

#bisect should model __cmp__, fix sorting problem
from bisect import insort
class A(object):
    def __init__(self, x, y):
        self.x = x
        self.y = y
    def __repr__(self):
        return "A(%s, %s)" % (self.x, self.y)
    def __cmp__(self, other):
        return cmp(self.x + self.y, other.x + other.y)

pairs = [[18, 6], [28, 5], [35, 26], [31, 28], [3, 3], [32, 37], [11, 17], [28, 29]]
items = []
for pair in pairs:
    insort(items, A(pair[0], pair[1]))
print items

#sum ints with double
items2 = range(5)
ork = sum(items2, 0.3)
print ork


'
]

{ #category : #resources }
PythonParserTests >> source_test_187 [
	^ '
# __ss_result
print [result for result in range(4)]

# void *constant caused by unused function
def parse150():
    a = ''150''
def ftpcp():
    ''ah'' in (''150'',)
parse150()

# forward func refs
class FTP:
    def retrbinary(self, callback):
        callback(''hoi'')
    def retrlines(self):
        callback = print_line
        callback(''hoi2'')
def print_line(line):
    print line
ftp = FTP()
ftp.retrbinary(print_line)
ftp.retrlines()

# re.subn, re.re_object.subn (douglas mcneil)
import re
res = re.subn(''a'', ''ama'', ''amadeus'')
print res
res = re.compile(''a'').subn(''ama'', ''amadeus'')
print res

# str.replace corner cases (douglas mcneil)
print ''faaaaaredfredbrrr''.replace(''r'', ''rr'')
print ''aha''.replace('''',''men'')

# strip whitespace
print int('' \t\n0x18 \t '', 16)

# check add_strs optimization
print ''hoi''
print ''hoi'' + ''mams''
print ''hoi'' + ''mams'' + ''ik''
print ''hoi'' + ''mams'' + ''ik'' + ''ben''
print ''hoi'' + ''mams'' + ''ik'' + ''ben'' + ''er''
print ''hoi'' + ''mams'' + ''ik'' + ''ben'' + ''er'' + ''weer''
print ''h''
print ''h'' + ''m''
print ''h'' + ''m'' + ''i''
print ''h'' + ''m'' + ''i'' + ''b''
print ''h'' + ''m'' + ''i'' + ''b'' + ''e''
print ''h'' + ''m'' + ''i'' + ''b'' + ''e'' + ''w''

# optimize addition of 1-length lists
print [1]+[2,3,4], [1,2,3]+[4]

# known problem (issue 8)
def quicksort(L):
        x = y = 0
        if L == []: return []
        pivot = L[0]
        return quicksort([x for x in L[1:] if x < pivot]) + [pivot] +                 quicksort([y for y in L[1:] if y >= pivot])

data = [1, 200, 50, 485, 22, 22, 3534, 22112]
print "quickdata: %s " % quicksort(data)

# test list.__setslice__ optimization
a = [1, 2, 3]
a[-2:] = (1, 7, 9, 10)
print a
a[-2:] = set((10,))
print a

# map, filter, reduce
def hoppa(x, y, z): return str(x+y+z)
def uhppa(a, b): return a+int(b)
amap = map(hoppa, [1,2,3], [3,4,5], [5,6,7])
print amap
bmap = map(uhppa, [1,2,3], [''3'',''4'',''5''])
print bmap
def hoppa2(a, b):
    if b: return a+b
    return a+''X''
print map(hoppa2, ''banaan'', ''aap'')
def hoppa3(a, b):
    if b: return a+b
    return a
print map(hoppa3, range(8), range(4))
print sorted(map(lambda u: len(u), [''aaaaa'', ''aaa'', ''a'']))

print reduce(lambda a,b: a+b, [3,5,7])
print reduce(lambda a,b: a-b, set([3,5,7]), 1)

print filter(lambda a: 2<=a<5, range(10))
print filter(lambda c: c>''a'', ''abaaac'')
print filter(lambda c: c>''a'', tuple(''abaaac''))
print filter(None, range(3)), filter(None, ''abc''), filter(None, tuple(range(3)))

options = filter(lambda option: option != ''fake'', [''duh''])
print options

# next
it1 = iter(range(4))
for i in range(10):
    print next(it1, -1)
it2 = iter(''abcd'')
try:
    for i in range(10):
        print next(it2)
except StopIteration:
    print ''stop''
it3 = iter(''aha'')
for i in range(10):
    print next(it3, None)

# sort(ed) key argument
a = range(4)
print sorted(a)
print sorted(a, cmp=lambda a,b:cmp(a,b))
print sorted(a, cmp=lambda a,b:cmp(b,a))
print sorted(a, key=lambda a:a)
print sorted(a, key=lambda a:-a)
print sorted(a, cmp=lambda a,b:cmp(a,b), key=lambda a:-a)

l = range(4)
print l
l.sort(cmp=lambda a,b:cmp(a,b))
print l
l.sort(cmp=lambda a,b:cmp(b,a))
print l
l.sort(key=lambda a:a)
print l
l.sort(key=lambda a:-a)
print l
l.sort(cmp=lambda a,b:cmp(a,b), key=lambda a:-a)
print l

print sorted(''dcba'', key=lambda c: c)

# missing cast
class hop:
    def __init__(self, a):
        print ''oh'', a

class hop2(hop):
    def __init__(self):
        bla = None
        hop.__init__(self, bla)

class hop3(hop):
    def __init__(self):
        hop.__init__(self, ''hoi'')

hop2()
hop3()

# improve local variable overloading
def bleh(a, b):
    return 1
def snrted(it, bleh):
    bleh(1, 1)
snrted(range(4), lambda a,b: a+b)

# forward var refs
def hoep():
    for x in range(10):
        if x == 8:
            print happa
        elif x == 9:
            print hoepa
        else:
            happa = x
            hoepa, banaan = x, 2
    [n for n in range(4)]

class wa:
    def wh(self):
        if False:
            y = 3
        y = 2
        print y

        if False:
            u.strip()
        u = ''hoi''

        if False:
            z += 1
        z = 2
        print z

hoep()
wa().wh()

# passing builtins around
print sorted([[2,3,4], [5,6], [7]], key=len)
print map(len, [''a'',''bc''])
print map(max, [''a'',''bc''], [''d''], [''e''])
print map(max, [''a''], [''d''], [''e''])
print map(str, range(12))
print map(list, ''abc'')
print map(int, [''18'', ''19''])
print map(set, [[1]])
def two(f, a, b):
    return f(a, b)
def three(f, a, b, c):
    return f(a, b, c)
print two(max, ''a'', ''b'')
print three(max, ''a'', ''b'', ''c'')

# __cmp and None
lamp = [''a'', ''b'', None]
lamp.sort()
print lamp

# bool and func pointers, misc fixes
def wopper(x):
    print ''wopper'', x
wopper(''wopper'')

DEBUG = wopper
DEBUG = None

if DEBUG:
    DEBUG(''wopper'')
if not DEBUG:
    print ''no debug''
if not 18:
    DEBUG(''wopper'')

print ''debug'' if () else ''no debug''

print int(bool(DEBUG))
print int(bool(1))

# with statement
with file(''testdata/lop'', ''w'') as fp:
    fp.write(''neh'')
with file(''testdata/lop'') as ap:
    print repr(ap.read())
f = file(''testdata/lop'')
with f:
    print f.read()


'
]

{ #category : #resources }
PythonParserTests >> source_test_188 [
	^ '
import csv, collections
d = collections.defaultdict(list)
for (a,b,n,l) in csv.reader(open(''testdata/woef.csv''), delimiter=''|''):
    d[a,b].append((int(n),l))
for a,b in sorted(d, key=lambda t: t[1]):
    hoppa = '' ''.join([l for (n,l) in sorted(d[a,b], key=lambda t: t[0])])
    hoppa = hoppa.replace(''&nbsp;'', '' '')
    print ''<H1>%s</H1><H2>%s</H2>'' % (b,a), hoppa
output = open(''testdata/bla.csv'', ''w'')
wr = csv.writer(output, delimiter=''|'')
wr.writerow([''aa'', ''bb'', ''cc''])
wr.writerows(2*[[''a'', ''c'', ''b'']])
output.close()
print open(''testdata/bla.csv'').read()

print csv.field_size_limit()
print csv.field_size_limit(1000)
print csv.field_size_limit()

print sorted(csv.list_dialects())

csv.reader(open(''testdata/woef.csv''), dialect = ''excel'', delimiter = '','', quotechar = ''"'', lineterminator = ''\r\n'', escapechar = '''')
csv.writer(file(''testdata/bla.csv'', ''w''), dialect = ''excel'', delimiter = '','', quotechar = ''"'', lineterminator = ''\r\n'', escapechar = '''')

bla = file(''testdata/bla.csv'', ''w'')
fieldnames = [''hop'', ''hap'', ''ole'', ''aap'']
wr2 = csv.DictWriter(bla, fieldnames, restval=''ah'', quoting=csv.QUOTE_ALL)
rd = csv.DictReader(open(''testdata/woef.csv''), fieldnames, restval=''uh'', restkey=''oh'', delimiter=''|'')
for d2 in rd:
    print sorted(d2.values())
    wr2.writerow(d2)
    wr2.writerows([d2])
bla.close()
rd.fieldnames = fieldnames
print rd.fieldnames
print open(''testdata/bla.csv'').read()

csv.DictReader(open(''testdata/woef.csv''), None, dialect = ''excel'', delimiter = '','', quotechar = ''"'', lineterminator = '''', escapechar = '''')
csv.DictWriter(open(''testdata/woef.csv''), None, dialect = ''excel'', delimiter = '','', quotechar = ''"'', lineterminator = '''', escapechar = '''')


'
]

{ #category : #resources }
PythonParserTests >> source_test_189 [
	^ '
import heapq

heap = [21]
print heap

heapq.heappush(heap, 42)
print heap

heapq.heappush(heap, 12)
print heap

print heapq.heappop(heap)
print heap
print heapq.heappushpop(heap, 63)
print heap
print heapq.heappop(heap)
print heap
print heapq.heappop(heap)
print heap

heapq.heappush(heap, 12)
print heap

heapq.heappush(heap, 52)
print heap

heapq.heappush(heap, 112)
print heap

heapq.heappush(heap, 1)
print heap

heapq.heappush(heap, 12)
print heap

print heapq.heappop(heap)
print heap
print heapq.heappushpop(heap, 63)
print heap
print heapq.heappop(heap)
print heap
print heapq.heappop(heap)
print heap

print ''--------------''

l = [42, 45, 35, 3]
print l

heapq.heapify(l)
print l

print heapq.heapreplace(l, 36)
print l

print heapq.heappop(l)
print l
print heapq.heappop(l)
print l
print heapq.heappop(l)
print l
print heapq.heappop(l)
print l

print ''--------------''


for i in heapq.merge():
   print i

print list(heapq.merge())

print ''-''

for j in heapq.merge([3, 7, 18]):
    print j

print ''-''

for k in heapq.merge([3, 7, 18], [5, 21, 44]):
    print k

print ''-''

for m in heapq.merge([3, 7, 18], [5, 21, 44], [2, 33]):
    print m

print ''------''

for n in heapq.nlargest(5, [3, 15, 56, 38, 49, 12, 41]):
    print n
print ''-''
for np in heapq.nlargest(5, [3, 15]):
    print np

print ''---''

for o in heapq.nsmallest(5, [3, 15, 56, 38, 49, 12, 41]):
    print o
print ''-''
for op in heapq.nsmallest(5, [3, 15]):
    print op



'
]

{ #category : #resources }
PythonParserTests >> source_test_19 [
	^ '
#class list:                              # unit: [float]*
#    def append(self, x):                 # x: [float], self: [list_float]
#        self.unit = x                    # [float]
#
#    def __getitem__(self, i):            # i: [int], a: [float], self: [list_float]
#        a = self.unit                    # [float]
#        return a                         # [float]

cube = []                                # [list_float]
cube.append(1.0)                         # []

y = cube[0]                                  # [float]

'
]

{ #category : #resources }
PythonParserTests >> source_test_190 [
	^ '
import itertools

print ''### Count ###''

#for a in itertools.count(4, 3):
#   if a > 16:
#       break
#   print a

for ca in itertools.count(3):
   if ca > 16:
       break
   print ca

#for cb in itertools.count(4, -3):
#   if cb < -16:
#       break
#   print cb

print ''### Cycle ###''

ctt = 0
for b in itertools.cycle([1, 2, 3]):
   ctt += 1
   if ctt > 10:
       break
   print b

print ''-''

woo = itertools.cycle(set([1, 2, 3]))
print woo.next()
print woo.next()
print woo.next()

print ''### Repeat ###''

ctt2 = 0
for c in itertools.repeat(42):
   ctt2 += 1
   if ctt2 > 5:
       break
   print c

for c in itertools.repeat(42, 3):
   print c

print ''### Chain ###''

for al in itertools.chain([1, 2]):
    print al
print ''-''
for am in itertools.chain([1, 2], [3, 4]):
    print am
print ''-''
for an in itertools.chain([1, 2], [3, 4], [5, 6]):
    print an
print ''-''
for ao in itertools.chain([1, 2], [3, 4], [5, 6], [7, 8]):
    print ao
print ''-''
for ap in itertools.chain([1, 2], [3, 4], [5, 6], [7, 8], [9, 10]):
    print ap
print ''-''
for aq in itertools.chain([1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12, 13]):
    print aq

print ''### Compress ###''

#for d in itertools.compress([42, 32, 21, 55, 303], [True, False, True, False, True]):
#   print c

print ''### Dropwhile ###''

pred = lambda x: x < 5

for e in itertools.dropwhile(pred, [1, 4, 6, 4, 1]):
   print e

print ''### Groupby ###''

def key(x):
   if x > 5:
      return 1
   else:
      return 0

for k, g in itertools.groupby([1, 4, 6, 4, 1], key):
   for f in g:
       print f,
   print '':'', k

print ''### Ifilter ###''

pred1 = lambda x: x % 2

for h in itertools.ifilter(pred1, range(10)):
   print h
for i in itertools.ifilter(None, range(10)):
   print i

print ''### Ifilterfalse ###''

pred1 = lambda x: x % 2

for j in itertools.ifilterfalse(pred1, range(10)):
  print j
for j in itertools.ifilterfalse(None, range(10)):
  print j

print ''### Islice ###''

print ''--1''
for l in itertools.islice(''ABCDEFG'', 2):
    print l
print ''--2''
for m in itertools.islice(''ABCDEFG'', 2, None):
    print m
print ''--3''
for n in itertools.islice(''ABCDEFG'', 2, 4, 1):
    print n
print ''--4''
for o in itertools.islice(''ABCDEFG'', 2, 4, 2):
    print o
print ''--5''
for p in itertools.islice(''ABCDEFG'', 2, 4):
    print p
print ''--6''
for r in itertools.islice(''ABCDEFG'', 0, 4, 2):
    print r
print ''--7''
for s in itertools.islice(''ABCDEFG'', None, 4, 2):
    print s
print ''--8''
for t in itertools.islice(''ABCDEFG'', None, 4):
    print t
print ''--9''
for u in itertools.islice(''ABCDEFG'', 2, None, 2):
    print u
print ''--10''
for v in itertools.islice(''ABCDEFG'', None):
    print v
print ''--11''
for w in itertools.islice(''ABCDEFG'', None, None, 2):
    print w
print ''--12''
for y in itertools.islice(''ABCDEFG'', None, None):
    print y
print ''--13''
for z in itertools.islice(''ABCDEFG'', 2, None, None):
    print z
print ''--14''
for aa in itertools.islice(''ABCDEFG'', None, None, None):
    print aa
print ''--15''
for ab in itertools.islice(''ABCDEFG'', 2, 0):
    print ab
print ''--16''
for ac in itertools.islice(''ABCDEFG'', 2, 0, 2):
    print ac
print ''--17''
for ad in itertools.islice(''ABCDEFG'', 0, 0, 2):
    print ad

print ''### Imap ###''

def foo(a):
   return ''{%i}'' % a
def foo2(a, b):
   return ''{%i//%f}'' % (a, b)
def foo3(a, b, c):
   return ''{%i//%f//%s}'' % (a, b, c)
def foo4(a, b, c, d):
   return ''{%i//%f//%s//%i}'' % (a, b, c, d)
def foo5(a, b, c, d, e):
   return ''{%i//%f//%s//%i//%s}'' % (a, b, c, d, str(e))

for iia in itertools.imap(foo, (21, 12, 42)):
   print iia
print ''-''
for iib in itertools.imap(foo2, (21, 12, 42), (.21, .12)):
   print iib
print ''-''
for iic in itertools.imap(foo3, (21, 12, 42), (.21, .12), (''a'', ''b'', ''c'')):
   print iic
print ''-''
for iid in itertools.imap(foo4, (21, 12, 42), (.21, .12), (''a'', ''b'', ''c''), (42, 12, 14, 6)):
   print iid
print ''-''
for iie in itertools.imap(foo5, (21, 12, 42), (.21, .12), (''a'', ''b'', ''c''), (42, 12, 14, 6), ([5, 4], [8, 9])):
   print iie

print ''### Starmap ###''

# TODO

print ''### Tee ###''

def gen():
   for ae in [1, 2, 3, 4, 5]:
       yield ae
it1, it2 = itertools.tee(gen())
for af in it1:
   print af
for ag in it2:
   print ag
it3, it4, it5 = itertools.tee(gen(), 3)
for ah in it3:
   print ah
for ai in it4:
   print ai
for aj in it5:
   print aj

print ''### Takewhile ###''

pred2 = lambda x: x < 5

for ak in itertools.takewhile(pred2, [1,4,6,4,1]):
   print ak

print ''### Izip ###''

for ar in itertools.izip():
    print ar
print ''-''
for at in itertools.izip([1, 3, 4]):
    print at
print ''-''
for au in itertools.izip([1, 3, 4], [42, 21], [12, 21, 33, 55]):
    print au
print ''-''
for au2 in itertools.izip([1, 3, 4], [''a'', ''b'']):
   print au2

print ''### Izip_longest ###''

for av1 in itertools.izip_longest():
   print av1
print ''-''
for av in itertools.izip_longest(fillvalue = 42):
   print av
print ''-''
for aw1 in itertools.izip_longest([''a'', ''b'', ''c'']):
   print aw1
print ''-''
for aw2 in itertools.izip_longest([1, 3, 4], fillvalue = 42):
    print aw2
print ''-''
for ax in itertools.izip_longest([1, 3, 4], [42, 21], [12, 21, 33, 55], fillvalue = 42):
    print ax
print ''-''
for aw3 in itertools.izip_longest([[1, 2], [3, 4], [5, 6]], [''a'', ''b'']):
    print aw3

print ''### Product ###''

for ay in itertools.product():
    print ay
print ''-''
for az in itertools.product(''A''):
    print az
print ''-''
for ba in itertools.product(''AB''):
    print ba
print ''-''
for bb in itertools.product(''A'', ''''):
    print bb
print ''-''
for bc in itertools.product(''A'', ''B''):
    print bc
print ''-''
for bd in itertools.product(''AB'', repeat = 2):
    print bd
print ''-''
for be in itertools.product(''A'', ''B'', repeat = 2):
    print be
print ''-''
for bf in itertools.product(''AB'', ''CD''):
    print bf
print ''-''
for bg in itertools.product(''AB'', ''CD'', repeat = 2):
    print bg
print ''-''
for bhy in itertools.product([.4, .42], [1, 2, 3]):
    print ''%.2f %d'' % bhy
print ''-''
for bhz in itertools.product(''AB'', [1, 2, 3]):
    print bhz

print ''### Permutations ###''

for bh in itertools.permutations(''ABDC''):
    print bh
print ''-''
for bi in itertools.permutations(''ABDC'', 0):
    print bi
print ''-''
for bj in itertools.permutations(''ABDC'', 1):
    print bj
print ''-''
for bk in itertools.permutations(''ABDC'', 2):
    print bk
print ''-''
for bl in itertools.permutations(''ABDC'', 3):
    print bl
print ''-''
for bm in itertools.permutations(''ABDC'', 5):
    print bm

print ''### Combinations ###''

for bn in itertools.combinations(''ABDC'', 0):
    print bn
print ''-''
for bo in itertools.combinations(''ABDC'', 1):
    print bo
print ''-''
for bp in itertools.combinations(''ABDC'', 2):
    print bp
print ''-''
for bq in itertools.combinations(''ABDC'', 3):
    print bq
print ''-''
for br in itertools.combinations(''ABDC'', 5):
    print br

print ''### Combinations_with_replacement ###''

#for bs in itertools.combinations_with_replacement(''ABDC'', 0):
#    print bs
#print ''-''
#for bt in itertools.combinations_with_replacement(''ABDC'', 1):
#    print bt
#print ''-''
#for bu in itertools.combinations_with_replacement(''ABDC'', 2):
#    print bu
#print ''-''
#for bv in itertools.combinations_with_replacement(''ABDC'', 3):
#    print bv
#print ''-''
#for bw in itertools.combinations_with_replacement(''ABDC'', 5):
#    print bw

'
]

{ #category : #resources }
PythonParserTests >> source_test_191 [
	^ '
# defaultdict fixes
from collections import defaultdict
dnone = defaultdict()
#dnone = defaultdict(None)
dnone = defaultdict(None, [(8, 9)])
dnone = defaultdict(None, dnone)
dnone[4] = 5
try:
    print dnone[5]
except KeyError:
    print ''keyerror''
print sorted(dnone.items())

print sorted(defaultdict(str, {1: ''hoi''}).items())

# self variable (TODO: fix analyze_virtuals)
self = 4
print self

# bin, oct, hex
print hex(200), hex(-200), hex(0)
print oct(200), oct(-200), oct(0)
print bin(200), bin(-200), bin(0)

class A(object):
    def __index__(self):
        return 42
a = A()
print bin(a)

print bin(1==2), bin(1!=2)

# game of life
argv=[0,3,3]
r,c=map(int,argv[1:])
p,g=r*c,range
z=g(p)
w=lambda x:sum((abs(x%r-v%r)<2)&(abs(x/r-v/r)<2)&d[v]for v in z)
for m in g(2**p):
 d=[m>>x&1 for x in z]
 if all(d[x]&(2<w(x)<5)|~d[x]&(w(x)!=3)for x in z):
  for x in g(c+1):print''''.join(''.X''[y]for y in d[r*x:r*x+r])

# unpacking and __getitem__ special cases
seq = [1,2,3]
seq = (1,2,3)
s1,s2,s3 = seq
print s1,s2,s3
seq3 = [4,5]
seq3 = None
seq3 = (4,5)
s1,s2 = seq3
print s1,s2,s3

# min/max and ''key'' arg
blah = [1, 2, 3]
omkeer = lambda x: -x
print min(blah), max(blah)
print min(blah, key=omkeer), max(blah, key=omkeer)
print min(1,2), max(1,2)
print min(1,2, key=omkeer), max(1,2, key=omkeer)
print min(1,2,3), max(1,2,3)
print min(1,2,3, key=omkeer), max(1,2,3, key=omkeer)
print min(1,2,3, key=int), max(1,2,3, key=str)

# zip()
zip0 = zip()
print zip0

# math.factorial
import math
for hm in range(13):
    print math.factorial(hm),
print

# map 3 iterables of different types
def foo3(a, b, c):
    return ''%d %.2f %s'' % (a, b, c)
def flats():
    for x in range(3):
        yield chr(ord(''A'')+x)
print map(foo3, xrange(3), map(float, range(1, 4)), flats())

# open(''U'')
# MAC
with open(''cr.txt'', ''w'') as f1:
    f1.write(''hello world\r'')
    f1.write(''bye\r'')
with open(''cr.txt'', ''r'') as f1:
    for line in f1:
        print line,
print ''---''
with open(''cr.txt'', ''rU'') as f1:
    for line in f1:
        print line,
print ''===''

# UNIX
with open(''lf.txt'', ''w'') as f1:
    f1.write(''hello world\n'')
    f1.write(''bye\n'')
with open(''lf.txt'', ''r'') as f1:
    for line in f1:
        print line,
print ''---''
with open(''lf.txt'', ''rU'') as f1:
    for line in f1:
        print line,
print ''===''

##  DOS
with open(''crlf.txt'', ''w'') as f1:
    f1.write(''hello world\r\n'')
    f1.write(''bye\r\n'')
    f1.write(''foo\r'')
    f1.write(''bar\n'')
    f1.write(''baz\r\n'')
    f1.write(''qux'')
with open(''crlf.txt'', ''r'') as f1:
    for line in f1:
        print ''%r'' % line,
print ''---''
with open(''crlf.txt'', ''rU'') as f1:
    for line in f1:
        print ''%r'' % line,
print ''===''

# dict(iter({str,pyseq}))
print sorted(dict([''ab'', ''cd'']).items())
print sorted(dict(set([(1,2.0), (3,4.0)])).items())
print sorted(dict([[1,2], (3,4)]).items())

# first-class booleans
bool_a = True
print bool_a
bool_a = not bool_a

bool_b = [bool_a, bool_a, True]
print bool_b

bool_c = bool_a + bool_a
print bool_c

bool_e = 7 > 8
print bool_e

if bool_e:
    print ''e''
if not bool_e:
    print ''!e''

queue = []
augmented = 0
if queue and not augmented:
    print ''queue''

a_bool = bool(''hoppa'')
print a_bool

print True & False, True & True, True & 1, 1 & False
print True-2, False*3, 2+True, 2-False, 4*True

print True*[1,2]

har3 = True & True & 1
print har3

niks = None
print bool(niks), bool(None)

# generator expressions
ia = (2*x for x in range(10))
print sum(ia)
ib = ((str(x+y) for x in range(10)) for y in range(4))
print [''''.join(ur) for ur in ib]
ic = [(x+3 for x in range(10)) for y in range(4)]
print [sum(ar) for ar in ic]
id = ([2.0*(x+y) for x in range(10)] for y in range(4))
print sum(sum(uhh) for uhh in id)
ie = ([x,y] for x in range(10) for y in range(4))
print len(list(ie))

class meuk:
    def layout(self):
        return (x for x in ''abc'')

waf = meuk().layout()
print list(waf)

# random module improvements
import random
random.seed(1)
print random.triangular()
print random.triangular(high=1.1, low=0.0)
print random.triangular(0.1)
print random.triangular(-2, 2)
print random.triangular(-2.0, 2.1, 1.5)
print random.triangular(mode=1.5)
print random.triangular(0, 5, 0)
random.seed()
random.seed(''seed'')
random.seed(8.0)
random.seed(None)
random.seed(4)
print random.random()

# itertools.product fix
import itertools
print list(itertools.product([0,1,2], [0,1,2]))
print list(itertools.product([-1, 0, 1], repeat=2))
print list(itertools.product(iter([1, 2, 3]), iter([4, 5]), repeat = 2))
print list(itertools.product(iter([1, 2, 3]), iter([4, 5]), iter([6, 7, 8]), repeat = 2))

# hashing
print hash(-1)
print hash(True)
print hash(12.345)

#and,or mixing
1 or ''hoppa'' or [1,2]
plb = 1 or 9
plc = not (1 or 9)
not (1 or ''hopsa'')
pld = 1 and 9
ple = not (1 and 9)
if 1 or ''hoei'':
    print ''ba''
while 1 or ''hoei'':
    print ''uhoh''
    break
while (1 or (''blah'' and 1)):
    break
print [plx for plx in range(4) if plx and ''hoei'']
print [plx for plx in range(4) if plx and 1]
if not (1 and ''hoei''):
    print ''oh''

# copy, deepcopy and None
import copy

class TreeNode:
    def __init__(self):
        self.hoppa = [1]
        self.hoppa = None

tn = TreeNode()
tn2 = copy.deepcopy(tn)
blar = tn2.hoppa
blar2 = copy.copy(blar)

# SystemExit
import sys
try:
    exit(4)
except SystemExit, baratie:
    print ''jaja deze ook''
try:
    sys.exit(4)
    sys.exit(''hoppa'')
    raise SystemExit()
except SystemExit, baratie:
    print ''exit with'', baratie.code, baratie
    if False: # difference when run from this file
        sys.exit(''aha'')
        sys.exit(baratie.code)

# comparison model
class Bla:
    def __eq__(self, o):
        print o.niks
bla1 = Bla()
bla1 is None

# crash
print None in [[None]]

# casting to builtins (inference not enough)
definiteinnerlist=[1]
outerlist=[[1]]
#emptyinnerlist=[]
outerlist.append(definiteinnerlist)
outerlist.append([])
outerlist[0] = []
print outerlist

dikkie={1:1}
dikkie2 = {1:dikkie}
dikkie2[2] = {}
dikkie2[3] = dikkie
print sorted(dikkie2.items())

# more test cases
print reduce(lambda a,b: a+b, ''34'')
print reduce(lambda a,b: a+b, ''345'', ''6'')
print reduce(lambda a,b: a+b, [3,5,7], 2)
print reduce(lambda a,b: a-b, set([3,5,7]))

print any([1,2]), all([0,1]), any([]), all([])
print any(set([1,2])), all(set([0,1])), all({})
print any(''  ''), any(''''), all(''   ''), all('''')

print []==[[]]
print []==None
print None==[[]]
print None==[1]
print [None] == [[1]]
print [[1]] == []
print [[]] == [[1]]
'
]

{ #category : #resources }
PythonParserTests >> source_test_192 [
	^ '
from __future__ import print_function

# unbound ident
import testdata.subsub
print(list(testdata.subsub.blah(4)))

# exception hierarchy
try:
    try:
        raise SystemExit(''hoei'')
    except Exception, msg:
        print(''foute boel'')
except BaseException as ork:
    print(''base exc'', ork)

# map external func
import math
som=sum(map(math.factorial, [1,2,3]))
print(som)
from testdata.subsub import fact
som=sum(map(fact, [1,2,3]))
print(som)
mf = math.factorial
print(map(mf, range(10)))
import testdata.subsub
som=sum(map(testdata.subsub.fact, [1,2,3]))
print(som)
tsf = testdata.subsub.fact
print(tsf(10))

# set problems
collector = set()
collector.add(frozenset([1,2]))
collector.add(frozenset([1,2,3]))
print(sorted(collector))

low_hits = set([19460, 19877, 20294, 20711, 21128, 21545, 21962, 19599, 20016, 20433, 20850, 21267, 21684, 22101, 19738, 20155, 20572, 20989, 21406, 21823]) 
high_hits = set([22052, 21605, 21158, 20711, 20264, 19817, 19370, 21903, 21456, 21009, 20562, 20115, 19668, 21754, 21307, 20860, 20413, 19966, 19519])
hits = low_hits.symmetric_difference(high_hits)
print(sorted(hits))

# generator methods
class GM:
    def loop(self):
        yield self.loop2(4)
        yield 
    def loop2(self, x):
        return x*''patattie''

g = GM()
for xn in g.loop():
    print(xn)
    
class GenMeth2:
    def __init__(self, y):
        self.y = y
    def loop(self, x):
        z = self.y
        for i in x:
            yield i+z

gm2 = GenMeth2(2)
print(list(gm2.loop([4,1,5])))

# __future__ print_function
class B:
    def __init__(self, value):
        self.value = value
    def __repr__(self):
        return ''B(%d)'' % self.value
        
b = B(14)

sep=''hoi''
end=''\n\n''
print(b, b, b, sep, end)
print(min(1,2,3, key=lambda x:-x))

# problem with inheritance across files
from testdata.subsub import aa

class baa(aa):
  def __init__(self):
    aa.__init__(self)
    print("init b")
    self.hoppa()

baa()

# @x.setter syntax
class bert(object):
    @property
    def patat(self):
        print(''get'')
        return self._x

    @patat.setter
    def patat(self, y):
        print(''set'')
        self._x = y

b1 = bert()
b1.patat = 12
print(b1.patat)

# class-level constructors
class aazz:
  class_dict_var={}
  class_dict_var2={}
  class_dict_var3={(1,2): 7}
  kwek = []
  kwad = (1,2)
  wof = ''wof''
  s = set()
  t = s 
  z = t | s
  wa = [2*x for x in range(10)]
  def __init__(self):
    self.y = 10
    aazz.class_dict_var[4] = 5
    aazz.class_dict_var2[''4''] = 5
    aazz.kwek.append(''1'')
    aazz.s.update(aazz.kwad)

print(aazz().y)
print(aazz.class_dict_var)
print(aazz.class_dict_var2)
print(aazz.class_dict_var3)
print(aazz.kwek)
print(aazz.kwad)
print(aazz.wof)
print(aazz.s, aazz.t, aazz.z)
print(aazz.wa)


'
]

{ #category : #resources }
PythonParserTests >> source_test_193 [
	^ '
# __init__ not called
from testdata import Material

# ugly imports
from testdata.bert import *
print os.getcwd(), len(sys.argv)

# isinstance problem
from testdata.bert import zeug
print isinstance(zeug(), zeug)

# dict corruption
x = 62
S = {}
t2 = (-25,9)
for i in range(-x, x+1):
   for j in range(-x, x+1):
       S[i, j] = ''hi''
if t2 in S:
    print "we got ''em"

# cast subtype in container
class Bla:
    pass
class Sub(Bla):
    pass
blas = [Bla()]
blas = [Sub()]

# generator and FAST_FOR_NEG
def gen(s):
    for i in range(1,10,s):
        yield i

for i in gen(2):
    print i

# argument unpacking
def blah((a,(b,c)), d):
    print a, b, c, d
t1 = (4, (3,2))
t2 = (7,8)
blah(t1, 1)
blah((1, (2,3)), 4)
blah((6,t2), 9)

class Oink:
    def __getitem__(self, (x,y)):
        print ''get'', x, y
        return x*y
    def __setitem__(self, (x,y), z):
        print ''set'', x, y, z
oink = Oink()
oink[4,5] = oink[2,3]
oink[t2] = oink[t2]
'
]

{ #category : #resources }
PythonParserTests >> source_test_194 [
	^ '#new casting/conversion approach
digit_dict = {
              "1":{1:(1,2,3,4,5),2:(1,3,5)  ,3:()}
              ,"2":{1:(2,)           ,2:()          ,3:(4,)}
              ,"3":{1:(2,4)         ,2:()          ,3:()}
              ,"4":{1:(4,5)         ,2:(1,5)     ,3:()}
              ,"5":{1:(4,)           ,2:()          ,3:(2,)}
              ,"6":{1:()              ,2:()          ,3:(2,)}
              ,"7":{1:(2,3,4,5)  ,2:(3,5)     ,3:()}
              ,"8":{1:()              ,2:()          ,3:()}
              ,"9":{1:(4,)           ,2:()          ,3:()}
              ,"0":{1:()              ,2:(3,)       ,3:()}
}
for d in sorted(digit_dict):
    d2 = digit_dict[d]
    for g in sorted(d2):
        print d, g, d2[g]

l = [[7,8,9], [7.7,8.8,9.9]]
    
for ll in l:
    for lll in ll:
        print ''%.2f'' % lll

#circular includes
from testdata import bert
class Here:
    def __str__(self):
        return ''here''
bert.hello(Here())

#partial support for ''super''
class A(object):
    def __init__(self, x):
        print ''a'', x
class C(A):
    def __init__(self, x):
        print ''c'', x
class B(C):
    def __init__(self, x):
        super(B, self).__init__(x)
        super(C, self).__init__(3*x)
        A.__init__(self, 2*x)
        C.__init__(self, 3*x)
        print ''b'', x
B(7)

#update with genexpr
_hextochr = dict((''%02x'' % i, chr(i)) for i in range(256))
_hextochr.update((''%02X'' % i, chr(i)) for i in range(256))
print(sorted(_hextochr))

#C++ looks in class namespace first
kwek = 18
class Test1(object) :
    def __init__(self, lenin) :
        self.len = lenin
        self.buf = "x" * lenin  
        self.kwek = 17
       
    def getlen(self) :
        print kwek
        return(len(self.buf))
       
f = Test1(100)
n = f.getlen()
print(n)

# {IOError, OSError}.{errno, strerror}
try :
    print("Try block")
    fd = open("nosuchfile") # open will fail
    print("File opened")
except IOError as e:
    print e, repr(e)
    print e.errno, e.strerror, e.filename
#import os XXX fix under windows
#try:
#    os.chdir(''meuheuheu'')
#except OSError as e2:
#    print e2, repr(e2)
#    print e2.errno, e2.strerror, e2.filename

# del crash
class AA:
    def __init__(self, x):
        if x == 1:
            self.a = AA(0)
            self.b = AA(0)
    def __del__(self):
        pass
aa = AA(1)
gg = {1:2,3:4,5:7}
del aa.a, aa.b, gg[1], gg[5]
print gg
lx = [1,2]
del aa, gg, lx

# char_cache out of bounds
for nnn in ''"\xd8\xc3A~s'':
    print repr(nnn)

# partition model
(ar,br,cr) = ''allo ballo''.partition('' '')
print ar
print br
print cr

# tuple_flow and globals 
def bwa():
   return (11,12)
def bwb():
   print bwg
def bwmain():
   global bwg
   bwg=30
   bwg,bwh=bwa()
   bwb()
bwmain()

# dict.update model
dikkie = {}
dikkie.update((a,-a) for a in range(-5,5,2))
print sorted(dikkie.keys()), sorted(dikkie.values())
import collections
dikkie2 = collections.defaultdict(int)
dikkie2.update((a,-a) for a in range(-5,5,2))
print sorted(dikkie2.keys()), sorted(dikkie2.values())

# unused import
from testdata.bert2 import hello
from testdata.bert2 import *

# late binding 
from testdata import board
from testdata import piece
piece.latebinding()

# missing forward class declaration
from testdata.Shape import Shape
class HitResult(object):
  def update(self, s):
      print ''update''
      self.s = s
hitresult = HitResult()
shape = Shape()
shape.woef(hitresult)

# almost closure
d3 = {1: 3, 2: 2, 3: 1}
l3 = [1,2,3]
print sorted(l3, key = lambda x: d3[x])

# float(..)
print float('' \n iNf''), float(''INF''), float('' -inf''), float(''NaN''), float(''-nan''), float(''infinity''), float(''-infinITY'')
'
]

{ #category : #resources }
PythonParserTests >> source_test_195 [
	^ '# !$!#$
try:
    [1].pop(-2)
except IndexError,e:
    print e
try:
    [].pop(0)
except IndexError,e:
    print e
try:
    [].remove(0)
except ValueError,e:
    print e
l = []
l.insert(4, 1)
l.insert(-1, 2)
l.insert(-10, 3)
print l

# basic __call__ overloading
class meuk:
    def __call__(self, x, y):
        print ''called with:'', x, y
        return ''return''
m = meuk()
x = m(7,1)
print x
class mycall:
    def __call__(self, x):
        return -x
print max(range(17,80), key=mycall())

# basic __iter__ overloading
class itermeuk:
    def __iter__(self):
        return iter(''itermeuk'')

i = itermeuk()
for x in i:
    print x

# __contains__ fallback to __iter__
import string
print [x for x in string.ascii_lowercase if x in i]

# dict.__init__ takes iterable iterable
da = iter([1,2])
db = iter([3,4])
dd = dict([da,db])
print sorted(dd)

# writelines takes iterable
a = file(''testdata/blah'',''w'')
a.writelines(set([''hoi\n'', ''mama\n'']))
a.close()
'
]

{ #category : #resources }
PythonParserTests >> source_test_196 [
	^ '# template not removed after iteration
class BadError(Exception):
    pass

if __name__==''__main__'':
    BadError()
    BadError("AOE")

# crash in assign_needs_cast XXX try self.method() instead of self.msg!
class MyBaseException:
    def __init__(self, msg=None):
        self.msg = msg
class MyException(MyBaseException): pass
class MyStandardError(MyException): pass
class MyBadError(MyException):
    pass

if __name__==''__main__'':
    MyStandardError()
    MyBadError()

# default hash method
class waf(object):
    pass

w = waf()
print hash(w) - hash(w)

# struct
import struct
from struct import unpack
b1, b2, h1, h2, h3, i1, i2, s1 = unpack("<BBHHHII16s", 32*''0'')
print b1, b2, h1, h2, h3, i1, i2, s1
header_format = "<32s2BHHH24s"
s1, b1, b2, h1, h2, h3, s2 = struct.unpack(header_format, 64*''0'')
print s1, b1, b2, h1, h2, h3, s2
print struct.calcsize(header_format)
class woef:
    def __init__(self):
        header_format = "<32s2BHHH24s"
        version = [0,0]
        magic, version[0], version[1], max_files, self.cur_files, reserved, user_description = struct.unpack(header_format, 64*''0'')
        print magic, version, self.cur_files
woef()
packer = struct.pack( ''HH'' ,1 ,2 )
print repr(packer)
print struct.calcsize( ''HH'' )
p0_0, p0_1, = struct.unpack( ''HH'' ,packer)
print repr(p0_0), repr(p0_1),
print
packer = struct.pack( ''!c3L2b3p'' ,''\xd5'' ,39 ,77 ,77 ,55 ,50 ,''\xf3\x8bq'' )
print repr(packer)
print struct.calcsize( ''!c3L2b3p'' )
p1_0, p1_1, p1_2, p1_3, p1_4, p1_5, p1_6, = struct.unpack( ''!c3L2b3p'' ,packer)
print repr(p1_0), repr(p1_1), repr(p1_2), repr(p1_3), repr(p1_4), repr(p1_5), repr(p1_6),
print
packer = struct.pack( ''!q2i2Q3H'' ,91 ,62 ,118 ,45 ,113 ,72 ,117 ,92 )
print repr(packer)
print struct.calcsize( ''!q2i2Q3H'' )
p2_0, p2_1, p2_2, p2_3, p2_4, p2_5, p2_6, p2_7, = struct.unpack( ''!q2i2Q3H'' ,packer)
print repr(p2_0), repr(p2_1), repr(p2_2), repr(p2_3), repr(p2_4), repr(p2_5), repr(p2_6), repr(p2_7),
print
packer = struct.pack( ''=2Ib3L3s'' ,30 ,3 ,65 ,23 ,114 ,101 ,''\xc3\xcaZ'' )
print repr(packer)
print struct.calcsize( ''=2Ib3L3s'' )
p3_0, p3_1, p3_2, p3_3, p3_4, p3_5, p3_6, = struct.unpack( ''=2Ib3L3s'' ,packer)
print repr(p3_0), repr(p3_1), repr(p3_2), repr(p3_3), repr(p3_4), repr(p3_5), repr(p3_6),
print
packer = struct.pack( ''!3?2l'' ,False ,False ,True ,75 ,39 )
print repr(packer)
print struct.calcsize( ''!3?2l'' )
p4_0, p4_1, p4_2, p4_3, p4_4, = struct.unpack( ''!3?2l'' ,packer)
print repr(p4_0), repr(p4_1), repr(p4_2), repr(p4_3), repr(p4_4),
print
packer = struct.pack( ''3B3x2b'' ,26 ,112 ,54 ,86 ,10 )
print repr(packer)
print struct.calcsize( ''3B3x2b'' )
p5_0, p5_1, p5_2, p5_3, p5_4, = struct.unpack( ''3B3x2b'' ,packer)
print repr(p5_0), repr(p5_1), repr(p5_2), repr(p5_3), repr(p5_4),
print
packer = struct.pack( ''@3H3qs'' ,67 ,14 ,69 ,12 ,66 ,91 ,''v'' )
print repr(packer)
print struct.calcsize( ''@3H3qs'' )
p6_0, p6_1, p6_2, p6_3, p6_4, p6_5, p6_6, = struct.unpack( ''@3H3qs'' ,packer)
print repr(p6_0), repr(p6_1), repr(p6_2), repr(p6_3), repr(p6_4), repr(p6_5), repr(p6_6),
print
packer = struct.pack( ''I2qc2p'' ,50 ,50 ,15 ,''\xd9'' ,''\xb1\x06'' )
print repr(packer)
print struct.calcsize( ''I2qc2p'' )
p7_0, p7_1, p7_2, p7_3, p7_4, = struct.unpack( ''I2qc2p'' ,packer)
print repr(p7_0), repr(p7_1), repr(p7_2), repr(p7_3), repr(p7_4),
print
packer = struct.pack( ''b2x2s'' ,77 ,''\xa5~'' )
print repr(packer)
print struct.calcsize( ''b2x2s'' )
p8_0, p8_1, = struct.unpack( ''b2x2s'' ,packer)
print repr(p8_0), repr(p8_1),
print
packer = struct.pack( ''Ip3si'' ,60 ,''-'' ,''t\xf5\x10'' ,9 )
print repr(packer)
print struct.calcsize( ''Ip3si'' )
p9_0, p9_1, p9_2, p9_3, = struct.unpack( ''Ip3si'' ,packer)
print repr(p9_0), repr(p9_1), repr(p9_2), repr(p9_3),
print
packer = struct.pack( ''<ibBx'' ,82 ,108 ,61 )
print repr(packer)
print struct.calcsize( ''<ibBx'' )
p10_0, p10_1, p10_2, = struct.unpack( ''<ibBx'' ,packer)
print repr(p10_0), repr(p10_1), repr(p10_2),
print
packer = struct.pack( ''!c3q2b3d'' ,''\xd5'' ,39 ,77 ,77 ,55 ,50 ,949.0 ,544.0 ,444.0 )
print repr(packer)
print struct.calcsize( ''!c3q2b3d'' )
p11_0, p11_1, p11_2, p11_3, p11_4, p11_5, p11_6, p11_7, p11_8, = struct.unpack( ''!c3q2b3d'' ,packer)
print repr(p11_0), repr(p11_1), repr(p11_2), repr(p11_3), repr(p11_4), repr(p11_5), repr(p11_6), repr(p11_7), repr(p11_8),
print
packer = struct.pack( ''l2Qc2d'' ,50 ,50 ,15 ,''\xd9'' ,692.0 ,24.0 )
print repr(packer)
print struct.calcsize( ''l2Qc2d'' )
p12_0, p12_1, p12_2, p12_3, p12_4, p12_5, = struct.unpack( ''l2Qc2d'' ,packer)
print repr(p12_0), repr(p12_1), repr(p12_2), repr(p12_3), repr(p12_4), repr(p12_5),
print
packer = struct.pack( ''<0p0I'' ,'''' )
print repr(packer)
print struct.calcsize( ''<0p0I'' )
packer = struct.pack( ''<3Q0s2B1i'' ,64 ,117 ,20 ,'''' ,48 ,38 ,50 )
print repr(packer)
print struct.calcsize( ''<3Q0s2B1i'' )
p14_0, p14_1, p14_2, p14_3, p14_4, p14_5, p14_6, = struct.unpack( ''<3Q0s2B1i'' ,packer)
print repr(p14_0), repr(p14_1), repr(p14_2), repr(p14_3), repr(p14_4), repr(p14_5), repr(p14_6),
print
packer = struct.pack( ''<0L2f0p1x'' ,682.0 ,307.0 ,'''' )
print repr(packer)
print struct.calcsize( ''<0L2f0p1x'' )
packer = struct.pack( ''=s'' ,''\xe6\xc1\xdc\xb4y9\xa9'' )
print repr(packer)
print struct.calcsize( ''=s'' )
p16_0, = struct.unpack( ''=s'' ,packer)
print repr(p16_0),
print
packer = struct.pack( ''<3c3i3l2p'' ,''\x84'' ,''\xb7'' ,''A'' ,90 ,51 ,127 ,18 ,56 ,3 ,''\x82'' )
print repr(packer)
print struct.calcsize( ''<3c3i3l2p'' )
p17_0, p17_1, p17_2, p17_3, p17_4, p17_5, p17_6, p17_7, p17_8, p17_9, = struct.unpack( ''<3c3i3l2p'' ,packer)
print repr(p17_0), repr(p17_1), repr(p17_2), repr(p17_3), repr(p17_4), repr(p17_5), repr(p17_6), repr(p17_7), repr(p17_8), repr(p17_9),
print
packer = struct.pack( ''<0p3??'' ,''\x85'' ,False ,2 ,0 ,''huh'' )
print repr(packer)
print struct.calcsize( ''<0p3??'' )
packer = struct.pack( ''!c3pp1q'' ,''\xe4'' ,''1'' ,''\xfeE\x9f\xdf`\x969\xdb'' ,40 )
print repr(packer)
print struct.calcsize( ''!c3pp1q'' )
p19_0, p19_1, p19_2, p19_3, = struct.unpack( ''!c3pp1q'' ,packer)
print repr(p19_0), repr(p19_1), repr(p19_2), repr(p19_3),
print
packer = struct.pack( ''!3s'' ,'''' )
print repr(packer)
print struct.calcsize( ''!3s'' )
p20_0, = struct.unpack( ''!3s'' ,packer)
print repr(p20_0),
print
packer = struct.pack( ''@0q3x0p0d'' ,''\x13\xe5\xb4\x98.\xff'' )
print repr(packer)
print struct.calcsize( ''@0q3x0p0d'' )
packer = struct.pack( ''0p2I?H'' ,''\xe7\xa3\xd2'' ,426 ,403 ,''hoi'' ,85 )
print repr(packer)
print struct.calcsize( ''0p2I?H'' )
packer = struct.pack( ''>0i0p3p2x'' ,''g\xb0\x0c\x02\x89\xd3\xaf'' ,''\xfdK\xb4\xb1\xf6l'' )
print repr(packer)
print struct.calcsize( ''>0i0p3p2x'' )
packer = struct.pack( ''>b0p2s'' ,110 ,''\x1d'' ,'''' )
print repr(packer)
print struct.calcsize( ''>b0p2s'' )
packer = struct.pack( ''@2f0p3p1L'' ,531.0 ,469.0 ,''1k\x1a\x8c\xfd\xc0u\xdf'' ,'''' ,60 )
print repr(packer)
print struct.calcsize( ''@2f0p3p1L'' )
try:
    s = struct.pack(''h'', 18.18)
    print repr(s)
    dwah, = struct.unpack(''h'', s)
    print dwah
    s = struct.pack(''h'', ''19'')
    print repr(s)
    dwah, = struct.unpack(''h'', s)
    print dwah
    s = struct.pack(''h'', True)
    print repr(s)
    dwah, = struct.unpack(''h'', s)
    print dwah
except Exception, messg:
    print ''baaah''
try:
    s = struct.pack(''fd'', 17, 18)
    print repr(s)
    dwad, ewad = struct.unpack(''fd'', s)
    print dwad, ewad
    s = struct.pack(''fd'', ''oi'', 18)
except Exception:
    print ''oopsie''
try:
    raise struct.error("butkus")
except struct.error, e:
    print e
booll, = struct.unpack(''?'', ''\x02'')
print booll
print repr(struct.pack(''p'', 300*''x''))

# array
import array
arr = array.array(''i'', [3,2,1])
print arr
print arr.tolist(), repr(arr.tostring())
print arr[0], arr[1], arr[2]
arr.fromlist([4,5])
print sorted(arr)
arr2 = array.array(''c'')
arr2.extend(''hoei'')
print arr2.count(''h''), arr2.index(''h'')
arr2[-1] = ''X''
arr2.insert(0, ''-'')
arr2.fromlist([''a'', ''b''])
print arr2, arr2.tolist(), arr2.tostring()
print arr2[0]
fla = array.array(''f'', [3.141])
fla = array.array(''d'', (142344, 2384234))
fla.fromlist([1234,])
fla[0] = 28000
print fla.typecode, fla.itemsize
print repr(fla.tostring()), [''%.2f'' % flah for flah in fla.tolist()]
print ''%.2f'' % fla[1]
print repr(fla)
arr3 = array.array(''i'')
arr3.fromstring(arr.tostring())
print arr, arr3
areq = (arr==arr3)
print areq
arradd = arr+arr
print arradd
beh = arr
arr += arr
print arr
print beh
mul1 = arr * 4
mul2 = 3 * arr
print mul1, mul2
wah = mul1
mul1 *= 1
print mul1
print wah
boolt = wah.__contains__(5), 6 in wah
print boolt
print len(wah), wah.count(5), wah.index(5)
print wah.pop(4)
print wah.pop()
print wah.pop(-2)
print wah
wah.remove(5)
print wah
print wah[-2]
wah.reverse()
print wah
wah.byteswap()
print wah
wah[3] = 99
print wah
wah.insert(7, 98)
print wah
arr4 = array.array(''i'', [3,2,1])
print arr4
f = open(''testdata/blabla'', ''w'')
arr4.tofile(f)
f.close()
arr5 = array.array(''i'')
f = open(''testdata/blabla'')
arr5.fromfile(f, 2)
try:
    arr5.fromfile(f, 2)
except EOFError, e:
    print e
f.close()
print arr5
import copy
arr = array.array(''i'', [3,2,1])
c1 = copy.copy(arr)
c1.append(4)
c2 = copy.deepcopy(arr)
c2.append(5)
print c1, c2, arr
arra = array.array(''i'', [1,2])
arrb = array.array(''i'', [1,2,3])
print arra == arrb, arra > arrb, arra < arrb, cmp(arra, arrb) # XXX compare with non-arrays
del arrb[1]
del arrb[-1]
print arrb
allr = array.array(''H'', range(10))
print allr
print allr[2:8:2]
allr[1:3] = array.array(''H'', range(5))
print allr
del allr[1:7:2]
print allr
aahaa = array.array(''i'', range(5))
aahaa.extend(aahaa)
print aahaa
arghx = array.array(''i'', range(5))
arghy = array.array(''h'', range(5))
print arghx == arghy
arghy.append(7)
print arghx == arghy

# binascii
import binascii
str = ''my guitar wants to strum all night long''

b2a = binascii.b2a_qp(str)
print repr(b2a)
a2b = binascii.a2b_qp(b2a)
print repr(a2b)

b2a = binascii.b2a_uu(str)
print repr(b2a)
a2b = binascii.a2b_uu(b2a)
print repr(a2b)

b2a = binascii.b2a_hex(str)
print repr(b2a)
a2b = binascii.a2b_hex(b2a)
print repr(a2b)

b2a = binascii.b2a_hqx(str)
print repr(b2a)
a2b,done = binascii.a2b_hqx(b2a) # returns a string instead of a tuple
print repr(a2b),done

b2a = binascii.b2a_base64(str)
print repr(b2a)
a2b = binascii.a2b_base64(b2a)
print repr(a2b)

b2a = binascii.rlecode_hqx(str)
print repr(b2a)
a2b = binascii.rledecode_hqx(b2a)
print repr(a2b)

b2a = binascii.hexlify(str)
print repr(b2a)
a2b = binascii.unhexlify(b2a)
print repr(a2b)

# delslice bug
all = range(10)
print all[2:8:2]
all[1:3] = range(5)
print all
del all[1:7:2]
print all

# OMG
omg, = (17,)
print omg

# sys vars
import sys
print sys.platform
print sys.byteorder
copyright = sys.copyright
assert (sys.version_info[0], sys.version_info[1]) >= (2, 4)

# str.title
print ''8RMgvsFN51QrM0sJeXU11yXodq1drv''.title()

# forward referencing base class doesn''t work
import testdata.timer
class smurf (testdata.timer.TimingOut):
    def __init__(self):
        testdata.timer.TimingOut.fire_timer(self)
smurfje = smurf()
testdata.timer.timeout_add(42, smurfje)

# file.xreadlines (deprecated but still)
lines = open(''testdata/crap.py'',''r'').xreadlines()
for line in lines:
    print line.strip()

# bin() limited to 12 digits
print bin(123456789)

# exception printing
valeur = ValueError(''valeur'')
print valeur
print repr(valeur)
print valeur.message
print valeur.__class__.__name__

# sys.exit case
import sys
sys.exit()
'
]

{ #category : #resources }
PythonParserTests >> source_test_197 [
	^ '# mmap
import mmap

import os

PAGESIZE = mmap.PAGESIZE

TESTFILE_IN  = os.path.join(''testdata'', ''board.py'')
TESTFILE_OUT = os.path.join(''testdata'', ''mmap.out'')

def setUp():
    if os.path.exists(TESTFILE_OUT):
        os.remove(TESTFILE_OUT)

def tearDown(map):
    map.close()
    try:
        os.remove(TESTFILE_OUT)
    except OSError:
        pass
            
def test_anonymous():
    ''''''
    Test mmap module on anonymous files.
    ''''''
    print ''## test_anonymous:''
    map = mmap.mmap(-1, PAGESIZE)
    assert len(map) == PAGESIZE
    print ''# write:''    
    ## print map.size() ## TODO: throw mmap.error: [Errno 9] Bad file descriptor?
    assert map.tell() == 0
    map.write_byte(''f'')
    assert map.tell() == 1
    map.write(''oo bar\tbaz\nqux'')
    assert map.tell() == 15
    
    print ''# get/set:''
    assert map[:15] == ''foo bar\tbaz\nqux''
    print map[0]    
    map[-1]=''Z''
    print map[-1]    
    print map[4:-PAGESIZE+7]
    print ''%r'' %map[:15] 
    map[4:7] = "foo"
    map[PAGESIZE-3:] = "xyz"
    print map[PAGESIZE-3:]
    
    print ''# find/seek:''
    assert map.find("foo") == -1
    map.seek(0)
    assert map.tell() == 0
    assert map.find("foo") == 0
    assert map.rfind("foo") == 4
    map.seek(-1, 2)
    assert map.tell() == PAGESIZE-1    
    map.seek(0, 2)
    assert map.tell() == PAGESIZE
    map.seek(-PAGESIZE, 1)
    assert map.tell() == 0
    
    print ''# read:''
    print map.read(3)
    print ''%r'' % map.read_byte()
    print ''%r'' % map.readline()
    print ''%r'' % map.read(3)
    
    print ''# move:''
    map.move(8, 4, 3)

    print ''# iter:''
    assert "f" in map
    assert "a" not in map

    map.flush()
    
    print ''# Result:''
    print ''%r'' % map[:15]

## re not supported (yet)
##     m = re.search(''z'',map)
##     assert m.start() == PAGESIZE -1

    h = 0
    for c in map:
        h += ord(c) * 31
    print h
    
    try:
        map.resize(0x2000)
        assert len(map) == 0x2000
    except:
        pass
    
    map.close()
    
def test_basic():
    ''''''
    Taken from python 2.7
    ''''''
    print ''## test_basic:''
    setUp()
    # Test mmap module on Unix systems and Windows
    # Create a file to be mmap''ed.
    f = open(TESTFILE_OUT, ''w+'')

    # Write 2 pages worth of data to the file
    f.write(''\0''* PAGESIZE)
    f.write(''foo'')
    f.write(''\0''* (PAGESIZE-3) )
    f.flush()
    m = mmap.mmap(f.fileno(), 2 * PAGESIZE)
    f.close()

    # Simple sanity checks

    assert m.find(''foo'') == PAGESIZE

    assert len(m) == 2*PAGESIZE

    print repr(m[0])
    print repr(m[0:3])
    
    try:
        m[len(m)]
    except IndexError:
        print "ok"

    # Modify the file''s content
    m[0] = ''3''
    m[PAGESIZE +3: PAGESIZE +3+3] = ''bar''

    # Check that the modification worked
    print repr(m[0])
    print repr(m[0:3])
    print repr(m[PAGESIZE-1 : PAGESIZE + 7])

    m.flush()
    # Try to seek to negative position...
    try:
        m.seek(-1)
    except ValueError:
        print "ok"

    # Try to seek beyond end of mmap...
    try:
        m.seek(1, 2)
    except ValueError:
        print "ok"

    try:
        m.seek(-len(m)-1, 2)
    except ValueError:
        print "ok"

    tearDown(m)

def test_readonly():
    ''''''
    Reads a file.
    ''''''
    print ''## test_readonly:''
    f = open(TESTFILE_IN, ''r+'')
    mapsize = os.path.getsize(TESTFILE_IN)
    map = mmap.mmap(f.fileno(), 0)
    assert map.size() == mapsize
    print repr(map.read(mapsize))
    map.close()

def test_rfind():
    # test the new ''end'' parameter works as expected
    print ''## test_rfind:''
    setUp()
    f = open(TESTFILE_OUT, ''w+'')
    data = ''one two ones''
    n = len(data)
    f.write(data)
    f.flush()
    m = mmap.mmap(f.fileno(), n)
    f.close()

    assert m.rfind(''one'') == 8
    assert m.rfind(''one '') == 0
    assert m.rfind(''one'', 0, -1) == 8
    assert m.rfind(''one'', 0, -2) == 0
    assert m.rfind(''one'', 1, -1) == 8
    assert m.rfind(''one'', 1, -2) ==-1
    
    tearDown(m)
    
def test_tougher_find():
    ''''''
    Taken from python 2.7
    ''''''
    print ''## test_tougher_find:''
    setUp()
    # Do a tougher .find() test.  SF bug 515943 pointed out that, in 2.2,
    # searching for data with embedded \0 bytes didn''t work.
    f = open(TESTFILE_OUT, ''w+'')

    data = ''aabaac\x00deef\x00\x00aa\x00''
    n = len(data)
    f.write(data)
    f.flush()
    m = mmap.mmap(f.fileno(), n)
    f.close()

    for start in range(n+1):
        for finish in range(start, n+1):
            slice = data[start : finish]
            print m.find(slice) , data.find(slice)
            print m.find(slice + ''x'') == -1

    tearDown(m)

test_anonymous()
test_basic()
test_readonly()
test_rfind()
test_tougher_find()

# re search empty string, match_object.span
import re
r = re.compile(''^a?$'')
print r.search('''').start()
print r.search('''').end()
print r.search('''').span()
print r.search(''a'').start()
print r.search(''a'').end()
print r.search(''a'').span()

# id
foo_a="foo";foo_b="foo";foo_c="foo";
print id(foo_a)==id(foo_b)==id(foo_c)

# reduce fixes, more tests
from math import fabs
print reduce(lambda x,y: x + fabs(y), xrange(10))
print reduce(lambda x,y: x + fabs(y), xrange(10), 1)
print reduce(lambda x,y: x + fabs(y), xrange(10), 1.0)
print reduce(lambda x,y: x + fabs(y), map(float, xrange(10)))
print reduce(lambda x,y: x + fabs(y), map(float, xrange(10)), 2)
print reduce(lambda x,y: x + fabs(y), map(float, xrange(10)), 2.0)
class Aap:
    def __init__(self, value):
        self.value = value
    def __add__(self, other):
        return Aap(self.value+other.value)
    def __str__(self):
        return ''Aap(%s)'' % self.value
aaplist = [Aap(3), Aap(4), Aap(5)]
print sum(aaplist, Aap(6))
print reduce(lambda a,b:a+b, aaplist), reduce(lambda a,b:a+b, aaplist, Aap(6))

# set methods now often take multiple args
sett = set(range(3))
sett.update(range(2,5), range(12,14))
print sorted(sett)
sett.update(range(2,5), range(12,14), range(18, 20))
print sorted(sett)

sett = set(range(4))
print sorted(sett.union(set(range(6)), (6,7)))
print sorted(sett.union([5], [3, 4], range(3)))
print sorted(sett.intersection(range(1, 4), range(2, 5)))
print sorted(sett.intersection(range(3), [2], range(4)))
print sorted(sett.difference(range(2), range(3)))
print sorted(sett.difference(range(2), range(3), [3, 6]))

sett = set(range(4))
sett.intersection_update(range(2), range(3))
print sorted(sett)
sett = set(range(3))
sett.intersection_update(range(2), range(3), range(4))
print sorted(sett)

sett = set(range(4))
sett.difference_update(range(2), range(3))
print sorted(sett)
sett = set(range(5))
sett.difference_update(range(2), range(3), [3, 6])
print sorted(sett)

#cannot hurt to test this
print [].__class__.__name__
print ''hoi''.__class__.__name__

#string formatting asterisk
print "%d * %d" % (1,2)
print "%d* %% %d" % (1,2)
print "%d%% *%d" % (1,2)

#rich comparison fallbacks
class inst(object):
    def __init__(self, num, opcode=''add'', pc=''1''):
        self.opcode = opcode
        self.pc = pc
        self.num = num
    
    def __lt__( self, other):
        return self.num < other.num

    def __repr__(self): 
        return "%d" % self.num
        
Seq = [inst(3),inst(1),inst(4),inst(2)]
print Seq
print sorted(Seq)

class LT:
    def __gt__(self, o):
        print ''gt!''
        return False
    def __le__(self, o):
        print ''le!''
        return True
print LT() < LT()
print LT() >= LT()

class LT2:
    def __lt__(self, o):
        print ''lt!''
        return False
    def __ge__(self, o):
        print ''ge!''
        return True
print LT2() > LT2()
print LT2() <= LT2()

#complex
a = 4j + 3j
print a
b = a.real
print sum([1j, 2j, 3j])
print ''%s'' % (1+3j)
print 1==0j, 0.0==0j, 1.0==0j, 0j==0.0

#colorsys
import colorsys

print ''%.2f'' % colorsys.ONE_THIRD
print ''%.2f'' % colorsys.ONE_SIXTH
print ''%.2f'' % colorsys.TWO_THIRD

def pr(t):
    print [(''%.2f''%x) for x in t]

pr(colorsys.hls_to_rgb(1.0, 0.5, 0.7))
pr(colorsys.rgb_to_hls(1.0, 0.5, 0.7))
pr(colorsys.yiq_to_rgb(1.0, 0.5, 0.7))
pr(colorsys.rgb_to_yiq(1.0, 0.5, 0.7))
pr(colorsys.hsv_to_rgb(1.0, 0.5, 0.7))
pr(colorsys.rgb_to_hsv(1.0, 0.5, 0.7))

#equality
t1 = (''rc'', (0, 0)) 
t2 =(''rc'', (0, 0) )
print t1!=t2
print t1==t2
print {(3,2): 0} == {(3,2): 1}

#generator and arg unpacking
def genpack((i,j),a,b):
    yield i
    yield j
    yield a
    yield b
ttt = (1,2)
for aaa in genpack(ttt,3,4):
    print aaa

#fill in virtual variable types
class CCache:
    def Probe(self):
        self.VictimLineAddr = [1]
        self.VictimLineAddr = None

class CCache1(CCache):
    pass

class CCache2(CCache):
    pass

c = CCache1()
c = CCache2()
c.Probe()

# forward referencing vars in inherited method
class TraceParser:
    def parseProgramCode(self):
        self.basicBlockList = []
#        basicblock = 1
        for x in range(2):
            if x == 1:
                self.basicBlockList.append(basicblock)
            else:
                basicblock = 2
        print self.basicBlockList

class CUnifiedTraceParser(TraceParser):
    pass

CUnifiedTraceParser().parseProgramCode()

# rewrite incompatible types if possible
C1 = {1: ''een''}
C2 = (1.0, ''woef'')
D = (C1, C2) if True else ({}, None)
print D
print [1] if True else None
print [] if True else [1]
print [[]] == [[1]], [[1]] == [[]]
print dict([(1,2.0)]) == dict()
print dict([(1,2.0)]) == {}
print set() == set([1,2])
print (set([''a'']), set([1.0])) == (set(), set())
print (set([''a'']), set([1.0])) == (set(), None)
def slicing():
    a = range(10)
    a[2:] = range(4)
    a[2:] = []
    print a
    b = map(str, a)
    b[2:] = []
    b[2:] = [''woef'']
    b[2:] = [None]
    print b
slicing()
print [1] or []
print [] or [''uhm'']
print None or ''waf''
print [1]+[]
print [[]]+[[1]]
print [None]+[[''uh'']]
print set([]) == set([1])
print set([1]) == set([1.0])
print 1==0j
print [1j]==[1.0]
print 0 == True, 1 == True, 2 == True
print 0 == False, 1 == False, 2 == False
print [x == True for x in range(3)]
print [1] == [True]

# for .., .. in somedict.iteritems()
def fastdictiteritems():
    d = {3: 4}
    for a,b in d.iteritems():
        print a, b
    for c in d.iteritems():
        print c

    print [(a, b) for a,b in d.iteritems()]
    print [c for c in d.iteritems()]

    d2 = {(3,4): (4,5)}
    for (e,f), (g,h) in d2.iteritems():
        print e,f,g,h

    d3 = {1.0: ''hallo''}
    print [(x, y) for x,y in d3.iteritems()]
fastdictiteritems()

# deepcopy improvement
import copy
class A:
    pass
class B:
    pass
def copytest():
    a = A()
    a.b = B()
    c = copy.deepcopy(a)
    a.b.x = 18
    c.b.x = 19
    print a.b.x, c.b.x
copytest()

# return ''nothing'' in generator
def hoppagen():
    yield True
    yield False
    print ''hoppa''
    return
for hoppax in hoppagen():
    print hoppax

# sys.exit case
import sys
sys.exit(''woef'')
'
]

{ #category : #resources }
PythonParserTests >> source_test_198 [
	^ '# __NOT macro missing parentheses
x=10
if not 1<x<10:
    print "out of constraint"

# enumerate start arg
print list(enumerate(''hoppa'', 2))

# ConfigParser.items model
import ConfigParser
p = ConfigParser.ConfigParser()
p.read("testdata/symbols.INI")
for entry in p.items("symbols"):
    print entry
items = p.defaults().items()
print items
sections = p.sections()
print sections

# os.listdir crash
import os
try:
    print os.listdir(''/does/not/exist'')
except OSError:
    print ''path does not exist!''

# itertools.izip missing constructor
import itertools
for a,b in itertools.izip(range(4), range(4)):
    print a+b

# qualify & add include for class name
from testdata import iec2
from testdata import d1541
IEC = iec2.IECBus()
hop = d1541.D1541(IEC, 8)
print hop.get_data()

# sys.exit case
import sys
sys.exit(7)
'
]

{ #category : #resources }
PythonParserTests >> source_test_199 [
	^ '# skipped Discard node inside generator
def streams(archive):
    archive.seek(4) # Skip magic number
    print ''zoek'', archive.tell()
    stream = ''''
    yield stream

def decompressor(archive):
    for stream in streams(archive):
        pass
 
decompressor(open(''testdata/binas'', ''rb''))

# set.__ior__ etc. model
class waf:
    def __init__(self, value):
        self.value = value

    def __iand__(self, b):
        return waf(self.value + b.value)

    def __isub__(self, b):
        return waf(self.value - b.value)

wa = waf(4)
wa &= waf(9)
wa -= waf(2)
print wa.value

set1 = set()
set1 |= set([2,3])
print set1

set2 = set()
set2 &= set([2,3])
print set2

set3 = set()
set3 ^= set([2,3])
print set3

set4 = set()
set4 -= set([2,3])
print set4

# overflow in pow, use long long internally
print pow(290797,2,50515093)

# float.is_integer
print 7.7.is_integer()
print 7.0.is_integer()
a = 3.14
print a.is_integer(), (a+a).is_integer()
print 2*a.is_integer()

# model __eq__ from __contains__
class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y
    def __eq__(self, other):
        return (self.x, self.y) == (other.x, other.y)
    def __str__(self):
        return ''Point(%s, %s)'' % (self.x, self.y)

def wof():
    a = b = c = d = Point(7,8)
    p = Point(7,8)
    return p if p not in (a, b, c, d) else None

print wof()

# context of inherited method
import testdata.CCMView

class GameView(testdata.CCMView.CCMView):
    pass

gv = GameView()
gv.wa()

# optimized array slicing, test
import array
arr = array.array(''B'')
arr.extend(range(20))
print arr
print arr[:]
print arr[-7:]
print arr[-7::2]
print arr[:8:3]
print arr[15:1:-2]

#os.popen2 improvement
import os
child_stdin, child_stdout = os.popen2(["echo", "a  text"], "r")
print repr(child_stdout.read())
child_stdin, child_stdout = os.popen2(iter(["echo", "a  text"]), "r")
print repr(child_stdout.read())
child_stdin, child_stdout = os.popen2(("echo", "a  text"), "r")
print repr(child_stdout.read())
child_stdin, child_stdout = os.popen2("echo a  text", "r")
print repr(child_stdout.read())
'
]

{ #category : #resources }
PythonParserTests >> source_test_2 [
	^ '
class fred: pass
x = fred()

'
]

{ #category : #resources }
PythonParserTests >> source_test_20 [
	^ '
cube = []
cube.append(1.0)
y = cube[0]

'
]

{ #category : #resources }
PythonParserTests >> source_test_200 [
	^ '#select.select
import os
import select
f = os.popen("ls", "r")
rFDs, wFDs, xFDs = select.select((), [], set(), 0)
rFDs, wFDs, xFDs = select.select([f.fileno()], set(), [], 20)
print len(rFDs), len(wFDs), len(xFDs)

#time crashes without args
import time
print time.asctime()[:10]
print str(time.localtime())[:50]

#null char
print ''hello\0world''
print repr(''hello\0world'')
print repr(''woef%swaf'' % ''waaa\0wa'')
print repr(''woef%swaf%s!'' % (''waaa\0wa\0wa'', ''\0haaap''))

#inheritance, generator expression
import array

class Common(object):
    CostScale = 7
    #StateTable = FsmGenerator().stateTable

    def __init__(self, inputStream, outputStream, options):
        lzpLowCount = 10
        self.lzpLow = array.array("H", (0xffb5 for _ in xrange(lzpLowCount)))

class Decoder(Common):
    def __init__(self, inputStream, outputStream, options):
        Common.__init__(self, inputStream, outputStream, options)

d = Decoder(None, None, None)
print d.lzpLow

#static code
class moeha:
    x = 4
    print ''joeh''
    l = []
    for i in range(10):
        l.append(x)
        l.append(i)
    y = [[1.0]]

    def mwa(self):
        pass

    @property
    def ole(self):
        return 7

print moeha.x
print moeha.l
print moeha.y

#add case from issue 125, plus a few more tests
class MyClass(object):
    A, B, C = range(3)
    x, y = 9, (10, 11)
    z = zz = B*x
    t, t2 = v, v2 = y
print MyClass.A, MyClass.B, MyClass.C, MyClass.x, MyClass.y, MyClass.z, MyClass.zz, MyClass.t, MyClass.t2, MyClass.v, MyClass.v2

#unused default func
def bla(hop=cmp):
    print ''ole'', hop(9,10)
bla(lambda a,b:a+b)
'
]

{ #category : #resources }
PythonParserTests >> source_test_201 [
	^ '# unpacking negative integers
import struct
s = struct.pack(''h'', -12)
xx, = struct.unpack(''h'', s)
print xx
s = struct.pack(''i'', -13)
xx, = struct.unpack(''i'', s)
print xx
s = struct.pack(''l'', -14)
xx, = struct.unpack(''l'', s)

# block comment fix
print xx
print "hi there"

#{ comment here ok

# nothing

#} not ok

print "hi there 3"

# virtual function: merge parent as well

class X:
   def __str__(self):
       return ''X''

class Y(X):
   def __str__(self):
       return ''Y''

class A:
    def woef(self, l):
        print l

class B(A):
    def woef(self, l):
        print l

x = A()
x.woef(X())

y = A()
y = B()
y.woef(Y())

# using builtin names
class meuh:
    def set(self, x):
        self.x = x
    def filter(self, x):
        self.x = x
    def array(self, x):
        self.x = x

mmm = meuh()
mmm.set(8)
mmm.filter(8)
mmm.array(8)
print mmm.x

# class passing is not supported, but at least we shouldn''t crash on this
class wowf:
    pass

x = wowf
x

# type inference bug uncovered by C64 SVN (list type is left unsplit)
class BRKHandler:
    pass

class Tape(BRKHandler):
    pass
    
class IECMember(BRKHandler):
    pass
    
class ComputerDevice(IECMember):
    pass

def wop(a, b):
    t = Tape()
    c = ComputerDevice()
    hooks = [t, c]
    x, y = 1, 1.0
    y = 1.0
    blah = [x, y]

bla = Tape()
bla = IECMember()
bla = ComputerDevice()

wop(bla, bla)

# default args and inheritance
class Alpha:
    def func(self, value=True):
        print("value is:" + str(value))

class Beta(Alpha):
    pass

beta = Beta()
beta.func();

# changing list while iterating over it..
testdellastelem = []
testdellastelem.append("test1")
testdellastelem.append("test2")
testdellastelem.append("test3")
for v in testdellastelem:
  if (v == "test3"):
    testdellastelem.remove("test3")
print testdellastelem
testdellastelem = []
testdellastelem.append("test1")
testdellastelem.append("test2")
testdellastelem.append("test3")
for v in testdellastelem:
  if (v == "test2"):
    testdellastelem.remove("test3")
print testdellastelem
testdellastelem = []
testdellastelem.append("test1")
testdellastelem.append("test2")
testdellastelem.append("test3")
for v in testdellastelem:
  if (v == "test2"):
    testdellastelem.remove("test1")
print testdellastelem

# global declaration ignored
day = 0
def wopp():
    global day
    for day in range(3):
        print day
wopp()
print day

'
]

{ #category : #resources }
PythonParserTests >> source_test_202 [
	^ '# name clash
debug = True

class Debug:
    def debug(self, msg):
        if debug:
            print msg

Debug().debug(''debug'')
'
]

{ #category : #resources }
PythonParserTests >> source_test_21 [
	^ '
def gettuple():
    return (5,6)

a = gettuple()
cube = [(1,2),(3,4),a,gettuple()]
#cube.append(1.0)

'
]

{ #category : #resources }
PythonParserTests >> source_test_22 [
	^ '
for a in [(1,2),(3,4)]:                  # [list_tuple_int]
    pass

'
]

{ #category : #resources }
PythonParserTests >> source_test_23 [
	^ '

def hoei(cube):                          # x: [tuple_int], cube: [list_tuple_int], pos: [tuple_int]
    for pos in cube:                     # [list_tuple_int]
        x = pos                          # [tuple_int]
    return x                             # [tuple_int]

cube = [(1,2),(3,4),(5,6)]               # [list_tuple_int]
b = hoei(cube)                               # [tuple_int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_24 [
	^ '
class integer: pass

class fred:
    def __add__(self, x):
        i = integer()
        return i

def hoei():
    a = fred()
    return a+a

a = hoei()

'
]

{ #category : #resources }
PythonParserTests >> source_test_25 [
	^ '
cube = [[1,2],(3,4)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_26 [
	^ '
cube = [(1,2),(3,4)]                     # [list_tuple_int]
cube[0] = (1,2)                          # [tuple_int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_28 [
	^ '
def propagate(la):                       # la: [list(int)]
    print la, la                         # [str], [str]

propagate([1])                           # []
propagate([2])                           # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_29 [
	^ '
argv = ['''',''testdata/uuf250-010.cnf'']             # [list(str)]

cnf = [l.strip().split() for l in file(argv[1]) if l[0] not in ''c%0\n'']
clauses = [[int(x) for x in m[:-1]] for m in cnf if m[0] != ''p'']
nrofvars = [int(n[2]) for n in cnf if n[0] == ''p''][0]
vars = range(nrofvars+1)
occurrence = [[[c for c in clauses if -v in c],[c for c in clauses if v in c]] for v in vars]
fixedt = [-1 for var in vars]

'
]

{ #category : #resources }
PythonParserTests >> source_test_3 [
	^ '
def ident(x):
    return x
def boing(c, d):
    return ident(c)
a = 1
h = boing(boing(a,1.0),boing(3.0,a))

'
]

{ #category : #resources }
PythonParserTests >> source_test_30 [
	^ '
# (c) Mark Dufour
# --- mark.dufour@gmail.com

def _reduce(f, l, i=-1):                  # f: [lambda0], i: [int], l: [list(int)], r: [int]
    if not l:                            # [list(int)]
        if i != -1: return i             # [int]
        print ''*** ERROR! *** reduce() called with empty sequence and no initial value'' # [str]

    if i != -1:                          # [int]
        r = f(i, l[0])                   # [int]
    else:
        r = l[0]                         # [int]

    for i in range(len(l)-1):            # [int]
        r = f(r, l[i+1])                 # [int]

    return r                             # [int]

# prelims

argv = ['''',''testdata/uuf250-010.cnf'']             # [list(str)]

cnf = [l.strip().split() for l in file(argv[1]) if l[0] not in ''c%0\n''] # [list(list(str))]
clauses = [[int(x) for x in m[:-1]] for m in cnf if m[0] != ''p''] # [list(list(int))]
nrofvars = [int(n[2]) for n in cnf if n[0] == ''p''][0] # [int]
vars = range(nrofvars+1)                 # [list(int)]
occurrence = [[] for l in vars+range(-nrofvars,0)] # [list(list(list(int)))]
for clause in clauses:                   # [list(int)]
    for lit in clause: occurrence[lit].append(clause) # [int]
fixedt = [-1 for var in vars]            # [list(int)]

def solve_rec():                         # la_mods: [list(int)], var: [int], prop_mods: [list(int)], choice: [int]
    global nodecount
    nodecount += 1                       # []
    if nodecount == 100:
        return 1
    if not -1 in fixedt[1:]:             # [int]
        print ''v'', '' ''.join([str((2*fixedt[i]-1)*i) for i in vars[1:]]) # [str], [str]
        return 1                         # [int]

    la_mods = []                         # [list(int)]
    var = lookahead(la_mods)             # [int]
    #print ''select'', var                  # [str], [int]
    if not var: return backtrack(la_mods) # [int]

    for choice in [var, -var]:           # [int]
        prop_mods = []                   # [list(int)]
        if propagate(choice, prop_mods) and solve_rec(): return 1 # [int]
        backtrack(prop_mods)             # [int]

    return backtrack(la_mods)            # [int]

def propagate(lit, mods):                # current: [int], unfixed: [int], mods: [list(int)], clause: [list(int)], lit: [int], length: [int]
    global bincount

    current = len(mods)                  # [int]
    mods.append(lit)                     # []

    while 1:                             # [int]
        if fixedt[abs(lit)] == -1:       # [int]
            fixedt[abs(lit)] = int(lit>0)   # [int]
            for clause in occurrence[-lit]: # [list(int)]
                length, unfixed = info(clause) # [tuple(int)]

                if length == 0: return 0 # [int]
                elif length == 1: mods.append(unfixed) # []
                elif length == 2: bincount += 1 # []

        elif fixedt[abs(lit)] != int(lit>0): return 0 # [int]

        current += 1                     # []
        if current == len(mods): break   # [int]
        lit = mods[current]              # [int]

    return 1                             # [int]

def lookahead(mods):                     # mods: [list(int)], dif: [list(int)], choice: [int], score: [list(int)], prop_mods: [list(int)], var: [int], prop: [int]
    global bincount

    dif = [-1 for var in vars]           # [list(int)]
    for var in unfixed_vars():           # [int]
        score = []                       # [list(int)]
        for choice in [var, -var]:       # [int]
            prop_mods = []               # [list(int)]
            bincount = 0                 # [int]
            prop = propagate(choice, prop_mods) # [int]
            backtrack(prop_mods)         # [int]
            if not prop:                 # [int]
                if not propagate(-choice, mods): return 0 # [int]
                break
            score.append(bincount)       # []
        dif[var] = _reduce(lambda x, y: 1024*x*y+x+y, score, 0) # [int]

    return dif.index(max(dif))           # [int]

def backtrack(mods):                     # lit: [int], mods: [list(int)]
    for lit in mods: fixedt[abs(lit)] = -1 # [int]
    return 0                             # [int]

def info(clause):                        # lit: [int], clause: [list(int)], unfixed: [int], len: [int]
    len, unfixed = 0, 0                  # [int], [int]
    for lit in clause:                   # [int]
        if fixedt[abs(lit)] == -1: unfixed, len = lit, len+1 # [int], [int]
        elif fixedt[abs(lit)] == int(lit>0): return -1, 0 # [tuple(int)]
    return len, unfixed                  # [tuple(int)]

def unfixed_vars(): return [var for var in vars[1:] if fixedt[var] == -1] # [list(int)]

nodecount = 0                            # [int]
if not solve_rec():                      # [int]
    print ''unsatisfiable'', nodecount     # [str], [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_31 [
	^ '
#class list:                              # unit: [int]*
#    def maonetuhcount(self):             # self: []
#        return 1                         # [int]
#
#    def __len__(self):                   # self: [list(int)]
#        return 1                         # [int]
#
#class int_:
#    def __repr__(self):                  # self: [int]
#        return ''''                        # [str]

puzzlecolumns = [1]
print puzzlecolumns.__len__()

'
]

{ #category : #resources }
PythonParserTests >> source_test_32 [
	^ '
def qbert(a):                            # a: [int]
    print a                              # [int]

a=1                                      # [int]
b=2                                      # [int]
qbert(1)                                 # []
qbert(2)                                 # []
qbert(a)                                 # []
qbert(b)                                 # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_33 [
	^ '
#a = 1                                    # [int]
#a = 1                                    # [int]
b = 1                                    # [int]
a = ''hoi''                                # [str]

print a                                  # [int, str]
print b                                  # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_36 [
	^ '
argv = ['''',''testdata/uuf250-010.cnf'']             # [list(str)]

def ffile(name):                          # name: [str]
    return [1]                           # [list(int)]

x = argv[0]                              # [str]
cnf = [y for y in ffile(x)]               # [list(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_37 [
	^ '
# (c) Mark Dufour
# --- mark.dufour@gmail.com

def _reduce(f, l, i=-1):                  # f: [lambda0], i: [int], l: [list(int)], r: [int]
    if not l:                            # [list(int)]
        if i != -1: return i             # [int]
        print ''*** ERROR! *** reduce() called with empty sequence and no initial value'' # [str]

    if i != -1:                          # [int]
        r = f(i, l[0])                   # [int]
    else:
        r = l[0]                         # [int]

    for i in range(len(l)-1):            # [int]
        r = f(r, l[i+1])                 # [int]

    return r                             # [int]

argv = ['''',''testdata/uuf250-010.cnf'']             # [list(str)]

# solver

cnf = [l.strip().split() for l in file(argv[1]) if l[0] not in ''c0%\n''] # [list(list(str))]
clauses = [[int(x) for x in l[:-1] if x != ''''] for l in cnf if l[0] != ''p''] # [list(list(int))]
nrofvars = [int(l[2]) for l in cnf if l[0] == ''p''][0] # [int]
vars = range(nrofvars+1)                 # [list(int)]
occurrence = [[] for l in 2*vars]
for clause in clauses:                   # [list(int)]
    for lit in clause: occurrence[lit].append(clause) # [int]
fixedt = [-1 for var in vars]            # [list(int)]

nodecount, propcount = 0, 0              # [int], [int]

def solve_rec():                         # la_mods: [list(int)], var: [int], prop_mods: [list(int)], choice: [int]*
    global nodecount
    nodecount += 1                       # []
    if nodecount == 100:
        return 1

    if not -1 in fixedt[1:]:             # [int]
        print ''v'', '' ''.join([str((2*fixedt[i]-1)*i) for i in range(1,nrofvars+1)]) # [list(str)]
        return 1                         # [int]

    la_mods = []                         # [list(int)]
    var = lookahead(la_mods)             # [int]
    #print ''select'', var                  # [str], [int]
    if not var: return backtrack(la_mods) # [int]

    for choice in [var,-var]:            # [int]
        prop_mods = []                   # [list(int)]
        if propagate(choice, prop_mods) and solve_rec(): return 1 # [int]
        backtrack(prop_mods)             # [int]

    return backtrack(la_mods)            # [int]

def propagate(lit, mods, failed_literal=0): # lit_truth: [int], current: [int], unfixed: [int]*, mods: [list(int)], clause: [list(int)], lit: [int]*, length: [int], failed_literal: [int]
    global bincount, propcount
    current = len(mods)                  # [int]
    mods.append(lit)                     # [None]
    #print ''prop'', lit                    # [str], [int]

    while 1:                             # [int]
        if fixedt[abs(lit)] == -1:       # [int]
            fixedt[abs(lit)] = int(lit>0)   # [int]
            propcount += 1               # []
            mask_propagate(lit)          # []

            for clause in occurrence[-lit]: # [list(int)]
                length, unfixed = info(clause) # [tuple(int)]

                if length == 0:          # [int]
                    #print ''dead'', lit    # [str], [int]
                    return 0             # [int]
                elif length == 1: mods.append(unfixed) # [None]
                elif length == 2:        # [int]
                    bincount += 1        # []
                    if failed_literal: mask_binclause(unfixed_lits(clause)) # []

        elif fixedt[abs(lit)] != int(lit>0): return 0 # [int]

        current += 1                     # []
        if current == len(mods): break   # [int]
        lit = mods[current]              # [int]

    return 1                             # [int]

def mask_propagate(lit):                 # lit: [int]
    global lit_mask, part_mask # XXX
    lit_mask[lit] |= part_mask           # []

def mask_binclause(lits):                # lit: [int], lits: [list(int)]
    global global_mask, lit_mask # XXX
    for lit in lits: global_mask |= lit_mask[-lit] # [int]

hoppa = 0xffffffff

def lookahead(mods):                     # mods: [list(int)], i: [int], u: [list(int)], var: [int], part: [list(int)]
    global global_mask, lit_mask, part_mask, some_failure

    global_mask = hoppa                # [int]
    lit_mask = [0 for var in range(2*(nrofvars+1))] # [list(int)]
    u = unfixed_vars()                   # [list(int)]

    parts = [u[(i*len(u))>>5:((i+1)*len(u))>>5] for i in range(32)] # [list(list(int))]
    masks = [1<<i for i in range(32)]    # [list(int)]

    some_failure = 0                     # [int]
    dif = [-1 for var in range(nrofvars+1)] # [list(int)]

    while global_mask != 0:              # [int]
        #print ''next iteration''           # [str]
        #print binstr(global_mask)        # [str]

        lit_mask = [m & (hoppa-global_mask) for m in lit_mask] # [list(int)]

        for i in range(32):              # [int]
            part, part_mask = parts[i], masks[i] # [list(int)], [int]

            if global_mask & part_mask == 0: # [int]
                #print ''skip'', part_mask  # [str], [int]
                continue
            global_mask &= (hoppa) ^ part_mask # []
            for var in part:             # [int]
                    if fixedt[var] == -1 and not lookahead_variable(var, mods, dif): return 0 # [int]

    if some_failure:                     # [int]
        #print ''final iteration''          # [str]
        dif = [-1 for var in range(nrofvars+1)] # [list(int)]
        for var in unfixed_vars():       # [int]
            if not lookahead_variable(var, mods, dif): # [int]
                 print ''error''           # [str]
    return dif.index(max(dif))           # [int]

def lookahead_variable(var, mods, dif):  # mods: [list(int)], dif: [list(int)], choice: [int]*, var: [int], prop: [int]
    global bincount, some_failure
    score = []                           # [list(int)]

    for choice in [var,-var]:            # [int]
        prop_mods = []                   # [list(int)]
        bincount = 0                     # [int]
        prop = propagate(choice, prop_mods) # [int]
        backtrack(prop_mods)             # [int]
        if not prop:                     # [int]
#            print ''failed literal'', choice
            some_failure = 1             # [int]
            if not propagate(-choice, mods, 1): return 0 # [int]
            break
        score.append(bincount)           # [None]

    dif[var] = _reduce(lambda x,y: 1024*x*y+x+y, score, 0) # [int]
    return 1                             # [int]

def backtrack(mods):                     # lit: [int], mods: [list(int)]
    for lit in mods: fixedt[abs(lit)] = -1 # [int]
    return 0                             # [int]

def info(clause):                        # lit: [int], clause: [list(int)], unfixed: [int], len: [int]
    len, unfixed = 0, 0                  # [int], [int]
    for lit in clause:                   # [int]
        if fixedt[abs(lit)] == -1: unfixed, len = lit, len+1 # [int], [int]
        elif fixedt[abs(lit)] == int(lit>0): return -1, 0 # [tuple(int)]
    return len, unfixed                  # [tuple(int)]

def unfixed_vars():
    return [var for var in range(1,nrofvars+1) if fixedt[var] == -1] # [list(int)]

def unfixed_lits(clause):                # lit: [int]*, clause: [list(int)], result: [list(int)]r
    result = []                          # [list(int)]
    for lit in clause:                   # [int]
        if fixedt[abs(lit)] == -1: result.append(lit) # [None]
    return result                        # [list(int)]

if not solve_rec():                      # [int]
    print ''unsatisfiable''                # [str]
print ''nodes'', nodecount, ''propagations'', propcount # [str], [int], [str], [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_38 [
	^ '
def hu(n, s=-1):                         # s: [int], n: [int]
    return [1]                           # [list(int)]

a = [i for i in hu(10)]                      # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_39 [
	^ '
import testdata.bert
from testdata.bert import hello, zeug
#from sets import Set

class jurk:
    pass

testdata.bert.hello(4)                            # []
hello(4)                                 # [str]

s2 = jurk()                              # [jurk()]

s4 = set()                               # [Set(float)]
s4.add(1.0)                              # []
s3 = set([1,2,3])                        # [Set(int)]

kn = testdata.bert.zeug()                         # [zeug()]
kn.hallo(4)                              # []

l1 = lambda x,y: x+y                     # [lambda0]
l2 = lambda x,y: x-y                     # [lambda0]
l5 = l2                                  # [lambda0]
l3 = lambda x,y: 1.0                     # [lambda1]
def l4(x, y): return x*y                 # [int]

def toepas(l):                           # l: [lambda0]
    return l(1,2)                        # [int]

print toepas(l1)                         # [int]
print toepas(l5)                         # [int]
print l3(1.0, ''hoi'')                     # [float]
a = l4                                   # [lambda0]
a(3,3)                                   # [int]
print toepas(a)                          # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_4 [
	^ '
a = [1]

'
]

{ #category : #resources }
PythonParserTests >> source_test_40 [
	^ 'def hu(n, s=-1):
    return [s]

a = hu(10)
c = [i for i in hu(10)]
'
]

{ #category : #resources }
PythonParserTests >> source_test_43 [
	^ '
def hoi():                               # dinges: [list(int)], bla: [list(int)]
    bla = [1,2]                          # [list(int)]
    dinges = [1,2]                       # [list(int)]
    jada = [1,2]                         # [list(int)]

    u = [x for x in bla]                 # [list(int)]
    v = [[a for a in bla] for c in dinges] # [list(list(int))]
    w = [[[a for a in jada] for c in bla] for d in dinges] # [list(list(list(int)))]

    print u                              # [list(int)]
    print v                              # [list(list(int))]
    print w                              # [list(list(list(int)))]

    return bla                           # [list(int)]
    return dinges                        # [list(int)]

print hoi()                              # [list(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_44 [
	^ '
#from sets import Set

a = set([1,2])                           # [Set(int)]
a.add(3)                                 # []
print a                                  # [Set(int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_45 [
	^ '
class bert:
    def __repr__(self):                  # self: []
        return ''bert''                    # [str]

y = None                                 # [None]
y = bert()                               # [bert()]

if y:                                    # [int]
    print y                            # [str]

z = None                                 # [None]
z = [1]                                  # [int]

if z:                                    # [int]
    print z                            # [str]

'
]

{ #category : #resources }
PythonParserTests >> source_test_46 [
	^ '
def hoi(a, b):                           # a: [int, str], b: [int]
    a                                    # [int, str]
    a = ''hoi''                            # [str]
    print a                              # [int, str]
hoi(''1'', 1)                                # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_5 [
	^ '
class fred:
    def speak(self, x):
        return x
b = fred()
c = b.speak(''goedzo!'')

'
]

{ #category : #resources }
PythonParserTests >> source_test_50 [
	^ '

a = []                                   # [list(int)]
a.append(1)                              # []

b = []                                   # [list(str)]
b.append(''1'')                            # []

c = []                                   # [list(list(int))]
c.append([1])                            # []

#d = []
#d.append(1)
#d.append(''1'')

'
]

{ #category : #resources }
PythonParserTests >> source_test_51 [
	^ '
import testdata.bert

class zeug:
    def meuk(self):                      # self: [zeug()]
        return ''2''                       # [str]

def hoi(): return 1                    # [float]


print hoi()                              # [float]
a = zeug()                               # [zeug()]

print testdata.bert.hello(1)                      # [str]
z = testdata.bert.zeug()                          # [bert::zeug()]
z.hallo(1)                               # [int]

print a.meuk()                           # [str]

l1 = lambda x,y: x+y                     # [lambda0]
print l1(1,2)                            # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_52 [
	^ '
#def hoi(a, b, c=1, d=1):                 # a: [int], b: [int], c: [int, float]r, d: [int]
#    print a, b, c, d                     # [int], [int], [int, float], [int]
#    return c                             # [int, float]
#
#
#hoi(1,2)                                 # [int]
#hoi(1,2,3)                               # [int]
#hoi(1,2,3,4)                             # [int]
#
#hoi(1,2,3.1)                             # [int, float]

def hoi(a, b, c=1, d=1):                 # a: [int], b: [int], c: [int, float]r, d: [int]
    print a, b, c, d                     # [int], [int], [int, float], [int]
    return c                             # [int, float]

hoi(1,2)                                 # [int]
hoi(1,2,3)                               # [int]
hoi(1,2,3,4)                             # [int]


'
]

{ #category : #resources }
PythonParserTests >> source_test_53 [
	^ '
def yoyo(a):                             # a: [int]
   print ''yoyo'', a                       # [str], [int]

def yoyoyo(b):                           # b: [int]
   print ''yoyoyo'', b                     # [str], [int]


x = yoyo                                 # [yoyo]
x = yoyoyo                               # [lambda0]
x(1)                                     # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_54 [
	^ '
import copy

class bert:
    pass

a = [1,2]                                # [list(int)]
b = copy.deepcopy(a)                     # [list(int)]

a[0] = 3

print a, b

'
]

{ #category : #resources }
PythonParserTests >> source_test_55 [
	^ '
a={}                                     # [dict(int->list(float))]
a.setdefault(1,[]).append(1.0)           # []

b= a[1]                                  # [list(float)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_56 [
	^ '
def hoi(a, b, e):                        # a: [int, float], b: [int, float], e: [int]
    c = a                                # [int, float]
    d = b                                # [int, float]
    f = 1                                # [int]
    g = 1                                # [int]
    h = f+g                              # [int]
    s = ''ho''+''i''                         # [str]
    return c+d                           # [int, float]


hoi(1, 2, 3)                             # [int]
hoi(1.0, 2.0, 4)                         # [float]

'
]

{ #category : #resources }
PythonParserTests >> source_test_59 [
	^ '
print ''hoi %d %s'' % (2, ''3'')             # [str]

print ''foo\0bar'' != ''foo\0baz''

'
]

{ #category : #resources }
PythonParserTests >> source_test_6 [
	^ '
def bla():
    return 8
a = bla()

'
]

{ #category : #resources }
PythonParserTests >> source_test_60 [
	^ '
#class evert:                             # __class__: [class evert]*
#    pass
#
#bla = evert()                            # [evert()]
#
#cl = bla.__class__                       # [class evert]
#
#print cl                                 # [class evert]
#print cl.__name__                        # [str]
#
#print type(bla)                          # [class evert]
#print type(bla).__name__                 # [str]
#
#if cl == type(evert()):                  # [int]
#   print ''equal!''                        # [str]
#
#if type(''2'') == type(''3''):               # [int]
#   print ''equal str!''                    # [str]
#
#if type(1) == type(''1''):                 # [int]
#   print ''equal non-equal!''              # [str]

'
]

{ #category : #resources }
PythonParserTests >> source_test_64 [
	^ '
def dupl(y):                             # y: [list(int)]
    k = []                               # [list(float)]
    k.append(1.0)                        # []

a = []                                   # [list(int)]
a = []                                   # [list(int)]
a.append(1)                              # []
dupl(a)                                  # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_69 [
	^ '
def ident(x):                            # x: [list(pyobj)]r
    return x                             # [list(pyobj)]

ah = []                                  # [list(pyobj)]
#ident(ah).append(1)                      # []
ident(ah).append(1.0)                    # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_7 [
	^ '
def bwa():
    d = ''hoi''
    return d
a = bwa()

'
]

{ #category : #resources }
PythonParserTests >> source_test_71 [
	^ '
a = (1,)                                # [tuple(int)]
b = [a]                                  # [list(tuple(int))]

c = [1]                                  # [list(int)]
e = [1.0]                                # [list(float)]

d = [c]                                  # [list(list(int))]
f = [e]                                  # [list(list(float))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_75 [
	^ '
a = [1,2,3,4]                            # [list(int)]
b = [1.0]                                # [list(float)]
#c = [1,2,2.0]                            # [list(pyobj)]

d = [(1,)]                               # [list(tuple(int))]

e = [[1, 2],[2, 3, 4]]                   # [list(list(int))]

#f = [[1, 2.0],[2, 3, 4]]                 # [list(list(pyobj))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_76 [
	^ '
cnf = [''''.split()]                       # [list()]

'
]

{ #category : #resources }
PythonParserTests >> source_test_77 [
	^ '
u = ['' p  o'', ''c o '']                    # [list(str)]
cnf = [x.strip().split() for x in u if not x.startswith(''x'')] # [list(list(str))]
cnf2 = [[3] for x in u]                  # [list(list(int))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_78 [
	^ '
cnf = [''8'']                               # [list(str)]

for x in cnf:                            # [list(str)]
    d = int(x)                               # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_79 [
	^ '
nrofvars = [1][0]
vars = range(nrofvars+1)

'
]

{ #category : #resources }
PythonParserTests >> source_test_8 [
	^ '
def aap(y):
    return y
def hap(y):
    return y
x = aap(1)
y = hap(1.0)

'
]

{ #category : #resources }
PythonParserTests >> source_test_81 [
	^ '
def _reduce(f, l, i=-1):                  # f: [lambda0], l: [list(int)], i: [int]r
    if not l:                            # [list(int)]
        if i != -1: return i             # [int]
        print ''*** ERROR! *** reduce() called with empty sequence and no initial value'' # [str]

    if i != -1:                          # [int]
        r = f(i, l[0])                   # [int]
    else:
        r = l[0]                         # [int]

    for i in range(len(l)-1):            # [list(int)]
        r = f(r, l[i+1])                 # [int]

    return r                             # [int]

acc = lambda x,y: x+y                    # [lambda0]
score = [1,2,3,4]                        # [list(int)]

print _reduce(acc, score, 0)              # [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_82 [
	^ '
vars = [1]                               # [list(int)]

def bla():
    return [var for var in vars]                # []

a = bla()                                    # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_83 [
	^ '
def propagate(lit):                      # lit: [int]
    global lit_mask # XXX
    lit_mask[lit] |= 1                   # [int]

def lookahead():                     # mods: [list(int)]
    global lit_mask
    lit_mask = [1]

lookahead()
propagate(0)

'
]

{ #category : #resources }
PythonParserTests >> source_test_84 [
	^ '
def solve_rec():
    la_mods = [1]                        # [list(int)]
    for var in la_mods:                  # [list(int)]
        lookahead_variable(var, la_mods)      # []
        propagate(var, la_mods)          # []

def propagate(lit, mods, bla=0):         # lit: [int], mods: [list(int)], bla: [int]
    pass

def lookahead_variable(var, mods):       # var: [int], mods: [list(int)]
    propagate(10, mods)                  # []

solve_rec()                              # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_86 [
	^ '
def row_perm_rec():
    hoppa_row = []                       # [list(str)]

    new_row = ['''']                   # [list(str)]

    a = hoppa_row                        # [list(str)]

    new_row.extend(a)                # []
    hoppa_row = new_row[:]
    hoppa_row.append(''u'')                # []

    return hoppa_row

numbers = [1]                            # [list(int)]
numberscopy = numbers[:]                 # [list(int)]

s = row_perm_rec()                       # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_88 [
	^ '
a = [[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[0],[1],[2],[3],[4],[5],[6],[7],[8],[9]]
c = a[0]                                 # [list(int)]
c.append(1)                              # []

b = [['''']]                               # [list(list(str))]
d = b[0]                                 # [list(str)]
d.append('''')                             # []

'
]

{ #category : #resources }
PythonParserTests >> source_test_89 [
	^ '
f = {}                                   # [dict(float, int)]
f[1.0] = 1                               # [int]

g = {}                                   # [dict(int, float)]
g[1] = 1.0                               # [float]

e = {}                                   # [dict(int, float)]
e[4] = 1.0                               # [float]


'
]

{ #category : #resources }
PythonParserTests >> source_test_9 [
	^ '
class fred:
    def __add__(self, x):                # [fred], [fred]
        return x                         # [int]

a = fred()                               # [fred] = [fred]
b = a + a                                # [int] = [int]

'
]

{ #category : #resources }
PythonParserTests >> source_test_93 [
	^ '
range(4)                                 # [list(int)]

a = {}                                   # [dict(int, float)]
a[4] = 1.0                               # [float]
x = a.items()                                # [list(tuple(int))]

bert = (1,2,3)                           # [tuple(int)]
hans = (1.0,2.0,3.0)                     # [tuple(float)]

bert_list = [bert]                       # [list(tuple(int))]
hans_list = [hans]                       # [list(tuple(float))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_94 [
	^ '
t = (1, 2.0)                             # [tuple2(int, float)]
a = t[0]                                     # [int]
b = t[1]                                     # [float]

l = [(1, 2.0)]                           # [list(tuple2(int, float))]
aha = l[0]                               # [tuple2(int, float)]

c = aha[0]                                   # [int]
d = aha[1]                                   # [float]

for e,f in l:
    pass

'
]

{ #category : #resources }
PythonParserTests >> source_test_95 [
	^ '
l = [(1,2.0),(2,4.0)]                    # [list(tuple2(int, float))]
m = [(bh, ah) for (ah, bh) in l]         # [list(tuple2(float, int))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_97 [
	^ '
print [(2*a, b) for a in range(4) if a > 0 for b in [''1'',''2'']] # [list(tuple2(int, str))]

'
]

{ #category : #resources }
PythonParserTests >> source_test_98 [
	^ '
def best_move(xx):                       # xx: [int]
    return (0, 0), 0                     # [tuple2(tuple2(int, int), int)]

a, b = best_move(1)                      # [tuple2(tuple2(int, int), int)]

'
]

{ #category : #resources }
PythonParserTests >> source_test_99 [
	^ '
# (c) Mark Dufour, Haifang Ni
# --- mark.dufour@gmail.com

empty, black, white = 0, 1, -1           # [int], [int], [int]

board = [[empty for x in range(8)] for y in range(8)] # [list(list(int))]
board[3][3] = board[4][4] = white        # [int]
board[3][4] = board[4][3] = black        # [int]

player, depth = {white: ''human'', black: ''lalaoth''}, 3 # [dict(int, str)], [int]

def possible_move(board, x, y, color):   # board: [list(list(int))], x: [int], y: [int], color: [int]
    if board[x][y] != empty:             # [int]
        return False                     # [int]
    for direction in [(1, 1), (-1, 1), (0, 1), (1, -1), (-1, -1), (0, -1), (1, 0), (-1, 0)]: # [list(tuple2(int, int))]
        if flip_in_direction(board, x, y, direction, color): # [int]
            return True                  # [int]
    return False                         # [int]

def flip_in_direction(board, x, y, direction, color): # board: [list(list(int))], x: [int], y: [int], direction: [tuple2(int, int)], color: [int]
    other_color = False                  # [int]
    while True:                          # [int]
        x, y = x+direction[0], y+direction[1] # [int], [int]
        if x not in range(8) or y not in range(8): # [int]
            return False                 # [int]
        square = board[x][y]             # [int]
        if square == empty: return False # [int]
        if square != color: other_color = True # [int]
        else: return other_color         # [int]

def flip_stones(board, move, color):     # board: [list(list(int))], move: [tuple2(int, int)], color: [int]*
    global flips
    flips += 1                           # [int]
    for direction in [(1, 1), (-1, 1), (0, 1), (1, -1), (-1, -1), (0, -1), (1, 0), (-1, 0)]: # [list(tuple2(int, int))]
        if flip_in_direction(board, move[0], move[1], direction, color): # [int]
             x, y = move[0]+direction[0], move[1]+direction[1] # [int], [int]
             while board[x][y] != color: # [int]
               board[x][y] = color       # [int]
               x, y = x+direction[0], y+direction[1] # [int], [int]
    board[move[0]][move[1]] = color      # [int]

#def print_board(board, turn):            # board: [], turn: []
#    for line in board:                   # []
#        print '' ''.join([{white: ''O'', black: ''X'', empty: ''.''}[square] for square in line]) # []
#    print ''turn:'', player[turn]          # [], []
#    print ''black:'', stone_count(board, black), ''white:'', stone_count(board, white) # [], [], [], []

def possible_moves(board, color):        # board: [list(list(int))], color: [int]
    return [(x,y) for x in range(8) for y in range(8) if possible_move(board, x, y, color)] # [list(tuple2(int, int))]
#def coordinates(move):                   # move: []
#    return (int(move[1])-1, ''abcdefgh''.index(move[0])) # []
def stone_count(board, color):           # board: [list(list(int))], color: [int]
    return sum([len([square for square in line if square == color]) for line in board]) # [list(int)]
#def human_move(move):                    # move: []
#    return ''abcdefgh''[move[0]]+str(move[1]+1) # []

def best_move(board, color, first, step=1): # board: [list(list(int))], color: [int]*, first: [int], step: [int]
    max_move, max_mobility, max_score = None, 0, 0 # [none], [int], [int]
    #print ''possible'', possible_moves(board, color) # [str], [list(tuple2(int, int))]

    for move in possible_moves(board, color): # [list(tuple2(int, int))]
        #print ''board before''             # [str]
        #print_board(board, color)        # []

        #print ''move'', move               # [str], [tuple2(int, int)]
        if move in [(0,0),(0,7),(7,0),(7,7)]:      # [list(tuple2(int, int))]
            mobility, score = 64, 64     # [int], [int]
            if color != first:           # [int]
                mobility = 64-mobility   # [int]
        else:
            testboard = [[square for square in line] for line in board] # [list(list(int))]
            flip_stones(testboard, move, color) # []
            #print_board(testboard, color) # []

            if step < depth:             # [int]
                #print ''deeper''           # [str]
                next_move, mobility = best_move(testboard, -color, first, step+1) # [tuple2(tuple2(int, int), int)]
            else:
                #print ''mobility''         # [str]
                mobility = len(possible_moves(testboard, first)) # [int]
            score = mobility             # [int]
            if color != first:           # [int]
                score = 64-score         # [int]
        if score >= max_score:           # []
            max_move, max_mobility, max_score = move, mobility, score # [tuple2(int, int)], [int], [int]

    #print ''done''                         # [str]
    return max_move, max_mobility        # [tuple2(tuple2(int, int), int)]

flips = 0                                # [int]
steps = 0                                # [int]
turn = black                             # [int]
while possible_moves(board, black) or possible_moves(board, white): # [list(tuple2(int, int))]
    if possible_moves(board, turn):      # [list(tuple2(int, int))]
        #print_board(board, turn)         # []
        #print ''flips'', flips             # [str], [int]
#        steps += 1                       # [int]
#        if steps > 5:                    # [int]
#            break

        #if turn == black:                # [int]
        move, mobility = best_move(board, turn, turn) # [tuple2(tuple2(int, int), int)]
        #else:
        #    move = coordinates(raw_input()) # [tuple2(int, int)]
        if not possible_move(board, move[0], move[1], turn): # [int]
            print ''impossible!''          # [str]
            turn = -turn                 # [int]
        else:
            flip_stones(board, move, turn) # []
    turn = -turn                         # [int]

#print_board(board, turn)
print ''flips'', flips                     # [str], [int]

if stone_count(board, black) == stone_count(board, white): # [int]
    print ''draw!''                        # [str]
else:
    if stone_count(board, black) > stone_count(board, white): print player[black], ''wins!'' # [str], [str]
    else: print player[white], ''wins!''   # [str], [str]

'
]

{ #category : #resources }
PythonParserTests >> source_test_run [
	^ '#!/usr/bin/env python
import traceback
import sys
import os
import time
import subprocess
import glob
import os.path
import functools
import itertools
from difflib import unified_diff
from multiprocessing import Pool
from multiprocessing.pool import IMapIterator


#Fix for multiprocessing. Without this, Ctrl+C will not kill the process immediately
set_timeout_decorator = lambda func: lambda self: func(self, timeout=1e100)
IMapIterator.next = set_timeout_decorator(IMapIterator.next)


if os.path.exists(''../shedskin/__init__.py''):
    SS = ''../shedskin/__init__.py''
else:
    SS = ''../../shedskin/__init__.py''


def usage():
    print "''-l'': give individual test numbers"
    print "''-r'': reverse test order"
    print "''-f'': break after first failure"
    print "''-e'': run extension module tests"
    print "''-n'': normal tests as extension modules"
    print "''-x'': run error/warning message tests"
    print "''-p'': run the tests in parallel"
    sys.exit()


def parse_options():
    args, options = [], set()
    for arg in sys.argv[1:]:
        if arg.startswith(''-''):
            options.update(arg[1:])
        else:
            args.append(int(arg))
    return args, options


def test_numbers(args, options):
    if ''l'' in options:
        tests = args

    elif len(args) == 1:
        tests = [args[0]]
    elif len(args) == 2:
        if args[0] > args[1]:
            args[0], args[1] = args[1], args[0]
            options.add(''r'')
        tests = range(args[0], args[1])
    else:
        tests = sorted([int(os.path.splitext(f)[0]) for f in glob.glob(''*.py'') if f != ''run.py''])

    if ''r'' in options:
        tests.reverse()

    return tests


def tests(args, options):
    parallel = ''p'' in options
    msvc = ''v'' in options
    partial_run_test = functools.partial(run_test, msvc=msvc, options=options)
    tests = [test for test in test_numbers(args, options)
             if os.path.exists(''%d.py'' % test)]
    failures = []
    imap = Pool().imap if parallel else itertools.imap

    for result in imap(partial_run_test, tests):
        if result is not None:
            failures.append(result)
            if ''f'' in options:
                break

    return failures


def main():
    args, options = parse_options()
    if ''h'' in options:
        usage()

    if ''e'' in options:
        failures = extmod_tests(args, options)
    elif ''x''in options:
        failures = error_tests(args, options)
    else:
        failures = tests(args, options)

    if not failures:
        print ''*** no failures, yay!''
    else:
        print ''*** tests failed:'', len(failures)
        print failures


def run_test(test, msvc, options):
    parallel = ''p'' in options
    show_output = not parallel

    print ''*** test:'', test
    with open(os.devnull, "w") as fnull:
        if show_output:
            fnull = None
        execute = functools.partial(subprocess.call, stdout=fnull, stderr=fnull, shell=True)
        t0 = time.time()
        try:
            if msvc:
                assert execute(''python %s -v %d'' % (SS, test)) == 0
            elif ''n'' in options:
                assert execute(''python %s -e -m Makefile.%d %d'' % (SS, test, test)) == 0
            else:
                assert execute(''python %s -m Makefile.%d %d'' % (SS, test, test)) == 0
            if msvc:
                assert execute(''nmake /C /S clean'') == 0
                assert execute(''nmake /C /S'') == 0
                command = ''.\\%d'' % test
            else:
                assert execute(''make clean -f Makefile.%d'' % test) == 0
                assert execute(''make -f Makefile.%d'' % test) == 0
                if sys.platform == ''win32'':
                    command = ''%d'' % test
                else:
                    command = ''./%d'' % test
            if ''n'' in options:
                if test not in [136, 154, 163, 191, 196, 197, 198]:  # sys.exit
                    assert execute(''python -c "__import__(str(%d))"'' % test) == 0
            else:
                check_output(command, ''python %d.py'' % test)
            print ''*** success: %d (%.2f)'' % (test, time.time() - t0)
        except AssertionError:
            print ''*** failure:'', test
            traceback.print_exc()
            return test


def extmod_tests(args, options):
    failures = []
    tests = sorted([int(t[1:]) for t in glob.glob(''e*'') if t[1:].isdigit()])
    for test in tests:
        print ''*** test:'', test
        os.chdir(''e%d'' % test)
        try:
            extmod = file(''main.py'').next()[1:].strip()
            assert os.system(''python ../%s -e %s'' % (SS, extmod)) == 0
            assert os.system(''make'') == 0
            native_output = get_output(''python main.py'')
            if sys.platform == ''win32'':
                ext = ''.pyd''
            else:
                ext = ''.so''
            assert os.system(''rm %s'' % (extmod + ext)) == 0
            cpython_output = get_output(''python main.py'')
            if native_output != cpython_output:
                print ''diff:''
                print generate_diff(native_output, cpython_output)
                raise AssertionError
            print ''*** success:'', test
        except AssertionError:
            print ''*** failure:'', test
            failures.append(test)
        os.chdir(''..'')
    return failures


def error_tests(args, options):
    failures = []
    os.chdir(''errs'')
    tests = sorted([int(t[:-3]) for t in glob.glob(''*.py'') if t[:-3].isdigit()])
    for test in tests:
        print ''*** test:'', test
        try:
            checks = []
            for line in file(''%d.py'' % test):
                if line.startswith(''#*''):
                    checks.append(line[1:].strip())
            output = get_output(''python ../%s %d 2>&1'' % (SS, test))
            assert not [l for l in output if ''Traceback'' in l]
            for check in checks:
                print check
                assert [l for l in output if l.startswith(check)]
            print ''*** success:'', test
        except AssertionError:
            print ''*** failure:'', test
            failures.append(test)
    os.chdir(''..'')
    return failures


def get_output(command):
    com = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE).stdout
    output = com.readlines()
    com.close()
    return output


def check_output(command, command2):
    native_output = get_output(command)
    cpython_output = get_output(command2)
    if native_output != cpython_output:
        print ''diff:''
        print generate_diff(native_output, cpython_output)
        raise AssertionError


def generate_diff(native_output, cpython_output):
    return ''''.join(unified_diff(native_output, cpython_output, lineterm="\n"))

if __name__ == ''__main__'':
    main()
'
]

{ #category : #resources }
PythonParserTests >> source_testlex [
	^ '# testlex.py

import unittest
try:
    import StringIO
except ImportError:
    import io as StringIO

import sys
import os
import imp
import warnings

sys.path.insert(0,"..")
sys.tracebacklimit = 0

import ply.lex

def make_pymodule_path(filename):
    path = os.path.dirname(filename)
    file = os.path.basename(filename)
    mod, ext = os.path.splitext(file)

    if sys.hexversion >= 0x3020000:
        modname = mod+"."+imp.get_tag()+ext
        fullpath = os.path.join(path,''__pycache__'',modname)
    else:
        fullpath = filename
    return fullpath

def pymodule_out_exists(filename):
    return os.path.exists(make_pymodule_path(filename))

def pymodule_out_remove(filename):
    os.remove(make_pymodule_path(filename))

def check_expected(result,expected):
    if sys.version_info[0] >= 3:
        if isinstance(result,str):
            result = result.encode(''ascii'')
        if isinstance(expected,str):
            expected = expected.encode(''ascii'')
    resultlines = result.splitlines()
    expectedlines = expected.splitlines()


    if len(resultlines) != len(expectedlines):
        return False

    for rline,eline in zip(resultlines,expectedlines):
        if not rline.endswith(eline):
            return False
    return True

def run_import(module):
    code = "import "+module
    exec(code)
    del sys.modules[module]
    
# Tests related to errors and warnings when building lexers
class LexErrorWarningTests(unittest.TestCase):
    def setUp(self):
        sys.stderr = StringIO.StringIO()
        sys.stdout = StringIO.StringIO()
        if sys.hexversion >= 0x3020000:
            warnings.filterwarnings(''ignore'',category=ResourceWarning)

    def tearDown(self):
        sys.stderr = sys.__stderr__
        sys.stdout = sys.__stdout__
    def test_lex_doc1(self):
        self.assertRaises(SyntaxError,run_import,"lex_doc1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                              "lex_doc1.py:18: No regular expression defined for rule ''t_NUMBER''\n"))
    def test_lex_dup1(self):
        self.assertRaises(SyntaxError,run_import,"lex_dup1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_dup1.py:20: Rule t_NUMBER redefined. Previously defined on line 18\n" ))        
        
    def test_lex_dup2(self):
        self.assertRaises(SyntaxError,run_import,"lex_dup2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_dup2.py:22: Rule t_NUMBER redefined. Previously defined on line 18\n" ))
            
    def test_lex_dup3(self):
        self.assertRaises(SyntaxError,run_import,"lex_dup3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_dup3.py:20: Rule t_NUMBER redefined. Previously defined on line 18\n" ))

    def test_lex_empty(self):
        self.assertRaises(SyntaxError,run_import,"lex_empty")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "No rules of the form t_rulename are defined\n"
                                    "No rules defined for state ''INITIAL''\n"))

    def test_lex_error1(self):
        run_import("lex_error1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "No t_error rule is defined\n"))

    def test_lex_error2(self):
        self.assertRaises(SyntaxError,run_import,"lex_error2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Rule ''t_error'' must be defined as a function\n")
                     )

    def test_lex_error3(self):
        self.assertRaises(SyntaxError,run_import,"lex_error3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_error3.py:20: Rule ''t_error'' requires an argument\n"))

    def test_lex_error4(self):
        self.assertRaises(SyntaxError,run_import,"lex_error4")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_error4.py:20: Rule ''t_error'' has too many arguments\n"))

    def test_lex_ignore(self):
        self.assertRaises(SyntaxError,run_import,"lex_ignore")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_ignore.py:20: Rule ''t_ignore'' must be defined as a string\n"))

    def test_lex_ignore2(self):
        run_import("lex_ignore2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "t_ignore contains a literal backslash ''\\''\n"))


    def test_lex_re1(self):
        self.assertRaises(SyntaxError,run_import,"lex_re1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Invalid regular expression for rule ''t_NUMBER''. unbalanced parenthesis\n"))

    def test_lex_re2(self):
        self.assertRaises(SyntaxError,run_import,"lex_re2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Regular expression for rule ''t_PLUS'' matches empty string\n"))

    def test_lex_re3(self):
        self.assertRaises(SyntaxError,run_import,"lex_re3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Invalid regular expression for rule ''t_POUND''. unbalanced parenthesis\n"
                                    "Make sure ''#'' in rule ''t_POUND'' is escaped with ''\\#''\n"))

    def test_lex_rule1(self):
        self.assertRaises(SyntaxError,run_import,"lex_rule1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "t_NUMBER not defined as a function or string\n"))

    def test_lex_rule2(self):
        self.assertRaises(SyntaxError,run_import,"lex_rule2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_rule2.py:18: Rule ''t_NUMBER'' requires an argument\n"))

    def test_lex_rule3(self):
        self.assertRaises(SyntaxError,run_import,"lex_rule3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "lex_rule3.py:18: Rule ''t_NUMBER'' has too many arguments\n"))


    def test_lex_state1(self):
        self.assertRaises(SyntaxError,run_import,"lex_state1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                   "states must be defined as a tuple or list\n"))

    def test_lex_state2(self):
        self.assertRaises(SyntaxError,run_import,"lex_state2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Invalid state specifier ''comment''. Must be a tuple (statename,''exclusive|inclusive'')\n"
                                    "Invalid state specifier ''example''. Must be a tuple (statename,''exclusive|inclusive'')\n"))

    def test_lex_state3(self):
        self.assertRaises(SyntaxError,run_import,"lex_state3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "State name 1 must be a string\n"
                                    "No rules defined for state ''example''\n"))

    def test_lex_state4(self):
        self.assertRaises(SyntaxError,run_import,"lex_state4")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "State type for state comment must be ''inclusive'' or ''exclusive''\n"))


    def test_lex_state5(self):
        self.assertRaises(SyntaxError,run_import,"lex_state5")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "State ''comment'' already defined\n"))

    def test_lex_state_noerror(self):
        run_import("lex_state_noerror")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "No error rule is defined for exclusive state ''comment''\n"))    

    def test_lex_state_norule(self):
        self.assertRaises(SyntaxError,run_import,"lex_state_norule")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "No rules defined for state ''example''\n"))

    def test_lex_token1(self):
        self.assertRaises(SyntaxError,run_import,"lex_token1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "No token list is defined\n"
                                    "Rule ''t_NUMBER'' defined for an unspecified token NUMBER\n"
                                    "Rule ''t_PLUS'' defined for an unspecified token PLUS\n"
                                    "Rule ''t_MINUS'' defined for an unspecified token MINUS\n"
))

    def test_lex_token2(self):
        self.assertRaises(SyntaxError,run_import,"lex_token2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "tokens must be a list or tuple\n"
                                    "Rule ''t_NUMBER'' defined for an unspecified token NUMBER\n"
                                    "Rule ''t_PLUS'' defined for an unspecified token PLUS\n"
                                    "Rule ''t_MINUS'' defined for an unspecified token MINUS\n"
))
    
    def test_lex_token3(self):
        self.assertRaises(SyntaxError,run_import,"lex_token3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Rule ''t_MINUS'' defined for an unspecified token MINUS\n"))


    def test_lex_token4(self):
        self.assertRaises(SyntaxError,run_import,"lex_token4")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Bad token name ''-''\n"))


    def test_lex_token5(self):
        try:
            run_import("lex_token5")
        except ply.lex.LexError:
            e = sys.exc_info()[1]
        self.assert_(check_expected(str(e),"lex_token5.py:19: Rule ''t_NUMBER'' returned an unknown token type ''NUM''"))

    def test_lex_token_dup(self):
        run_import("lex_token_dup")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Token ''MINUS'' multiply defined\n"))   

        
    def test_lex_literal1(self):
        self.assertRaises(SyntaxError,run_import,"lex_literal1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Invalid literal ''**''. Must be a single character\n"))

    def test_lex_literal2(self):
        self.assertRaises(SyntaxError,run_import,"lex_literal2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Invalid literals specification. literals must be a sequence of characters\n"))

import os
import subprocess
import shutil

# Tests related to various build options associated with lexers
class LexBuildOptionTests(unittest.TestCase):
    def setUp(self):
        sys.stderr = StringIO.StringIO()
        sys.stdout = StringIO.StringIO()
    def tearDown(self):
        sys.stderr = sys.__stderr__
        sys.stdout = sys.__stdout__
        try:
            shutil.rmtree("lexdir")
        except OSError:
            pass

    def test_lex_module(self):
        run_import("lex_module")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        
    def test_lex_object(self):
        run_import("lex_object")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))

    def test_lex_closure(self):
        run_import("lex_closure")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
    def test_lex_optimize(self):
        try:
            os.remove("lextab.py")
        except OSError:
            pass
        try:
            os.remove("lextab.pyc")
        except OSError:
            pass
        try:
            os.remove("lextab.pyo")
        except OSError:
            pass
        run_import("lex_optimize")

        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(os.path.exists("lextab.py"))


        p = subprocess.Popen([sys.executable,''-O'',''lex_optimize.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()

        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("lextab.pyo"))

        pymodule_out_remove("lextab.pyo")
        p = subprocess.Popen([sys.executable,''-OO'',''lex_optimize.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("lextab.pyo"))
        try:
            os.remove("lextab.py")
        except OSError:
            pass
        try:
            pymodule_out_remove("lextab.pyc")
        except OSError:
            pass
        try:
            pymodule_out_remove("lextab.pyo")
        except OSError:
            pass

    def test_lex_optimize2(self):
        try:
            os.remove("opt2tab.py")
        except OSError:
            pass
        try:
            os.remove("opt2tab.pyc")
        except OSError:
            pass
        try:
            os.remove("opt2tab.pyo")
        except OSError:
            pass
        run_import("lex_optimize2")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(os.path.exists("opt2tab.py"))

        p = subprocess.Popen([sys.executable,''-O'',''lex_optimize2.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("opt2tab.pyo"))
        pymodule_out_remove("opt2tab.pyo")
        p = subprocess.Popen([sys.executable,''-OO'',''lex_optimize2.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("opt2tab.pyo"))
        try:
            os.remove("opt2tab.py")
        except OSError:
            pass
        try:
            pymodule_out_remove("opt2tab.pyc")
        except OSError:
            pass
        try:
            pymodule_out_remove("opt2tab.pyo")
        except OSError:
            pass

    def test_lex_optimize3(self):
        try:
            shutil.rmtree("lexdir")
        except OSError:
            pass
        
        os.mkdir("lexdir")
        os.mkdir("lexdir/sub")
        open("lexdir/__init__.py","w").write("")
        open("lexdir/sub/__init__.py","w").write("")
        run_import("lex_optimize3")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(os.path.exists("lexdir/sub/calctab.py"))

        p = subprocess.Popen([sys.executable,''-O'',''lex_optimize3.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("lexdir/sub/calctab.pyo"))
        pymodule_out_remove("lexdir/sub/calctab.pyo")
        p = subprocess.Popen([sys.executable,''-OO'',''lex_optimize3.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(PLUS,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("lexdir/sub/calctab.pyo"))
        try:
            shutil.rmtree("lexdir")
        except OSError:
            pass

    def test_lex_opt_alias(self):
        try:
            os.remove("aliastab.py")
        except OSError:
            pass
        try:
            os.remove("aliastab.pyc")
        except OSError:
            pass
        try:
            os.remove("aliastab.pyo")
        except OSError:
            pass
        run_import("lex_opt_alias")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(+,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(os.path.exists("aliastab.py"))

        p = subprocess.Popen([sys.executable,''-O'',''lex_opt_alias.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(+,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("aliastab.pyo"))
        pymodule_out_remove("aliastab.pyo")
        p = subprocess.Popen([sys.executable,''-OO'',''lex_opt_alias.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(NUMBER,3,1,0)\n"
                                    "(+,''+'',1,1)\n"
                                    "(NUMBER,4,1,2)\n"))
        self.assert_(pymodule_out_exists("aliastab.pyo"))
        try:
            os.remove("aliastab.py")
        except OSError:
            pass
        try:
            pymodule_out_remove("aliastab.pyc")
        except OSError:
            pass
        try:
            pymodule_out_remove("aliastab.pyo")
        except OSError:
            pass

    def test_lex_many_tokens(self):
        try:
            os.remove("manytab.py")
        except OSError:
            pass
        try:
            os.remove("manytab.pyc")
        except OSError:
            pass
        try:
            os.remove("manytab.pyo")
        except OSError:
            pass
        run_import("lex_many_tokens")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(TOK34,''TOK34:'',1,0)\n"
                                    "(TOK143,''TOK143:'',1,7)\n"
                                    "(TOK269,''TOK269:'',1,15)\n"
                                    "(TOK372,''TOK372:'',1,23)\n"
                                    "(TOK452,''TOK452:'',1,31)\n"
                                    "(TOK561,''TOK561:'',1,39)\n"
                                    "(TOK999,''TOK999:'',1,47)\n"
                                    ))

        self.assert_(os.path.exists("manytab.py"))

        p = subprocess.Popen([sys.executable,''-O'',''lex_many_tokens.py''],
                             stdout=subprocess.PIPE)
        result = p.stdout.read()
        self.assert_(check_expected(result,
                                    "(TOK34,''TOK34:'',1,0)\n"
                                    "(TOK143,''TOK143:'',1,7)\n"
                                    "(TOK269,''TOK269:'',1,15)\n"
                                    "(TOK372,''TOK372:'',1,23)\n"
                                    "(TOK452,''TOK452:'',1,31)\n"
                                    "(TOK561,''TOK561:'',1,39)\n"
                                    "(TOK999,''TOK999:'',1,47)\n"
                                    ))

        self.assert_(pymodule_out_exists("manytab.pyo"))
        pymodule_out_remove("manytab.pyo")
        try:
            os.remove("manytab.py")
        except OSError:
            pass
        try:
            os.remove("manytab.pyc")
        except OSError:
            pass
        try:
            os.remove("manytab.pyo")
        except OSError:
            pass
        
# Tests related to run-time behavior of lexers
class LexRunTests(unittest.TestCase):
    def setUp(self):
        sys.stderr = StringIO.StringIO()
        sys.stdout = StringIO.StringIO()
    def tearDown(self):
        sys.stderr = sys.__stderr__
        sys.stdout = sys.__stdout__

    def test_lex_hedit(self):
        run_import("lex_hedit")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(H_EDIT_DESCRIPTOR,''abc'',1,0)\n"
                                    "(H_EDIT_DESCRIPTOR,''abcdefghij'',1,6)\n"
                                    "(H_EDIT_DESCRIPTOR,''xy'',1,20)\n"))
       
    def test_lex_state_try(self):
        run_import("lex_state_try")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "(NUMBER,''3'',1,0)\n"
                                    "(PLUS,''+'',1,2)\n"
                                    "(NUMBER,''4'',1,4)\n"
                                    "Entering comment state\n"
                                    "comment body LexToken(body_part,''This is a comment */'',1,9)\n"
                                    "(PLUS,''+'',1,30)\n"
                                    "(NUMBER,''10'',1,32)\n"
                                    ))    



unittest.main()
'
]

{ #category : #resources }
PythonParserTests >> source_testyacc [
	^ '# testyacc.py

import unittest
try:
    import StringIO
except ImportError:
    import io as StringIO

import sys
import os
import warnings

sys.path.insert(0,"..")
sys.tracebacklimit = 0

import ply.yacc
import imp

def make_pymodule_path(filename):
    path = os.path.dirname(filename)
    file = os.path.basename(filename)
    mod, ext = os.path.splitext(file)

    if sys.hexversion >= 0x3020000:
        modname = mod+"."+imp.get_tag()+ext
        fullpath = os.path.join(path,''__pycache__'',modname)
    else:
        fullpath = filename
    return fullpath

def pymodule_out_exists(filename):
    return os.path.exists(make_pymodule_path(filename))

def pymodule_out_remove(filename):
    os.remove(make_pymodule_path(filename))


def check_expected(result,expected):
    resultlines = []
    for line in result.splitlines():
        if line.startswith("WARNING: "):
            line = line[9:]
        elif line.startswith("ERROR: "):
            line = line[7:]
        resultlines.append(line)

    expectedlines = expected.splitlines()
    if len(resultlines) != len(expectedlines):
        return False
    for rline,eline in zip(resultlines,expectedlines):
        if not rline.endswith(eline):
            return False
    return True

def run_import(module):
    code = "import "+module
    exec(code)
    del sys.modules[module]
    
# Tests related to errors and warnings when building parsers
class YaccErrorWarningTests(unittest.TestCase):
    def setUp(self):
        sys.stderr = StringIO.StringIO()
        sys.stdout = StringIO.StringIO()
        try:
            os.remove("parsetab.py")
            pymodule_out_remove("parsetab.pyc")
        except OSError:
            pass
        
        if sys.hexversion >= 0x3020000:
            warnings.filterwarnings(''ignore'',category=ResourceWarning)

    def tearDown(self):
        sys.stderr = sys.__stderr__
        sys.stdout = sys.__stdout__
    def test_yacc_badargs(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_badargs")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_badargs.py:23: Rule ''p_statement_assign'' has too many arguments\n"
                                    "yacc_badargs.py:27: Rule ''p_statement_expr'' requires an argument\n"
                                    ))        
    def test_yacc_badid(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_badid")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_badid.py:32: Illegal name ''bad&rule'' in rule ''statement''\n"
                                    "yacc_badid.py:36: Illegal rule name ''bad&rule''\n"
                                    ))

    def test_yacc_badprec(self):
        try:
            run_import("yacc_badprec")
        except ply.yacc.YaccError:
            result = sys.stderr.getvalue()
            self.assert_(check_expected(result,
                                        "precedence must be a list or tuple\n"
                                        ))
    def test_yacc_badprec2(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_badprec2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Bad precedence table\n"
                                    ))

    def test_yacc_badprec3(self):
        run_import("yacc_badprec3")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Precedence already specified for terminal ''MINUS''\n"
                                    "Generating LALR tables\n"

                                    ))
        
    def test_yacc_badrule(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_badrule")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_badrule.py:24: Syntax error. Expected '':''\n"
                                    "yacc_badrule.py:28: Syntax error in rule ''statement''\n"
                                    "yacc_badrule.py:33: Syntax error. Expected '':''\n"
                                    "yacc_badrule.py:42: Syntax error. Expected '':''\n"
                                    ))

    def test_yacc_badtok(self):
        try:
            run_import("yacc_badtok")
        except ply.yacc.YaccError:
            result = sys.stderr.getvalue()
            self.assert_(check_expected(result,
                                        "tokens must be a list or tuple\n"))

    def test_yacc_dup(self):
        run_import("yacc_dup")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_dup.py:27: Function p_statement redefined. Previously defined on line 23\n"
                                    "Token ''EQUALS'' defined, but not used\n"
                                    "There is 1 unused token\n"
                                    "Generating LALR tables\n"

                                    ))
    def test_yacc_error1(self):
        try:
            run_import("yacc_error1")
        except ply.yacc.YaccError:
            result = sys.stderr.getvalue()
            self.assert_(check_expected(result,
                                        "yacc_error1.py:61: p_error() requires 1 argument\n"))

    def test_yacc_error2(self):
        try:
            run_import("yacc_error2")
        except ply.yacc.YaccError:
            result = sys.stderr.getvalue()
            self.assert_(check_expected(result,
                                        "yacc_error2.py:61: p_error() requires 1 argument\n"))

    def test_yacc_error3(self):
        try:
            run_import("yacc_error3")
        except ply.yacc.YaccError:
            e = sys.exc_info()[1]
            result = sys.stderr.getvalue()
            self.assert_(check_expected(result,
                                        "''p_error'' defined, but is not a function or method\n"))
            
    def test_yacc_error4(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_error4")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_error4.py:62: Illegal rule name ''error''. Already defined as a token\n"
                                    ))
        
    def test_yacc_inf(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_inf")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Token ''NUMBER'' defined, but not used\n"
                                    "There is 1 unused token\n"
                                    "Infinite recursion detected for symbol ''statement''\n"
                                    "Infinite recursion detected for symbol ''expression''\n"
                                    ))
    def test_yacc_literal(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_literal")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_literal.py:36: Literal token ''**'' in rule ''expression'' may only be a single character\n"
                                    ))
    def test_yacc_misplaced(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_misplaced")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_misplaced.py:32: Misplaced ''|''\n"
                                    ))

    def test_yacc_missing1(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_missing1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_missing1.py:24: Symbol ''location'' used, but not defined as a token or a rule\n"
                                    ))

    def test_yacc_nested(self):
        run_import("yacc_nested")
        result = sys.stdout.getvalue()
        self.assert_(check_expected(result,
                                    "A\n"
                                    "A\n"
                                    "A\n",
                                    ))

    def test_yacc_nodoc(self):
        run_import("yacc_nodoc")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_nodoc.py:27: No documentation string specified in function ''p_statement_expr'' (ignored)\n"
                                    "Generating LALR tables\n"
                                    ))

    def test_yacc_noerror(self):
        run_import("yacc_noerror")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "no p_error() function is defined\n"
                                    "Generating LALR tables\n"
                                    ))

    def test_yacc_nop(self):
        run_import("yacc_nop")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_nop.py:27: Possible grammar rule ''statement_expr'' defined without p_ prefix\n"
                                    "Generating LALR tables\n"
                                    ))

    def test_yacc_notfunc(self):
        run_import("yacc_notfunc")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "''p_statement_assign'' not defined as a function\n"
                                    "Token ''EQUALS'' defined, but not used\n"
                                    "There is 1 unused token\n"
                                    "Generating LALR tables\n"
                                    ))
    def test_yacc_notok(self):
        try:
            run_import("yacc_notok")
        except ply.yacc.YaccError:
            result = sys.stderr.getvalue()
            self.assert_(check_expected(result,
                                        "No token list is defined\n"))

    def test_yacc_rr(self):
        run_import("yacc_rr")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Generating LALR tables\n"
                                    "1 reduce/reduce conflict\n"
                                    "reduce/reduce conflict in state 15 resolved using rule (statement -> NAME EQUALS NUMBER)\n"
                                    "rejected rule (expression -> NUMBER) in state 15\n"

                                    ))

    def test_yacc_rr_unused(self):
        run_import("yacc_rr_unused")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "no p_error() function is defined\n"
                                    "Generating LALR tables\n"
                                    "3 reduce/reduce conflicts\n"
                                    "reduce/reduce conflict in state 1 resolved using rule (rule3 -> A)\n"
                                    "rejected rule (rule4 -> A) in state 1\n"
                                    "reduce/reduce conflict in state 1 resolved using rule (rule3 -> A)\n"
                                    "rejected rule (rule5 -> A) in state 1\n"
                                    "reduce/reduce conflict in state 1 resolved using rule (rule4 -> A)\n"
                                    "rejected rule (rule5 -> A) in state 1\n"
                                    "Rule (rule5 -> A) is never reduced\n"
                                    ))

    def test_yacc_simple(self):
        run_import("yacc_simple")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Generating LALR tables\n"
                                    ))
    def test_yacc_sr(self):
        run_import("yacc_sr")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Generating LALR tables\n"
                                    "20 shift/reduce conflicts\n"
                                    ))

    def test_yacc_term1(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_term1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_term1.py:24: Illegal rule name ''NUMBER''. Already defined as a token\n"
                                    ))

    def test_yacc_unused(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_unused")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_unused.py:62: Symbol ''COMMA'' used, but not defined as a token or a rule\n"
                                    "Symbol ''COMMA'' is unreachable\n"
                                    "Symbol ''exprlist'' is unreachable\n"
                                    ))
    def test_yacc_unused_rule(self):
        run_import("yacc_unused_rule")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_unused_rule.py:62: Rule ''integer'' defined, but not used\n"
                                    "There is 1 unused rule\n"
                                    "Symbol ''integer'' is unreachable\n"
                                    "Generating LALR tables\n"
                                    ))

    def test_yacc_uprec(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_uprec")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_uprec.py:37: Nothing known about the precedence of ''UMINUS''\n"
                                    ))

    def test_yacc_uprec2(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_uprec2")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "yacc_uprec2.py:37: Syntax error. Nothing follows %prec\n"
                                    ))

    def test_yacc_prec1(self):
        self.assertRaises(ply.yacc.YaccError,run_import,"yacc_prec1")
        result = sys.stderr.getvalue()
        self.assert_(check_expected(result,
                                    "Precedence rule ''left'' defined for unknown symbol ''+''\n"
                                    "Precedence rule ''left'' defined for unknown symbol ''*''\n"
                                    "Precedence rule ''left'' defined for unknown symbol ''-''\n"
                                    "Precedence rule ''left'' defined for unknown symbol ''/''\n"
                                    ))


            
unittest.main()
'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badargs [
	^ '# -----------------------------------------------------------------------------
# yacc_badargs.py
#
# Rules with wrong # args
# -----------------------------------------------------------------------------
import sys
sys.tracebacklimit = 0
sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t,s):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr():
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badid [
	^ '# -----------------------------------------------------------------------------
# yacc_badid.py
#
# Attempt to define a rule with a bad-identifier name
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_statement_expr2(t):
    ''statement : bad&rule''
    pass

def p_badrule(t):
    ''bad&rule : expression''
    pass


def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    pass

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badprec [
	^ '# -----------------------------------------------------------------------------
# yacc_badprec.py
#
# Bad precedence specifier
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = "blah"

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badprec2 [
	^ '# -----------------------------------------------------------------------------
# yacc_badprec2.py
#
# Bad precedence
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    42,
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badprec3 [
	^ '# -----------------------------------------------------------------------------
# yacc_badprec3.py
#
# Bad precedence
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE'',''MINUS''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[3] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badrule [
	^ '# -----------------------------------------------------------------------------
# yacc_badrule.py
#
# Syntax problems in the rule strings
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                   expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression: MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_badtok [
	^ '# -----------------------------------------------------------------------------
# yacc_badtok.py
#
# A grammar, but tokens is a bad datatype
# -----------------------------------------------------------------------------

import sys
if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

tokens = "Hello"

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_dup [
	^ '# -----------------------------------------------------------------------------
# yacc_dup.py
#
# Duplicated rule name
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_error1 [
	^ '# -----------------------------------------------------------------------------
# yacc_error1.py
#
# Bad p_error() function
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t,s):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_error2 [
	^ '# -----------------------------------------------------------------------------
# yacc_error2.py
#
# Bad p_error() function
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error():
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_error3 [
	^ '# -----------------------------------------------------------------------------
# yacc_error3.py
#
# Bad p_error() function
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

p_error = "blah"

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_error4 [
	^ '# -----------------------------------------------------------------------------
# yacc_error4.py
#
# Attempt to define a rule named ''error''
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error_handler(t):
    ''error : NAME''
    pass

def p_error(t):
    pass

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_inf [
	^ '# -----------------------------------------------------------------------------
# yacc_inf.py
#
# Infinite recursion
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_literal [
	^ '# -----------------------------------------------------------------------------
# yacc_literal.py
#
# Grammar with bad literal characters
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''+'',''-''),
    (''left'',''*'',''/''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression ''+'' expression
                  | expression ''-'' expression
                  | expression ''*'' expression
                  | expression ''/'' expression
                  | expression ''**'' expression ''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_misplaced [
	^ '# -----------------------------------------------------------------------------
# yacc_misplaced.py
#
# A misplaced | in grammar rules
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''           | expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_missing1 [
	^ '# -----------------------------------------------------------------------------
# yacc_missing1.py
#
# Grammar with a missing rule
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : location EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_nested [
	^ 'import sys

if ".." not in sys.path: sys.path.insert(0,"..")

from ply import lex, yacc

t_A = ''A''
t_B = ''B''
t_C = ''C''

tokens = (''A'', ''B'', ''C'')

the_lexer = lex.lex()

def t_error(t):
    pass

def p_error(p):
    pass

def p_start(t):
    ''''''start : A nest C''''''
    pass

def p_nest(t):
   ''''''nest : B''''''
   print(t[-1])

the_parser = yacc.yacc(debug = False, write_tables = False)

the_parser.parse(''ABC'', the_lexer)
the_parser.parse(''ABC'', the_lexer, tracking=True)
the_parser.parse(''ABC'', the_lexer, tracking=True, debug=1)
'
]

{ #category : #resources }
PythonParserTests >> source_yacc_nodoc [
	^ '# -----------------------------------------------------------------------------
# yacc_nodoc.py
#
# Rule with a missing doc-string
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_noerror [
	^ '# -----------------------------------------------------------------------------
# yacc_noerror.py
#
# No p_error() rule defined.
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0


yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_nop [
	^ '# -----------------------------------------------------------------------------
# yacc_nop.py
#
# Possible grammar rule defined without p_ prefix
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_notfunc [
	^ '# -----------------------------------------------------------------------------
# yacc_notfunc.py
#
# p_rule not defined as a function
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

p_statement_assign = "Blah"

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_notok [
	^ '# -----------------------------------------------------------------------------
# yacc_notok.py
#
# A grammar, but we forgot to import the tokens list
# -----------------------------------------------------------------------------

import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_prec1 [
	^ '# -----------------------------------------------------------------------------
# yacc_prec1.py
#
# Tests case where precedence specifier doesn''t match up to terminals
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''+'',''-''),
    (''left'',''*'',''/''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_rr [
	^ '# -----------------------------------------------------------------------------
# yacc_rr.py
#
# A grammar with a reduce/reduce conflict
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_assign_2(t):
    ''statement : NAME EQUALS NUMBER''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_rr_unused [
	^ '# -----------------------------------------------------------------------------
# yacc_rr_unused.py
#
# A grammar with reduce/reduce conflicts and a rule that never
# gets reduced.
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

tokens = (''A'', ''B'', ''C'')

def p_grammar(p):
   ''''''
   rule1 : rule2 B
         | rule2 C

   rule2 : rule3 B
         | rule4
         | rule5

   rule3 : A

   rule4 : A

   rule5 : A
   ''''''

yacc.yacc()
'
]

{ #category : #resources }
PythonParserTests >> source_yacc_simple [
	^ '# -----------------------------------------------------------------------------
# yacc_simple.py
#
# A simple, properly specifier grammar
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_sr [
	^ '# -----------------------------------------------------------------------------
# yacc_sr.py
#
# A grammar with shift-reduce conflicts
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_term1 [
	^ '# -----------------------------------------------------------------------------
# yacc_term1.py
#
# Terminal used on the left-hand-side
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''NUMBER : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_unused [
	^ '# -----------------------------------------------------------------------------
# yacc_unused.py
#
# A grammar with an unused rule
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_expr_list(t):
    ''exprlist : exprlist COMMA expression''
    pass

def p_expr_list_2(t):
    ''exprlist : expression''
    pass


def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_unused_rule [
	^ '# -----------------------------------------------------------------------------
# yacc_unused_rule.py
#
# Grammar with an unused rule
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules
precedence = (
    (''left'',''PLUS'',''MINUS''),
    (''left'',''TIMES'',''DIVIDE''),
    (''right'',''UMINUS''),
    )

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_integer(t):
    ''integer : NUMBER''
    t[0] = t[1]

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_uprec [
	^ '# -----------------------------------------------------------------------------
# yacc_uprec.py
#
# A grammar with a bad %prec specifier
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec UMINUS''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_yacc_uprec2 [
	^ '# -----------------------------------------------------------------------------
# yacc_uprec2.py
#
# A grammar with a bad %prec specifier
# -----------------------------------------------------------------------------
import sys

if ".." not in sys.path: sys.path.insert(0,"..")
import ply.yacc as yacc

from calclex import tokens

# Parsing rules

# dictionary of names
names = { }

def p_statement_assign(t):
    ''statement : NAME EQUALS expression''
    names[t[1]] = t[3]

def p_statement_expr(t):
    ''statement : expression''
    print(t[1])

def p_expression_binop(t):
    ''''''expression : expression PLUS expression
                  | expression MINUS expression
                  | expression TIMES expression
                  | expression DIVIDE expression''''''
    if t[2] == ''+''  : t[0] = t[1] + t[3]
    elif t[2] == ''-'': t[0] = t[1] - t[3]
    elif t[2] == ''*'': t[0] = t[1] * t[3]
    elif t[2] == ''/'': t[0] = t[1] / t[3]

def p_expression_uminus(t):
    ''expression : MINUS expression %prec''
    t[0] = -t[2]

def p_expression_group(t):
    ''expression : LPAREN expression RPAREN''
    t[0] = t[2]

def p_expression_number(t):
    ''expression : NUMBER''
    t[0] = t[1]

def p_expression_name(t):
    ''expression : NAME''
    try:
        t[0] = names[t[1]]
    except LookupError:
        print("Undefined name ''%s''" % t[1])
        t[0] = 0

def p_error(t):
    print("Syntax error at ''%s''" % t.value)

yacc.yacc()




'
]

{ #category : #resources }
PythonParserTests >> source_ylex [
	^ '# lexer for yacc-grammars
#
# Author: David Beazley (dave@dabeaz.com)
# Date  : October 2, 2006

import sys
sys.path.append("../..")

from ply import *

tokens = (
    ''LITERAL'',''SECTION'',''TOKEN'',''LEFT'',''RIGHT'',''PREC'',''START'',''TYPE'',''NONASSOC'',''UNION'',''CODE'',
    ''ID'',''QLITERAL'',''NUMBER'',
)

states = ((''code'',''exclusive''),)

literals = [ '';'', '','', ''<'', ''>'', ''|'','':'' ]
t_ignore = '' \t''

t_TOKEN     = r''%token''
t_LEFT      = r''%left''
t_RIGHT     = r''%right''
t_NONASSOC  = r''%nonassoc''
t_PREC      = r''%prec''
t_START     = r''%start''
t_TYPE      = r''%type''
t_UNION     = r''%union''
t_ID        = r''[a-zA-Z_][a-zA-Z_0-9]*''
t_QLITERAL  = r''''''(?P<quote>[''"]).*?(?P=quote)''''''
t_NUMBER    = r''\d+''

def t_SECTION(t):
    r''%%''
    if getattr(t.lexer,"lastsection",0):
         t.value = t.lexer.lexdata[t.lexpos+2:]
         t.lexer.lexpos = len(t.lexer.lexdata)
    else:
         t.lexer.lastsection = 0
    return t

# Comments
def t_ccomment(t):
    r''/\*(.|\n)*?\*/''
    t.lexer.lineno += t.value.count(''\n'')

t_ignore_cppcomment = r''//.*''

def t_LITERAL(t):
   r''%\{(.|\n)*?%\}''
   t.lexer.lineno += t.value.count("\n")
   return t

def t_NEWLINE(t):
   r''\n''
   t.lexer.lineno += 1

def t_code(t):
   r''\{''
   t.lexer.codestart = t.lexpos
   t.lexer.level = 1
   t.lexer.begin(''code'')

def t_code_ignore_string(t):
    r''\"([^\\\n]|(\\.))*?\"''

def t_code_ignore_char(t):
    r''\''([^\\\n]|(\\.))*?\''''

def t_code_ignore_comment(t):
   r''/\*(.|\n)*?\*/''

def t_code_ignore_cppcom(t):
   r''//.*''

def t_code_lbrace(t):
    r''\{''
    t.lexer.level += 1

def t_code_rbrace(t):
    r''\}''
    t.lexer.level -= 1
    if t.lexer.level == 0:
         t.type = ''CODE''
         t.value = t.lexer.lexdata[t.lexer.codestart:t.lexpos+1]
         t.lexer.begin(''INITIAL'')
         t.lexer.lineno += t.value.count(''\n'')
         return t

t_code_ignore_nonspace   = r''[^\s\}\''\"\{]+''
t_code_ignore_whitespace = r''\s+''
t_code_ignore = ""

def t_code_error(t):
    raise RuntimeError

def t_error(t):
    print "%d: Illegal character ''%s''" % (t.lexer.lineno, t.value[0])
    print t.value
    t.lexer.skip(1)

lex.lex()

if __name__ == ''__main__'':
    lex.runmain()

            
            
           

        

'
]

{ #category : #resources }
PythonParserTests >> source_yparse [
	^ '# parser for Unix yacc-based grammars
#
# Author: David Beazley (dave@dabeaz.com)
# Date  : October 2, 2006

import ylex
tokens = ylex.tokens

from ply import *

tokenlist = []
preclist  = []

emit_code = 1

def p_yacc(p):
    ''''''yacc : defsection rulesection''''''

def p_defsection(p):
    ''''''defsection : definitions SECTION
                  | SECTION''''''
    p.lexer.lastsection = 1
    print "tokens = ", repr(tokenlist)
    print
    print "precedence = ", repr(preclist)
    print
    print "# -------------- RULES ----------------"
    print 

def p_rulesection(p):
    ''''''rulesection : rules SECTION''''''

    print "# -------------- RULES END ----------------"
    print_code(p[2],0)

def p_definitions(p):
    ''''''definitions : definitions definition
                   | definition''''''

def p_definition_literal(p):
    ''''''definition : LITERAL''''''
    print_code(p[1],0)

def p_definition_start(p):
    ''''''definition : START ID''''''
    print "start = ''%s''" % p[2]

def p_definition_token(p):
    ''''''definition : toktype opttype idlist optsemi ''''''
    for i in p[3]:
       if i[0] not in "''\"":
           tokenlist.append(i)
    if p[1] == ''%left'':
        preclist.append((''left'',) + tuple(p[3]))
    elif p[1] == ''%right'':
        preclist.append((''right'',) + tuple(p[3]))
    elif p[1] == ''%nonassoc'':
        preclist.append((''nonassoc'',)+ tuple(p[3]))

def p_toktype(p):
    ''''''toktype : TOKEN
               | LEFT
               | RIGHT
               | NONASSOC''''''
    p[0] = p[1]

def p_opttype(p):
    ''''''opttype : ''<'' ID ''>''
               | empty''''''

def p_idlist(p):
    ''''''idlist  : idlist optcomma tokenid
               | tokenid''''''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = p[1]
        p[1].append(p[3])

def p_tokenid(p):
    ''''''tokenid : ID 
               | ID NUMBER
               | QLITERAL
               | QLITERAL NUMBER''''''
    p[0] = p[1]
    
def p_optsemi(p):
    ''''''optsemi : '';''
               | empty''''''

def p_optcomma(p):
    ''''''optcomma : '',''
                | empty''''''

def p_definition_type(p):
    ''''''definition : TYPE ''<'' ID ''>'' namelist optsemi''''''
    # type declarations are ignored

def p_namelist(p):
    ''''''namelist : namelist optcomma ID
                | ID''''''

def p_definition_union(p):
    ''''''definition : UNION CODE optsemi''''''
    # Union declarations are ignored

def p_rules(p):
    ''''''rules   : rules rule
               | rule''''''
    if len(p) == 2:
       rule = p[1]
    else:
       rule = p[2]

    # Print out a Python equivalent of this rule

    embedded = [ ]      # Embedded actions (a mess)
    embed_count = 0

    rulename = rule[0]
    rulecount = 1
    for r in rule[1]:
        # r contains one of the rule possibilities
        print "def p_%s_%d(p):" % (rulename,rulecount)
        prod = []
        prodcode = ""
        for i in range(len(r)):
             item = r[i]
             if item[0] == ''{'':    # A code block
                  if i == len(r) - 1:
                      prodcode = item
                      break
                  else:
                      # an embedded action
                      embed_name = "_embed%d_%s" % (embed_count,rulename)
                      prod.append(embed_name)
                      embedded.append((embed_name,item))
                      embed_count += 1
             else:
                  prod.append(item)
        print "    ''''''%s : %s''''''" % (rulename, " ".join(prod))
        # Emit code
        print_code(prodcode,4)
        print
        rulecount += 1

    for e,code in embedded:
        print "def p_%s(p):" % e
        print "    ''''''%s : ''''''" % e
        print_code(code,4)
        print

def p_rule(p):
   ''''''rule : ID '':'' rulelist '';'' ''''''
   p[0] = (p[1],[p[3]])

def p_rule2(p):
   ''''''rule : ID '':'' rulelist morerules '';'' ''''''
   p[4].insert(0,p[3])
   p[0] = (p[1],p[4])

def p_rule_empty(p):
   ''''''rule : ID '':'' '';'' ''''''
   p[0] = (p[1],[[]])

def p_rule_empty2(p):
   ''''''rule : ID '':'' morerules '';'' ''''''
   
   p[3].insert(0,[])
   p[0] = (p[1],p[3])

def p_morerules(p):
   ''''''morerules : morerules ''|'' rulelist
                | ''|'' rulelist
                | ''|''  ''''''
 
   if len(p) == 2:   
       p[0] = [[]]
   elif len(p) == 3: 
       p[0] = [p[2]]
   else:
       p[0] = p[1]
       p[0].append(p[3])

#   print "morerules", len(p), p[0]

def p_rulelist(p):
   ''''''rulelist : rulelist ruleitem
               | ruleitem''''''

   if len(p) == 2:
        p[0] = [p[1]]
   else:
        p[0] = p[1]
        p[1].append(p[2])

def p_ruleitem(p):
   ''''''ruleitem : ID
               | QLITERAL
               | CODE
               | PREC''''''
   p[0] = p[1]

def p_empty(p):
    ''''''empty : ''''''

def p_error(p):
    pass

yacc.yacc(debug=0)

def print_code(code,indent):
    if not emit_code: return
    codelines = code.splitlines()
    for c in codelines:
         print "%s# %s" % (" "*indent,c)

'
]

{ #category : #resources }
PythonParserTests >> source_yply [
	^ '#!/usr/local/bin/python
# yply.py
#
# Author: David Beazley (dave@dabeaz.com)
# Date  : October 2, 2006
#
# Converts a UNIX-yacc specification file into a PLY-compatible
# specification.   To use, simply do this:
#
#   % python yply.py [-nocode] inputfile.y >myparser.py
#
# The output of this program is Python code. In the output,
# any C code in the original file is included, but is commented.
# If you use the -nocode option, then all of the C code in the
# original file is discarded.
#
# Disclaimer:  This just an example I threw together in an afternoon.
# It might have some bugs.  However, it worked when I tried it on
# a yacc-specified C++ parser containing 442 rules and 855 parsing
# states.
#

import sys
sys.path.insert(0,"../..")

import ylex
import yparse

from ply import *

if len(sys.argv) == 1:
    print "usage : yply.py [-nocode] inputfile"
    raise SystemExit

if len(sys.argv) == 3:
    if sys.argv[1] == ''-nocode'':
         yparse.emit_code = 0
    else:
         print "Unknown option ''%s''" % sys.argv[1]
         raise SystemExit
    filename = sys.argv[2]
else:
    filename = sys.argv[1]

yacc.parse(open(filename).read())

print """
if __name__ == ''__main__'':
    from ply import *
    yacc.yacc()
"""


'
]

{ #category : #'tests - programs' }
PythonParserTests >> testBig1 [
	self parse: self codeBig1
]

{ #category : #'tests - programs' }
PythonParserTests >> testBig2 [
	self parse: self sourceBig2
]

{ #category : #'tests - programs' }
PythonParserTests >> testBig3 [
	self parse: self sourceBig3
]

{ #category : #tests }
PythonParserTests >> testCommentAtEnd [
	self parse: self sourceCommentAtEnd
]

{ #category : #'tests - programs' }
PythonParserTests >> testFor1 [
	self parse: self sourceFor1
]

{ #category : #tests }
PythonParserTests >> testGetComment [
	self
		assert:
			((self parserClass on: (ReadStream on: '__import__("pkg_resources").declare_namespace(__name__) #comment'))
				parse;
				yourself) scanner comments asArray = #(#(57 64))
]

{ #category : #tests }
PythonParserTests >> testGetCommentInBlankLine [
	self
		assert:
			((self parserClass on: (ReadStream on: '#comment'))
				parse;
				yourself) scanner comments asArray = #(#(1 8))
]

{ #category : #'tests - programs' }
PythonParserTests >> testIf1 [
	self parse: self sourceIf1
]

{ #category : #'tests - programs' }
PythonParserTests >> testLambda1 [
	self parse: self sourceLambda1
]

{ #category : #'tests - programs' }
PythonParserTests >> testLambda2 [
	self parse: self sourceLambda2
]

{ #category : #'tests - programs' }
PythonParserTests >> testLibDummyThreading [
	"from Python standard library"

	self parse: self sourceLibDummyThreading
]

{ #category : #tests }
PythonParserTests >> testNoReturnAtEnd [
	self parse: self sourceNoReturnAtEnd
]

{ #category : #'tests - programs' }
PythonParserTests >> testParameterWithAssign1 [
	self parse: self sourceParameterWithAssign1
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram1 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram1
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram10 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram10
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram10b [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram10b
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram11 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram11
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram12 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram12
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram13 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram13
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram14 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram14
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram15 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram15
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram16 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram16
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram17 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram17
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram18 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram18
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram19 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram19
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram1b [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram1b
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram1c [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram1c
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram2 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram2
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram20 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram20
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram21 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram21
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram3 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram3
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram4 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram4
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram5 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram5
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram6 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram6
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram7a [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram7a
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram7b [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram7b
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram8 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram8
]

{ #category : #'tests - programs' }
PythonParserTests >> testSimpleProgram9 [
	"from https://wiki.python.org/moin/SimplePrograms"

	self parse: self sourceSimpleProgram9
]

{ #category : #'tests - programs' }
PythonParserTests >> testString1 [
	self parse: self sourceString1
]

{ #category : #'tests - programs' }
PythonParserTests >> testString2 [
	self parse: self sourceString2
]

{ #category : #'tests - programs' }
PythonParserTests >> testString3 [
	self parse: self sourceString3
]

{ #category : #'tests - programs' }
PythonParserTests >> testString4 [
	self parse: self sourceString4
]

{ #category : #'tests - programs' }
PythonParserTests >> testString5 [
	self parse: self sourceString5
]

{ #category : #'tests - programs' }
PythonParserTests >> testString6 [
	self parse: self sourceString6
]

{ #category : #'tests - programs' }
PythonParserTests >> testVarArgs [
	self parse: self sourceVarArgs
]

{ #category : #'tests - programs' }
PythonParserTests >> testWhileLoop1 [
	self parse: self sourceWhileLoop1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_CppHeaderParser [
	self parse: self source_CppHeaderParser
]

{ #category : #'tests - programs' }
PythonParserTests >> test_GardenSnake [
	self parse: self source_GardenSnake
]

{ #category : #'tests - programs' }
PythonParserTests >> test_basic [
	self parse: self source_basic
]

{ #category : #'tests - programs' }
PythonParserTests >> test_basiclex [
	self parse: self source_basiclex
]

{ #category : #'tests - programs' }
PythonParserTests >> test_basiclog [
	self parse: self source_basiclog
]

{ #category : #'tests - programs' }
PythonParserTests >> test_basinterp [
	self parse: self source_basinterp
]

{ #category : #'tests - programs' }
PythonParserTests >> test_basparse [
	self parse: self source_basparse
]

{ #category : #'tests - programs' }
PythonParserTests >> test_calclex [
	self parse: self source_calclex
]

{ #category : #'tests - programs' }
PythonParserTests >> test_clex [
	self parse: self source_clex
]

{ #category : #'tests - programs' }
PythonParserTests >> test_cparse [
	self parse: self source_cparse
]

{ #category : #'tests - programs' }
PythonParserTests >> test_ctokens [
	self parse: self source_ctokens
]

{ #category : #'tests - programs' }
PythonParserTests >> test_hedit [
	self parse: self source_hedit
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex [
	self parse: self source_lex
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_closure [
	self parse: self source_lex_closure
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_doc1 [
	self parse: self source_lex_doc1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_dup1 [
	self parse: self source_lex_dup1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_dup2 [
	self parse: self source_lex_dup2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_dup3 [
	self parse: self source_lex_dup3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_empty [
	self parse: self source_lex_empty
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_error1 [
	self parse: self source_lex_error1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_error2 [
	self parse: self source_lex_error2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_error3 [
	self parse: self source_lex_error3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_error4 [
	self parse: self source_lex_error4
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_hedit [
	self parse: self source_lex_hedit
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_ignore [
	self parse: self source_lex_ignore
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_ignore2 [
	self parse: self source_lex_ignore2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_literal1 [
	self parse: self source_lex_literal1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_literal2 [
	self parse: self source_lex_literal2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_many_tokens [
	self parse: self source_lex_many_tokens
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_module [
	self parse: self source_lex_module
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_module_import [
	self parse: self source_lex_module_import
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_object [
	self parse: self source_lex_object
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_opt_alias [
	self parse: self source_lex_opt_alias
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_optimize [
	self parse: self source_lex_optimize
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_optimize2 [
	self parse: self source_lex_optimize2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_optimize3 [
	self parse: self source_lex_optimize3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_re1 [
	self parse: self source_lex_re1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_re2 [
	self parse: self source_lex_re2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_re3 [
	self parse: self source_lex_re3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_rule1 [
	self parse: self source_lex_rule1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_rule2 [
	self parse: self source_lex_rule2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_rule3 [
	self parse: self source_lex_rule3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state1 [
	self parse: self source_lex_state1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state2 [
	self parse: self source_lex_state2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state3 [
	self parse: self source_lex_state3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state4 [
	self parse: self source_lex_state4
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state5 [
	self parse: self source_lex_state5
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state_noerror [
	self parse: self source_lex_state_noerror
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state_norule [
	self parse: self source_lex_state_norule
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_state_try [
	self parse: self source_lex_state_try
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_token1 [
	self parse: self source_lex_token1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_token2 [
	self parse: self source_lex_token2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_token3 [
	self parse: self source_lex_token3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_token4 [
	self parse: self source_lex_token4
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_token5 [
	self parse: self source_lex_token5
]

{ #category : #'tests - programs' }
PythonParserTests >> test_lex_token_dup [
	self parse: self source_lex_token_dup
]

{ #category : #'tests - programs' }
PythonParserTests >> test_makedoc [
	self parse: self source_makedoc
]

{ #category : #'tests - programs' }
PythonParserTests >> test_readSampleClass [
	self parse: self source_readSampleClass
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_0 [
	self parse: self source_test_0
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_1 [
	self parse: self source_test_1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_10 [
	self parse: self source_test_10
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_100 [
	self parse: self source_test_100
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_102 [
	self parse: self source_test_102
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_103 [
	self parse: self source_test_103
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_104 [
	self parse: self source_test_104
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_105 [
	self parse: self source_test_105
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_106 [
	self parse: self source_test_106
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_107 [
	self parse: self source_test_107
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_108 [
	self parse: self source_test_108
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_109 [
	self parse: self source_test_109
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_11 [
	self parse: self source_test_11
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_110 [
	self parse: self source_test_110
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_111 [
	self parse: self source_test_111
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_112 [
	self parse: self source_test_112
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_113 [
	self parse: self source_test_113
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_114 [
	self parse: self source_test_114
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_115 [
	self parse: self source_test_115
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_118 [
	self parse: self source_test_118
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_119 [
	self parse: self source_test_119
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_12 [
	self parse: self source_test_12
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_120 [
	self parse: self source_test_120
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_122 [
	self parse: self source_test_122
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_123 [
	self parse: self source_test_123
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_124 [
	self parse: self source_test_124
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_125 [
	self parse: self source_test_125
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_126 [
	self parse: self source_test_126
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_127 [
	self parse: self source_test_127
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_128 [
	self parse: self source_test_128
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_129 [
	self parse: self source_test_129
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_13 [
	self parse: self source_test_13
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_130 [
	self parse: self source_test_130
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_131 [
	self parse: self source_test_131
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_132 [
	self parse: self source_test_132
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_133 [
	self parse: self source_test_133
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_134 [
	self parse: self source_test_134
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_135 [
	self parse: self source_test_135
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_136 [
	self parse: self source_test_136
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_137 [
	self parse: self source_test_137
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_138 [
	self parse: self source_test_138
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_139 [
	self parse: self source_test_139
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_140 [
	self parse: self source_test_140
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_141 [
	self parse: self source_test_141
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_142 [
	self parse: self source_test_142
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_143 [
	self parse: self source_test_143
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_144 [
	self parse: self source_test_144
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_146 [
	self parse: self source_test_146
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_147 [
	self parse: self source_test_147
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_148 [
	self parse: self source_test_148
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_15 [
	self parse: self source_test_15
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_150 [
	self parse: self source_test_150
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_151 [
	self parse: self source_test_151
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_152 [
	self parse: self source_test_152
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_153 [
	self parse: self source_test_153
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_154 [
	self parse: self source_test_154
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_155 [
	self parse: self source_test_155
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_156 [
	self parse: self source_test_156
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_157 [
	self parse: self source_test_157
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_158 [
	self parse: self source_test_158
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_159 [
	self parse: self source_test_159
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_16 [
	self parse: self source_test_16
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_160 [
	self parse: self source_test_160
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_161 [
	self parse: self source_test_161
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_162 [
	self parse: self source_test_162
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_163 [
	self parse: self source_test_163
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_164 [
	self parse: self source_test_164
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_165 [
	self parse: self source_test_165
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_166 [
	self parse: self source_test_166
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_167 [
	self parse: self source_test_167
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_168 [
	self parse: self source_test_168
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_169 [
	self parse: self source_test_169
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_170 [
	self parse: self source_test_170
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_171 [
	self parse: self source_test_171
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_172 [
	self parse: self source_test_172
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_173 [
	self parse: self source_test_173
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_174 [
	self parse: self source_test_174
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_175 [
	self parse: self source_test_175
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_176 [
	self parse: self source_test_176
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_177 [
	self parse: self source_test_177
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_178 [
	self parse: self source_test_178
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_179 [
	self parse: self source_test_179
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_18 [
	self parse: self source_test_18
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_180 [
	self parse: self source_test_180
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_181 [
	self parse: self source_test_181
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_182 [
	self parse: self source_test_182
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_183 [
	self parse: self source_test_183
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_184 [
	self parse: self source_test_184
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_185 [
	self parse: self source_test_185
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_186 [
	self parse: self source_test_186
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_187 [
	self parse: self source_test_187
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_188 [
	self parse: self source_test_188
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_189 [
	self parse: self source_test_189
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_19 [
	self parse: self source_test_19
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_190 [
	self parse: self source_test_190
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_191 [
	self parse: self source_test_191
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_192 [
	self parse: self source_test_192
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_193 [
	self parse: self source_test_193
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_194 [
	self parse: self source_test_194
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_195 [
	self parse: self source_test_195
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_196 [
	self parse: self source_test_196
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_197 [
	self parse: self source_test_197
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_198 [
	self parse: self source_test_198
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_199 [
	self parse: self source_test_199
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_2 [
	self parse: self source_test_2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_20 [
	self parse: self source_test_20
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_200 [
	self parse: self source_test_200
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_201 [
	self parse: self source_test_201
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_202 [
	self parse: self source_test_202
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_21 [
	self parse: self source_test_21
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_22 [
	self parse: self source_test_22
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_23 [
	self parse: self source_test_23
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_24 [
	self parse: self source_test_24
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_25 [
	self parse: self source_test_25
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_26 [
	self parse: self source_test_26
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_28 [
	self parse: self source_test_28
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_29 [
	self parse: self source_test_29
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_3 [
	self parse: self source_test_3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_30 [
	self parse: self source_test_30
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_31 [
	self parse: self source_test_31
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_32 [
	self parse: self source_test_32
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_33 [
	self parse: self source_test_33
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_36 [
	self parse: self source_test_36
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_37 [
	self parse: self source_test_37
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_38 [
	self parse: self source_test_38
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_39 [
	self parse: self source_test_39
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_4 [
	self parse: self source_test_4
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_40 [
	self parse: self source_test_40
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_43 [
	self parse: self source_test_43
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_44 [
	self parse: self source_test_44
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_45 [
	self parse: self source_test_45
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_46 [
	self parse: self source_test_46
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_5 [
	self parse: self source_test_5
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_50 [
	self parse: self source_test_50
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_51 [
	self parse: self source_test_51
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_52 [
	self parse: self source_test_52
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_53 [
	self parse: self source_test_53
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_54 [
	self parse: self source_test_54
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_55 [
	self parse: self source_test_55
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_56 [
	self parse: self source_test_56
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_59 [
	self parse: self source_test_59
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_6 [
	self parse: self source_test_6
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_60 [
	self parse: self source_test_60
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_64 [
	self parse: self source_test_64
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_69 [
	self parse: self source_test_69
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_7 [
	self parse: self source_test_7
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_71 [
	self parse: self source_test_71
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_75 [
	self parse: self source_test_75
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_76 [
	self parse: self source_test_76
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_77 [
	self parse: self source_test_77
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_78 [
	self parse: self source_test_78
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_79 [
	self parse: self source_test_79
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_8 [
	self parse: self source_test_8
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_81 [
	self parse: self source_test_81
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_82 [
	self parse: self source_test_82
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_83 [
	self parse: self source_test_83
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_84 [
	self parse: self source_test_84
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_86 [
	self parse: self source_test_86
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_88 [
	self parse: self source_test_88
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_89 [
	self parse: self source_test_89
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_9 [
	self parse: self source_test_9
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_93 [
	self parse: self source_test_93
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_94 [
	self parse: self source_test_94
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_95 [
	self parse: self source_test_95
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_97 [
	self parse: self source_test_97
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_98 [
	self parse: self source_test_98
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_99 [
	self parse: self source_test_99
]

{ #category : #'tests - programs' }
PythonParserTests >> test_test_run [
	self parse: self source_test_run
]

{ #category : #'tests - programs' }
PythonParserTests >> test_testlex [
	self parse: self source_testlex
]

{ #category : #'tests - programs' }
PythonParserTests >> test_testyacc [
	self parse: self source_testyacc
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badargs [
	self parse: self source_yacc_badargs
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badid [
	self parse: self source_yacc_badid
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badprec [
	self parse: self source_yacc_badprec
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badprec2 [
	self parse: self source_yacc_badprec2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badprec3 [
	self parse: self source_yacc_badprec3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badrule [
	self parse: self source_yacc_badrule
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_badtok [
	self parse: self source_yacc_badtok
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_dup [
	self parse: self source_yacc_dup
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_error1 [
	self parse: self source_yacc_error1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_error2 [
	self parse: self source_yacc_error2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_error3 [
	self parse: self source_yacc_error3
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_error4 [
	self parse: self source_yacc_error4
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_inf [
	self parse: self source_yacc_inf
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_literal [
	self parse: self source_yacc_literal
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_misplaced [
	self parse: self source_yacc_misplaced
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_missing1 [
	self parse: self source_yacc_missing1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_nested [
	self parse: self source_yacc_nested
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_nodoc [
	self parse: self source_yacc_nodoc
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_noerror [
	self parse: self source_yacc_noerror
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_nop [
	self parse: self source_yacc_nop
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_notfunc [
	self parse: self source_yacc_notfunc
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_notok [
	self parse: self source_yacc_notok
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_prec1 [
	self parse: self source_yacc_prec1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_rr [
	self parse: self source_yacc_rr
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_rr_unused [
	self parse: self source_yacc_rr_unused
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_simple [
	self parse: self source_yacc_simple
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_sr [
	self parse: self source_yacc_sr
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_term1 [
	self parse: self source_yacc_term1
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_unused [
	self parse: self source_yacc_unused
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_unused_rule [
	self parse: self source_yacc_unused_rule
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_uprec [
	self parse: self source_yacc_uprec
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yacc_uprec2 [
	self parse: self source_yacc_uprec2
]

{ #category : #'tests - programs' }
PythonParserTests >> test_ylex [
	self parse: self source_ylex
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yparse [
	self parse: self source_yparse
]

{ #category : #'tests - programs' }
PythonParserTests >> test_yply [
	self parse: self source_yply
]
