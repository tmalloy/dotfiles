-- script adapted from here:
-- https://gist.github.com/asmagill/c38f75fff9d9ef43d1226329fc1436e4

-- helpful docs:
-- keycode: http://www.hammerspoon.org/docs/hs.keycodes.html
-- eventtap: http://www.hammerspoon.org/docs/hs.eventtap.html
-- event: http://www.hammerspoon.org/docs/hs.eventtap.event.html
-- timer docs: http://www.hammerspoon.org/docs/hs.timer.html

local alert    = require("hs.alert")
local timer    = require("hs.timer")
local eventtap = require("hs.eventtap")

local events   = eventtap.event.types

local module   = {}

-- how quickly must the two single ctrl taps occur?
module.timeFrame = 250


local timeFirstControl, firstDown, secondDown = 0, false, false


local flagCount = function(event)
  local count = 0
  for k,v in pairs(event:getFlags()) do
    count = count + 1
  end
  return count
end

local timeMillis = function()
  return timer.absoluteTime()/1000000
end

local _newWatcher = function(keyCode)

  local watcher = { doublePressed = false }

  local states = {
    NOT_PRESSED,
    FIRST_PRESS,
    SECOND_PRESS
  }
  local state = states.NOT_PRESSED

  local timeFirstPress = 0
  local keyDown = function()
    if state == states.NOT_PRESSED then
      if timeMillis() - timeFirstPress < module.timeFrame then
--        print("second press")
        state = states.SECOND_PRESS
        watcher.doublePressed = true
      else
--        print("first press")
        timeFirstPress = timeMillis()
        state = states.FIRST_PRESS
      end
    end
  end
  local keyUp = function()
--    print("key up")
    state = states.NOT_PRESSED
    watcher.doublePressed = false
  end


  -- We have to be overly careful here because we don't get notified *which* is
  -- raised when one is released. That's why we have to do the onlyOneFlag
  -- check.  A "flag" is command key like cmd or alt as opposed to a key which
  -- is 'a' or 'z'.
  local receiver = function(event)
    if event:getType() == events.flagsChanged then
      if not event:getFlags()[keyCode] then
        keyUp()
      end

      if event:getFlags()[keyCode] and flagCount(event) == 1 then
        keyDown()
      end
    end

  end

  return watcher, receiver
end

local matchers = {}
module.eventWatcher = eventtap.new({events.flagsChanged}, function(ev)
  for _, receiver in ipairs(matchers) do
    receiver(ev)
  end
  return false
end):start()

module.newWatcher = function(key)
  watcher, receiver = _newWatcher(key)
  table.insert(matchers, receiver)
  return watcher
end


return module
