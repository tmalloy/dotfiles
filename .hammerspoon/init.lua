
--  hs.notify.new({title="Hammerspoon", informativeText="Hello World" .. vol }):send()

--
--
-- Volume
--
--

isMuted = function()
  return hs.audiodevice.defaultOutputDevice():outputMuted()
end

toggleMute = function()
  hs.audiodevice.defaultOutputDevice():setOutputMuted(not isMuted())
end

volDown = function()
  if isMuted() then
    toggleMute()
  else
    local vol = hs.audiodevice.defaultOutputDevice():outputVolume()
    hs.audiodevice.defaultOutputDevice():setOutputVolume(vol - 5)
  end
end

volUp = function()
  if isMuted() then
    toggleMute()
  else
    local vol = hs.audiodevice.defaultOutputDevice():outputVolume()
    hs.audiodevice.defaultOutputDevice():setOutputVolume(vol + 5)
  end
end

hs.hotkey.bind({"cmd", "shift"}, "h", toggleMute)
hs.hotkey.bind({"cmd", "shift"}, "j", volDown, nil, volDown)
hs.hotkey.bind({"cmd", "shift"}, "k", volUp, nil, volUp)

-- No tilde on the top left of happy hacker to switch between windows within a
-- single application
hs.hotkey.bind({"cmd"}, "ESCAPE", function()
  hs.eventtap.keyStroke({"cmd"}, "`", 0)
end, nil, function()
  hs.eventtap.keyStroke({"cmd"}, "`", 0)
end)


--
--
-- left/down/right up movement/selection
--
--

doublePressWatcher = require("doublePressWatcher")
altWatcher = doublePressWatcher.newWatcher("alt")

bindArrowKey = function(key, direction)
  local builder = function(modifiers)

    -- because we're using the alt key to access these shortcuts, we take away
    -- the useful properties of the alt key (moving by word instead of letter).
    -- So make a double press of alt add it back in.
    local modifiersWithAlt = {table.unpack(modifiers)}
    table.insert(modifiersWithAlt, "alt")


    return function()
--        print(table.concat(modifiers, ", "))
--        print(table.concat(modifiersWithAlt, ", "))
--        print()
      if altWatcher.doublePressed then
        hs.eventtap.keyStroke(modifiersWithAlt, direction, 0)
      else
        hs.eventtap.keyStroke(modifiers, direction, 0)
      end
    end 
  end

  emptyFn = builder({})
  shiftFn = builder({"shift"})
  cmdFn = builder({"cmd"})
  shiftCmdFn = builder({"shift", "cmd"})

  -- shift/shift-cmd makes it work with selection as well
  hs.hotkey.bind({"alt"}, key, emptyFn, nil, emptyFn)
  hs.hotkey.bind({"alt", "shift"}, key, shiftFn, nil, shiftFn)
  hs.hotkey.bind({"alt", "cmd"}, key, cmdFn, nil, cmdFn)
  hs.hotkey.bind({"alt", "shift", "cmd"}, key, shiftCmdFn, nil, shiftCmdFn)
end

bindArrowKey("h", "left")
bindArrowKey("j", "down")
bindArrowKey("k", "up")
bindArrowKey("l", "right")
