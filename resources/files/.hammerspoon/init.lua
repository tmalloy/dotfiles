
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


-- CtrlP in vim relies on f5 to refresh search results
ctrl5F5 = function()
  hs.eventtap.keyStroke({}, "f5", 0)
end
hs.hotkey.bind({"ctrl"}, "5", ctrl5F5, nil, ctrl5F5)


--
--
-- left/down/right up movement/selection
--
--

--doublePressWatcher = require("doublePressWatcher")
--altWatcher = doublePressWatcher.newWatcher("alt")
--
--bindArrowKey = function(key, direction)
--  local builder = function(modifiers)
--
--    -- because we're using the alt key to access these shortcuts, we take away
--    -- the useful properties of the alt key (moving by word instead of letter).
--    -- So make a double press of alt add it back in.
--    local modifiersWithAlt = {table.unpack(modifiers)}
--    table.insert(modifiersWithAlt, "alt")
--
--
--    return function()
----        print(table.concat(modifiers, ", "))
----        print(table.concat(modifiersWithAlt, ", "))
----        print()
--      
----      foregroundApp = hs.application.frontmostApplication():name()
----      if foregroundApp == "iTerm2" then
------        print(table.concat(modifiersWithAlt, ", "))
----        print("(" .. table.concat(modifiersWithAlt, ", ") .. ") " .. key)
----        hs.eventtap.keyStroke({"alt"}, key, 0) -- doesn't work why????
----      elseif altWatcher.doublePressed then
--        print("(" .. table.concat(modifiersWithAlt, ", ") .. ") " .. direction)
--        hs.eventtap.keyStroke(modifiersWithAlt, direction, 0)
----      else
----        print("sending modifiers")
----        for k, v in pairs(modifiers) do
----          print(v)
----        end
----        hs.eventtap.keyStroke(modifiers, direction, 0)
----      end
--    end 
--  end
--
--  emptyFn = builder({})
--  shiftFn = builder({"shift"})
--  cmdFn = builder({"cmd"})
--  shiftCmdFn = builder({"shift", "cmd"})
--  cmdCtrlFn = builder({"cmd", "ctrl"})
--
--  -- shift/shift-cmd makes it work with selection as well
--  hs.hotkey.bind({"alt"}, key, emptyFn, nil, emptyFn)
--  hs.hotkey.bind({"alt", "shift"}, key, shiftFn, nil, shiftFn)
--  hs.hotkey.bind({"alt", "cmd"}, key, cmdFn, nil, cmdFn)
--  hs.hotkey.bind({"alt", "shift", "cmd"}, key, shiftCmdFn, nil, shiftCmdFn)
--  hs.hotkey.bind({"alt", "cmd", "ctrl"}, key, cmdCtrlFn, nil, cmdCtrlFn)
--end

--bindArrowKey("b", "left")
--bindArrowKey("f", "right")

deleteWord = function()
  hs.eventtap.keyStroke({"alt"}, "forwarddelete", 0)
end
hs.hotkey.bind({"alt"}, "d", deleteWord, nil, deleteWord)



leftClickRunelite = function(modifiers)
  if hs.application.frontmostApplication():title() == "RuneLite" then
    print("left click")
  else
    hs.eventtap.keyStroke({}, "z", 0)
  end
end

rightClickRunelite = function(modifiers)
    hs.eventtap.keyStroke({}, "x", 0)
  if hs.application.frontmostApplication():title() == "RuneLite" then
  else
    hs.eventtap.keyStroke({}, "x", 0)
  end
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


-- TODO: need to track and update mouse position while dragging

-- Create a new hotkey
local runeliteLeftClick = hs.hotkey.new({}, "z", function()
--    hs.eventtap.leftClick(hs.mouse.absolutePosition(), 10)
    local pos = hs.mouse.absolutePosition()
    print("left down " .. table.concat(pos, ","))
    print(table.concat(pos, ","))
    print(dump(pos))
    hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, pos):post()
end, function()
    local pos = hs.mouse.absolutePosition()
    print("left up " .. table.concat(pos, ","))
    hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, pos):post()
end)

local runeliteRightClick = hs.hotkey.new({}, "x", function()
    print("right click")
    hs.eventtap.rightClick(hs.mouse.absolutePosition(), 10)
end)

local RuneliteFilter = hs.window.filter.new("Finder")

RuneliteFilter
    :subscribe(hs.window.filter.windowFocused, function()
        runeliteLeftClick:enable()
        runeliteRightClick:enable()
    end)
    :subscribe(hs.window.filter.windowUnfocused, function()
        runeliteLeftClick:disable()
        runeliteRightClick:disable()
    end)

--hs.hotkey.bind({}, "z", leftClickRunelite, nil, leftClick)
--hs.hotkey.bind({}, "x", rightClickRunelite, nil, leftClick)


