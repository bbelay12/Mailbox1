# Mailbox1

The purpose of this homework is to leverage animations and gestures to implement more sophisticated interactions. We're going to use the techniques from this week to implement the Mailbox interactions.

Time spent: `<20>`

### Features

#### Required

- [yes ] On dragging the message left:
  - [ yes] Initially, the revealed background color should be gray.
  - [ ] As the reschedule icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
  - [ yes] After 60 pts, the later icon should start moving with the translation and the background should change to yellow.
    - [ yes] Upon release, the message should continue to reveal the yellow background. When the animation it complete, it should show the reschedule options.
  - [ yes] After 260 pts, the icon should change to the list icon and the background color should change to brown.
    - [yes ] Upon release, the message should continue to reveal the brown background. When the animation it complete, it should show the list options.

- [yes ] User can tap to dismiss the reschedule or list options. After the reschedule or list options are dismissed, you should see the message finish the hide animation.
- [ yes] On dragging the message right:
  - [ yes] Initially, the revealed background color should be gray.
  - [ ] As the archive icon is revealed, it should start semi-transparent and become fully opaque. If released at this point, the message should return to its initial position.
  - [ yes] After 60 pts, the archive icon should start moving with the translation and the background should change to green.
    - [ yes] Upon release, the message should continue to reveal the green background. When the animation it complete, it should hide the message.
  - [yes ] After 260 pts, the icon should change to the delete icon and the background color should change to red.
    - [ yes] Upon release, the message should continue to reveal the red background. When the animation it complete, it should hide the message.


#### Optional

- [ NO] Panning from the edge should reveal the menu.
  - [NO ] If the menu is being revealed when the user lifts their finger, it should continue revealing.
  - [NO ] If the menu is being hidden when the user lifts their finger, it should continue hiding.
- [NO ] Tapping on compose should animate to reveal the compose view.
- [NO ] Tapping the segmented control in the title should swipe views in from the left or right.
- [NO] Shake to undo.

#### The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. 
2. 

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

http://i.imgur.com/RltZmuU.gifv

<img src='http://i.imgur.com/RltZmuU.gifv' title='DemoWeek3' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

* Any libraries or borrowed content.
