-- Train Sticker
-- Apply a sticker to a locomotive

-- thanks to GotLag for 'Renamer' and the functions from that were used.
-- thanks to Aeodin for the graphics


local Constants  = require( "common.constants"   )
local Utils      = require( "common.utils" )
local Sticker   = require( "modules.sticker" )
local StickerUI = require( "modules.sticker_ui" )

-- =============================================================================

local function onLoad()
end

-- =============================================================================

script.on_init( function()
  global = global or {}
  global.stickers = {}
  global.stickers.selected = {}
  Utils.skipIntro()
  onLoad()
end )

-- -----------------------------------------------------------------------------

script.on_load( onLoad )

-- -----------------------------------------------------------------------------

script.on_event( defines.events.on_gui_click, function( event )
  if event.element.name == "sticker_cancel" then
    StickerUI.destroy_sticker_frame( event )
  elseif event.element.name == "sticker_save" then
    Sticker.saveSticker( event )
  end
end )

-- -----------------------------------------------------------------------------

-- Enter is pressed in a Lua GUI
script.on_event( defines.events.on_gui_confirmed, function( event )
  if event.element.name == "sticker_textfield" or
     event.element.name == "sticker_rgb_r_textfield" or
     event.element.name == "sticker_rgb_g_textfield" or
     event.element.name == "sticker_rgb_b_textfield" then
    Sticker.saveSticker( event )
  end
end )

-- -----------------------------------------------------------------------------

-- Escape is pressed in a Lua GUI
script.on_event( defines.events.on_gui_closed, function(event)
  if  event.element and
    ( event.element.name == "sticker_textfield" or
      event.element.name == "sticker_rgb_r_textfield" or
      event.element.name == "sticker_rgb_g_textfield" or
      event.element.name == "sticker_rgb_b_textfield" ) then
    StickerUI.destroy_sticker_frame( event )
  end
end)

-- -----------------------------------------------------------------------------

script.on_event( "sticker", function( event )
  if not event.player_index then return end
  local player = game.players[event.player_index]
  if not player then return end
  local selected = player.selected
  if not selected then return end
  if selected and selected.type == Constants.LOCOMOTIVE then
    global.stickers.selected[event.player_index] = selected
    StickerUI.onGuiOpened( event )
  end
end )

-- =============================================================================
