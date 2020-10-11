-- impoirt awesome modules
--local awesome = require("awesome")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local userSet = require("userSet")
-- setup = return function
keyFunc = {}
  -- awesome tag
keyFunc.awesome = {}
keyFunc.awesome.showHelp = hotkeys_popup.show_help
keyFunc.awesome.restart = awesome.restart
keyFunc.awesome.quit = awesome.quit
  -- client tag
keyFunc.client = {}
keyFunc.client.focus = {}
keyFunc.client.focus.id = {}
keyFunc.client.focus.idnext = function () awful.client.focus.byidx(1) end
keyFunc.client.focus.idprev = function () awful.client.focus.byidx(-1) end
  -- Launcher tag
keyFunc.Launcher = {}
keyFunc.Launcher.runTerminal = function () awful.spawn(userSet.terminal) end
  -- tag tag
keyFunc.tag = {}
keyFunc.tag.viewprev = awful.tag.viewprev
keyFunc.tag.viewnest = awful.tag.viewnext
--keyFunc.tag.historyRestore
  -- layout tag
keyFunc.layout = {}
keyFunc.layout.incmwfact = {}
keyFunc.layout.incmwfact.inc = function () awful.tag.incmwfact( 0.05) end
keyFunc.layout.incmwfact.dec = function () awful.tag.incmwfact(-0.05) end
  -- screen tag
keyFunc.screen = {}
keyFunc.screen.focus = {}
keyFunc.screen.focus.next = function () awful.screen.focus_relative( 1) end
keyFunc.screen.focus.prev = function () awful.screen.focus_relative(-1) end
return keyFunc
