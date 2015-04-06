###Project Components

####User Interface

We adopted [single-page menu](http://en.wikipedia.org/wiki/Single-page_application) design for its simplicity and compatibility across platforms. There are three UI components on the page: status bar, button bar, and the main maze canvas. The status bar displays four pieces of information: the level size, the time spent on the current maze, step count, and total score. The score is a function of time, steps, and level number and may be used as a single parameter for evaluating the performance of players. The button bar gives players the following controls: 

- RESTART to restart at the beginning of the current maze
- LEVEL to choose the difficulty level (small, medium, large, and huge mazes)
- LOAD to load a maze by its maze number
- MUTE/SOUND to toggle music and sound effects
- LOGIN to login as a registered player
- CREATE to create user-defined mazes (only available for registered players)

To engage the game, players may use keyboard (e.g., up, down, left, and right keys) or mouse device to move the main character. To simulate Joystick functionality, mouse button and its movement and velocity are constantly monitored. Such feature allows players to enjoy the game on mobile devices as well. The main canvas consists of two overlapped layers. The top layer is responsible for rendering main character (i.e., the knight). The bottom layer displays the maze and trail dots. To reduce CPU load, only a small portion of the maze about 10 x 8 blocks is displayed on the screen. In our implementation, the main character remains on the center of canvas while the background is redrawn for each step. To make such movement appeal to the gamers, background is rendered at a rate of 50 frame per second. At the end of each level, two events are triggered: a short triumph music is played if available followed by a short question on a jQuery UI in-screen floater. The response of players (e.g., Yes or No) may change the selection probability of the next maze.

![main_menu](./img/the_game_menu.png)

