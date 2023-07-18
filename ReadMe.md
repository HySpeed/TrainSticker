# Train Sticker

A Factorio mod to attach a 'sticker' label to a train locomotive.

Thanks to GotLag for 'Renamer' and the functions from that were used.

## Usage

* Hover the cursor over a locomotive and press the hot-key
* Dialog will prompt for text and color to display
* Text will be attached to the locomotive and move with it

## Concerns

* Will this cause UPS issues?

## Future

* Can this be tied to a redeem? bits?
  * e.g. Redeem -> find available train -> attach sticker

* Can this be attached to a train in the Map View / Train View screen?

--------------------------------------------------------------------------------

## Helpful commands

### Setup

* /sc game.player.surface.always_day=true;

### Items

* /sc game.player.insert{name="rail",        count=100}
      game.player.insert{name="locomotive",  count=10}
      game.player.insert{name="cargo-wagon", count=10}
      game.player.insert{name="rocket-fuel", count=10}
