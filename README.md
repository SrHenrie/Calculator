# Calculator
A reverse polish notation calculator that demonstrates auto layout, stacks, target-actions on UIButtons

NOTE: You should build and run after each step.

## Step 0: Setup Window (non-storyboard version)

- In the ```application:didFinishLaunchingWithOptions:```

 - Allocate memory and instantiate the ```AppDelegate```'s ```window```
 - set ```self.window.background``` to white
 - set the ```window```'s ```rootViewController```
 - call ```[self.window makeKeyAndVisible] 

## Step 1: Add displayLabel to the view

- create a property of a label called ```displayLabel``` and add it to the view
- set the text alignment of ```displayLabel``` to right
- set the font to size 32
- set the text to ```@"0"```

## Step 2: Add constraints to the displayLabel

- center the ```displayLabel``` and have it go across the top of the view
- set the height of the ```displayLabel``` to 50.
- don't forget to ```setTranslatesAutoresizingMaskIntoConstraints``` to ```NO```.

## Step 3: Add buttons and constraints

- Your buttons should look like this:
	- equal heights for all buttons
	- equal width for all buttons (except enter, which should be twice as wide as other buttons)
	- buttons should be below the display text
	- buttons should take up rest of screen
	- should resize nicely when device rotated

![Calculator Button Layout](http://i.imgur.com/qjSp5Bx.png)

## Step 4: Create method for appending a digit and add target actions to each digit button

- Create a method ```appendDigit:``` that takes a ```UIButton *``` as a parameter (the sender)
- This method should determine which button was pressed and append the appropriate digit to the display label
- add target-actions to each button

## Step 5: Add BOOL to see if user is in the middle of typing a number

The ```appendDigit:``` method should get rid of the leading zero, right?

- add a BOOL property ```isInTheMiddleOfTypingANumber``` to ```ViewController```
- if the user ```isInTheMiddleOfTypingANumber```, then just append the new number to ```displayLabel.text```
- else (this is the first digit a user presses), then set the ```displayLabel.text``` to this number and set the ```isInTheMiddleOfTypingANumber``` to YES.

## Step 6: Create a displayValue property and implement a custom setter and getter

- create a ```double``` property called ```displayValue```
- implement a custom getter ```- (double)displayValue```
	- this should return the ```displayLabel.text``` value as a double
- implement a custom setter ```- (void)setDisplayValue:(double)displayValue```
	- this should set the ```displayLabel.text``` to the ```displayValue`` parameter (converted to an NSString, of course)
	- this should set ```isInTheMiddleOfTypingANumber``` to NO;


## Step 7: Create an operand stack and implement the enter button

- create an ```NSMutableArray *``` property on ```ViewController``` called ```operandStack```.
- in ```viewDidLoad```, allocate memory and instantiate an empty ```NSMutableArray```
- create a method ```enter``` that will be hooked up to a the enter button
 - this method set ```isInTheMiddleOfTypingANumber``` to NO
 - then this method should create an NSNumber representation of ```displayValue``` (this will pull the value in the ```displayLabel.text``` and convert it to a double)
 - then store the NSNumber in ```operandStack```
 - NSLog the operandStack;
- Add a target-action to the button to link method with control event

## Step 8: create a popOperandStack Method

- create a method called ```popOperandStack``` that will return and remove the last NSNumber in ```self.operandStack```

## Step 9: Create an operate method and implement the operation buttons

- create a method called ```operate:``` that takes a ```UIButton *``` as a parameter (the sender)
- if ```operandStack``` is greater than 2 (we need two number to perform an operation) then:
 - use ```popOperandStack``` to populate the two ```NSNumber``` variables
 - determine which button was pressed
  - Use if-else if to "switch" (can't use a switch on strings :'( ) based on the operation to perform.
  - inside each if set ```self.displayValue``` to the result of the appropriate math operation, i.e. (```[number2 doubleValue] / [number1 doubleValue]```)
  - NOTE: remember to convert our ```NSNumber```s to ```double```s
  - NOTE: Number2 should always be the first number used in the mathematical expression.
 - call ```enter``` to push new value from calculation on stack 








