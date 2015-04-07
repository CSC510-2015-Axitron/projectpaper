###Testing

An automatic testing platform is expected to reduce the chance of existing components being broken by the addition and revision to the code. Therefore, we made testing an important part of our project and have been developing unit test methods along with the development of the code. Due to the nature of our web-based application, a headless testing platform is also required. Here, [Node.js](https://nodejs.org "Node.js"), a general-purpose server site tool, is chosen to carry out both static and dynamic analysis. Four components of our project are constantly being tested at each push to the GitHub repository. The components are listed below:

- mazeModel.js
- backtrack.js
- apiclient.js
- mazeMenu.js

The mazeModel.js component is the engine of the maze game and responsible for I/O, constructing, and gaming logics of the mazes. The backtrack.js component is designed to keep track of the player's footsteps and path taken while leaving breadcrumbs on the screen. A multi-node tree data structure has been built in the code. Apiclient is a node.js based client used to verify RESTful web services between the database server and client sites (i.e., player's browser). The frontend interface is implemented in mazeMenu.js which takes care of sound effects, information display, menu, mouse and keystroke detection and other general I/O of the game.

One challenge of developing test cases for gaming is how to test UI components in the headless environment. Although Node.js provides a few browser-like APIs and tools, we found these tools to be very limited. In addition to relying on humans to perform functional tests, we have also created UI mock objects to tackle this issue. These UI mock objects were created inside the mocha test files to act as browser window, page document, [jQuery library](https://jquery.com "jQuery"), jQuery AJAX, [CanvasEngine](http://canvasengine.net "Canvas Engine"), [Buzz audio library](http://buzz.jaysalvat.com "Buzz Audio Library"), remoteDB, and AMaze model itself. Using these mock objects allows us to monitor status, responses, and behavior of the game via internal flags.

These dynamic tests can be carried out on local sites as well as on server site such as Travis-CI. We have utilized [npm](https://www.npmjs.com), short for Node.js Package Manager, to streamline all of our installation, testing procedure, and deployment. Defined in package.json file, the required node.js packages and tools can be installed in just one step. In addition to the aforementioned tools, [Grunt](http://gruntjs.com), the automatic task runner, will be executed during the last step. As part of Continuous-Integration and Continuous-Deployment, once test is passed, the task runner will duplicate JavaScript files, minify them and move them into deployment folder called "Publichtml."

