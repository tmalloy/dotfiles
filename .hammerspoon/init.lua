
--  hs.notify.new({title="Hammerspoon", informativeText="Hello World" .. vol }):send()

--
--
-- Volume
--
--

hs.hotkey.bind({"cmd", "shift"}, "h", function()
  local muted = hs.audiodevice.defaultOutputDevice():outputMuted()
  hs.audiodevice.defaultOutputDevice():setOutputMuted(not muted)
end)

volDown = function()
  local vol = hs.audiodevice.defaultOutputDevice():outputVolume()
  hs.audiodevice.defaultOutputDevice():setOutputVolume(vol - 5)
end

volUp = function()
  local vol = hs.audiodevice.defaultOutputDevice():outputVolume()
  hs.audiodevice.defaultOutputDevice():setOutputVolume(vol + 5)
end

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

bindArrowKey = function(key, direction)
  local builder = function(modifiers)
    return function()
      hs.eventtap.keyStroke(modifiers, direction, 0)
    end 
  end

  emptyFn = builder({})
  shiftFn = builder({"shift"})
  shiftCmdFn = builder({"shift", "cmd"})

  -- shift/shift-cmd makes it work with selection as well
  hs.hotkey.bind({"alt"}, key, emptyFn, nil, emptyFn)
  hs.hotkey.bind({"alt", "shift"}, key, shiftFn, nil, shiftFn)
  hs.hotkey.bind({"alt", "shift", "cmd"}, key, shiftCmdFn, nil, shiftCmdFn)
end

bindArrowKey("h", "left")
bindArrowKey("j", "down")
bindArrowKey("k", "up")
bindArrowKey("l", "right")
