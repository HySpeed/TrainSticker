-- Utility functions

local Constants  = require( "common.constants"   )

local Utils = {}

-- =============================================================================

function Utils.getColor( player )
  local rgb_flow = player.gui.screen.sticker_ui.sticker_content_flow.sticker_content_rgb_flow
  local r = math.min( tonumber( rgb_flow.sticker_r_flow.sticker_rgb_r_textfield.text ), 255 )
  local g = math.min( tonumber( rgb_flow.sticker_g_flow.sticker_rgb_g_textfield.text ), 255 )
  local b = math.min( tonumber( rgb_flow.sticker_b_flow.sticker_rgb_b_textfield.text ), 255 )
  local color = {r = r, g = g, b = b}

  return color
end

-- -----------------------------------------------------------------------------

function Utils.skipIntro()
  if Constants.DEV_MOD then
    if remote.interfaces["freeplay"] then -- In "sandbox" mode, freeplay is not available
      remote.call( "freeplay", "set_disable_crashsite", true ) -- removes crashsite and cutscene start
      remote.call( "freeplay", "set_skip_intro", true )        -- Skips popup message to press tab to start playing
    end
  end
end

-- =============================================================================

return Utils
