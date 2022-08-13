#  Shape Factory

## A small project based on Swift and leveraging Factory Design Patterns

### Instructions:
* ```Open with Xcode```
* ```Build and Run the App```
* ```Click on a shape to select and display it's information```
* ```Press "c" to create more shapes```
* ```Pinch to zoom canvas```
* ```Click and drag to pan canvas```

#### Process description:
Due to the project specifications, I thought that it would have been a perfect example to leverage a factory design pattern for the shape objects' creation.

A ShapeFactory class has been created in order to support this. This class will create ShapeViews which will be configured for a corresponding Shape.

The ShapeView is in charge handling the representation of a Shape object and it's information.

The Shape object witholds all the properties of a shape such as position, size and color.

The ShapeView will then be added as a subview to the main canvas View.

A ViewController is used to control my main View and manage the creation of shape subviews through the ShapeFactory.å


**Still to do:**
* support Shape classes with proper getters and setters for all the properties
* support zoom on mouse wheel scroll
* add command to clear canvas
