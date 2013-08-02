timerman
========

Simple Javascript timers manager.

Basic usage example:

```coffeescript

# Create a manager for timers created by <window>
tmm = timerman(window)

# Your code can use timers like before
window.setTimeout(myfunction, delay)
window.setInterval(myfunction, delay)

# You can clear timeouts and intervals separately...
tmm.clearAllTimeouts()
tmm.clearAllIntervals()

# ...or together
tmm.clearAll() 
```

Extended usage:

```coffeescript
tmm = timerman(window)

# Unistall timer manager from <window>
tmm.uninstall()

# (re)install them
tmm.install()

# install the same manager in another window too
tmm.install(window.frames[0].window)
```

```timerman``` was coded for you by Michele Bini; you can read MIT-LICENSE for licensing details and about the absence of a warranty.
