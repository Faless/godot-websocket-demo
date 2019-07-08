# Godot 3.0 HTML5 WebSocket example

# This demo was for Godot 3.0 and used emscripten automatic conversion of TCP sockets to websockets. This demo is deprecated, as there is now official WebSocket support via WebSocketClient and WebSocketServer (godot 3.1+)

This is a small demo to show usage of WebSocket feature in HTML5 Godot export:

 * The WebSocket Server used is a fork of https://github.com/dpallot/simple-websocket-server (see https://github.com/Faless/simple-websocket-server) allowing binary sub-protocol
 * Remember to run the WebSocket Server before running the game (`python WebSocketServer.py` should suffice)
 * You need a proper web server to serve the exported game for it to work on Chrome (it won't allow XHR from `file://`)
 * WebSockets only works on HTML5 export, it won't work when running from the editor unless you implement the websocket protocol yourself.


The Godot demo is released under MIT license.

The WebSocket server is MIT licensed too apparently, but I do not own the copyright of it, see: https://github.com/dpallot/simple-websocket-server


Tested on Chromium and Firefox (not in privacy mode, due to current Godot limitation)
