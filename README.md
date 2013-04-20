NOTE: AVOID USING THIS TOOL (Probably)
========
A week or so in to this and I present our first example of a bad tool.

To paraphrase why this is a bad tool:

- It solves a trivial problem
- It adds a process that the screen session runs in.  This is messy and means all input and output to/ from the screen session is redirected through this process.


ScreenTools
===========

Tools to work and use screen more efficiently

## ConnectScreen.sh 
**IMPORTANT:  Previously this script caused screen to be run as a subprocess of this script. THIS IS BAD. 
It has now been updated so that `exec` is used to replace the current process with the screen session itself.**

### USAGE
I use this under an alias in my .bashrc (eg. scr).
It behaves in the following way:

1. If no screen sessions exist, it makes one.
2. If only one session exists, it reconnects to it immediately.
3. Otherwise, the script asks screen for all sessions running, then prints that, allowing you to select from the list
by choosing a number, from 1 to the number of screen sessions, inclusively.
You can also pass it that number on the command if you already know the session that you want to reconnect to.

### Example with multiple sessions
```bash
$ alias scr=ConnectScreen.sh
$ scr
There are screens on:
  [1]    18994.pts-4.lx04       (Detached)
  [2]    5755.pts-3.lx04        (Detached)
2 Sockets in /var/run/screen/S-bek07.

Choose which session you want (1-2): 
```
Typing `1` would now reconnect to the screen at `18994.pts-4.lx04`.
