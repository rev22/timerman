# Copyright (c) 2013 Michele Bini

# See MIT-LICENSE for licensing information, and the absence of a warranty

window.timerman = (window = window) ->
  { setTimeout, setInterval } = window
  intervals = {}
  timeouts = {}
  lib =
    setTimeout: (code, delay) ->
      id = setTimeout (->
        delete timeouts[id]
        do code
      ), delay
      timeouts[id] = code
      id
    clearTimeout: (id) ->
      x = clearTimeout id
      delete timeouts[id]
      x
    setInterval: (code, delay) ->
      id = setInterval (->
        try
          do code
        catch error
          lib.clearInterval id
          throw error
      ), delay
      intervals[id] = code
      id
    clearInterval: (id) ->
      x = clearTimeout id
      delete timeouts[id]
      x
    clearAllTimeouts: -> lib.clearTimeout x for x of timeouts
    clearAllIntervals: -> lib.clearInterval x for x of intervals
    intervals: intervals
    timeouts: timeouts
  
  for x in ['setTimeout', 'setInterval', 'clearTimeout', 'clearInterval']
    window[x] = lib[x]

  lib
