ScreenTools
===========

Tools to work and use screen more efficiently

## ConnectScreen.sh 
** IMPORTANT:  Previously this script caused screen to be run as a subprocess of this script. THIS IS BAD. 
It has now been updated so that `exec` is used to replace the current process with the screen session itself. **

### USAGE
I use this under an alias in my .bashrc (eg. scr).
The script asks screen for all sessions running, then prints that, allowing you to select from the list
by choosing a number, from 1 to the number of screen sessions, inclusively.
You can also pass it that number on the command if you already know the session that you want to reconnect to.

### Example
```bash
$ alias scr=ConnectScreen.sh
$ scr
There are screens on:
  [1]    18994.pts-4.lx04       (Detached)
  [2]    5755.pts-3.lx04        (Attached)
2 Sockets in /var/run/screen/S-bek07.

Choose which session you want (1-2): 
```
