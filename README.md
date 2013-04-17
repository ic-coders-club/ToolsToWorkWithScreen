NOTE: AVOID USING THIS TOOL (Probably)
========
A week or so in to this and I present our first example of a bad tool.

To paraphrase why this is a bad tool:

- It solves a trivial problem
- It adds a process that the screen session runs in.  This is messy and means all input and output to/ from the screen session is redirected through this process.


ScreenTools
===========

Tools to work and use screen more efficiently

== ConnectScreen.sh == 

I use this under an alias in my .bashrc (eg. scr)
the script asks screen for all sessions running, then prints that, 
and allows you to select from the list with a number, from 1 to the number of screen sessions, inclusive.
You can also pass it that number on the command if you already know the session that you want to reconnect to.
  
