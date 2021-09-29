# bstevr_assessment

BSTEVR Assessment.

## How To Run

You can run this Flutter app through Android Studio by simply opening the project and tapping the run button.
Also you can run tests inside the project by simply using command below:

```
flutter test test/alphabet_tree_test.dart
```

## Contents

The app has two screens and one unit test.

Screens:
<br />
<img src="https://user-images.githubusercontent.com/4191018/135350217-8f6b5e5e-c66a-481e-8af6-62c696c38dbc.jpeg" width="350" /> <img src="https://user-images.githubusercontent.com/4191018/135350046-7a6444d3-d9f4-4a9a-8bb8-761914e28f00.jpeg" width="350" />

Alphabet Tree Unit Testing:
![Alphabet Tree Unit Testing](https://user-images.githubusercontent.com/4191018/135350503-9ac4ddf5-5b70-4c61-b746-0f763560be52.png)

## Assessment Details

### 1- Alphabet Trees

* Write a class that creates an AlphabetTree of any size or length.Add a method to the class which accepts another alphabet tree, compares the data of the two trees and prints all the unique letters within the two trees, in alphabetical order.
* Write unit tests for the code.

### 2- Automated Coin Detector

* Create a stream that randomly returns the string Real or Fake once every 3 seconds.
* Using this stream, create an app with a scrollable list of expandable widgets that gets updated every time a new value is received.
* For each new value, the list should be populated with a new expandable widget at the top, with only the value visible. The widget should push the existing list items down, and animate into its position; it should slide and fade in from the right.
* If the value is Real, a sound effect (see below) should be played.
* The title of the app should update to the last value received.
* There should be a “Play/Pause” toggle button in the header that would pause/resume the stream. The button should animate between the two states.
* Upon tapping one of the list items, the item should expand to show the time passed since the value was received (34s ago, 2m ago, 1h ago, etc).
* The item should animate upon expansion/contraction and play the sound effect if the value is Real.
* If the app is run in Debug mode, it should also print the value to the Console.

### 3- Speed Prototyping

* Set a timer for 30 minutes.
* Start the timer and try to build the screen below as accurately as possible.
* Focus on the structure, not the content. Improvise where needed.
* Above all, make sure the code runs when the timer is over.
