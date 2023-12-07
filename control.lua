-- Vehicle Sticker
-- Apply a sticker to a vehicle

-- thanks to GotLag for 'Renamer' and the functions from that were used.
-- thanks to Aeodin for the graphics


local Constants = require( "common.constants"   )
local Utils     = require( "common.utils" )
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

-- open gui dialog is clicked
script.on_event( defines.events.on_gui_click, function( event )
  if    event.element.name == "sticker_save" then
    Sticker.saveSticker( event )
  elseif event.element.name == "sticker_cancel" then
    StickerUI.destroy_sticker_frame( event )
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

-- Hotkey is pressed
script.on_event( "sticker", function( event )
  if not event.player_index then return end
  local player = game.players[event.player_index]
  if not player then return end
  local selected = player.selected
  if not selected then return end
  -- if    selected.type == Constants.LOCOMOTIVE
  --    or selected.type == Constants.CAR
  --    or selected.type == Constants.TANK
  --    or selected.type == Constants.SPIDERTRON
  --    or selected.type == Constants.CARGO_WAGON
  --    or selected.type == Constants.FLUID_WAGON
  --    or selected.type == Constants.ARTILLERY_WAGON
  --   then
  if Utils.isSupportedType( selected.type ) then
    global.stickers.selected[event.player_index] = selected
    StickerUI.onGuiOpened( event )
  end
end )

-- -----------------------------------------------------------------------------

-- Copy is pressed
-- If 'supported type' and existing_id, copy info for later paste
-- script.on_event( defines.input_action.copy_entity_settings, function( event )
--   game.print( "copy" )
-- end )
-- -- -----------------------------------------------------------------------------

-- -- Paste is pressed
-- -- if 'supported type' and info has been copied, paste info
-- script.on_event( defines.events.on_entity_settings_pasted , function( event )
--   game.print( "paste" )
-- end )

-- =============================================================================


-- data:extend{{
--   type = "custom-input",
--   name = "cw-build",
--   key_sequence = "",
--   linked_game_control = "build",
--   action = "lua"
-- }}

-- script.on_event("cw-build", function(event)
--   -- code removed for brevity
-- end)

