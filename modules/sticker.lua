-- Sticker module
-- processes sticker event

local Utils     = require( "common.utils" )
local StickerUI = require( "modules.sticker_ui" )

local Sticker = {}

-- =============================================================================

function Sticker.applySticker( selected, stickerText, color )

  local existing_id = global.stickers[selected.unit_number]
  if existing_id then rendering.destroy( existing_id ) end

  local render_id = rendering.draw_text({
    alignment = "center",
    color     = color,
    scale     = 2,
    scale_with_zoom = true,
    surface   = selected.surface,
    target    = selected,
    target_offset = { 0.0, -1.0 },
    text      = stickerText
  })

  global.stickers[selected.unit_number] = render_id -- store the render id for later reference
end

-- -----------------------------------------------------------------------------

function Sticker.saveSticker( event )
  local selected = global.stickers.selected[event.player_index]
  local player = game.players[event.player_index]
  local stickerText = player.gui.screen.sticker_ui.sticker_content_flow.sticker_content_name_flow.sticker_textfield.text
  local color = Utils.getColor( player )
  Sticker.applySticker( selected,  stickerText, color )
  StickerUI.destroy_sticker_frame( event )
end

-- =============================================================================

return Sticker
