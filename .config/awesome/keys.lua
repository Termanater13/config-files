  -- import awesome modules
local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
  -- imoprt user modules
local userSet = require("userSet")
local keyFunc = require("keyFunc")

  -- set up return variable
local keys = {}
  -- function shortens mod key declerations
function mod(m)
  local result = {}
  local mods = {}
  for match in (m.."-"):gmatch("(.-)-") do
    table.insert(mods,match)
  end
  for _,i in ipairs(mods) do
    if (i == "M") then
      table.insert(result, userSet.modkey)
    elseif (i == "S") and (userSet.modkey ~= "Mod4") then
      table.insert(result, "Mod4")
    elseif (i == "m" or i == "a") and (userSet.modkey ~= "Mod1") then
      table.insert(result, "Mod1")
    elseif (i == "c") and (userSet.modkey ~= "Control") then
      table.insert(result, "Control")
    elseif (i == "s") and (userSet.modkey ~= "Shift") then
      table.insert(result, "Shift")
    end
  end
  return result
end
  -- shorten key group and description table
function kgd(g,d)
  return {description=d, group=g}
end

  -- start keybindings here
keys.globalkeys = gears.table.join(
  awful.key(mod("M"),    "s",      keyFunc.awesome.showHelp,     kgd("awesome", "show help")),
  awful.key(mod("M"),    "Left",   keyFunc.tag.viewprev,         kgd("tag","view previous") ),
  awful.key(mod("M"),    "Right",  keyFunc.tag.viewnext,         kgd("tag","view next")),
  awful.key(mod("M"),    "Escape", keyFunc.tag.historyRestore,   kgd("tag","goback")),
  awful.key(mod("M"),    "j",      keyFunc.client.focus.idNext,  kgd("client","focus next by id") ),
  awful.key(mod("M"),    "k",      keyFunc.client.focus.idPrev,  kgd("client","focus previous by id") ),
  awful.key(mod("M"),    "Return", keyFunc.Launcher.runTerminal, kgd("Launcher","open a terminal") ),
  awful.key(mod("M-c"),  "r",      keyFunc.awesome.restart,      kgd("awesome","restart awesome") ),
  awful.key(mod("M-s"),  "q",      keyFunc.awesome.quit,         kgd("awesome","quit awesome") ),
  awful.key(mod("M"),    "l",      keyFunc.layout.incmwfact.inc, kgd("layout","increase master width factor") ),
  awful.key(mod("M"),    "h",      keyFunc.layout.incmwfact.dec, kgd("layout","decrease master width factor") ),
  awful.key(mod("M-c"),  "j",      keyFunc.screen.focus.next,    kgd("screen","focus the next screen") ),
  awful.key(mod("M-c"),  "k",      keyFunc.screen.focus.prev,    kgd("screen","focus the previous screen") )
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
  --  awful.key(mod("M-s-c"),"f",      function something="do" end,  kgd("group","description") ),
 )

return keys
