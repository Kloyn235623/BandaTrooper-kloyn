# EVIDENCE

## Source
- RU-CMSS13/cmss13-pve PR #113 source range: 5708057c9c26b2702bbca7dca0150aa94dd4b7d9..1a60d5dc9319d2ed81d26b4073d838019e91c370.
- The source PR changes 99 files across code, maps, sprites, sounds, configuration, and UI.

## Discovery
- The initial port includes feature weapons, equipment, vendors, sounds, and selected map placements.
- Missing current-branch integration includes source-touched area, squad, camera, shuttle, transit, radio, and map support files.
- The source adds Laituri and Korobka resources and modifies Chapaev.
- The target already contains some equivalent systems, so source lines require semantic reconciliation instead of blind copying.
- Users report that many armor, backpack, and clothing sprites no longer render and that UPP uniforms are absent from role previews.
- Current DMI files were rewritten during state import and must be reconstructed from the BandaTroopers base to guarantee preservation of unrelated states.
- The source PR modifies three DMI files that were absent from the current port manifest: both UPP suit atlases and screen_alert_images.dmi.
- Source RTO and UPP cap paths differ from the target.
- The source NVG patch contains invalid AND and turf expressions; the adaptation must retain the corrected target behavior.

## Plan-Mapping Challenge
- Cherry-picking or whole-file replacement is rejected because the forks diverge and the current branch already contains adapted feature code.
- DMI repair must use a three-way state merge with the target base as preserved content; source-head file replacement is forbidden.
- Map content requires both DMM objects and reachable supporting datums. Map-only placement is insufficient.
- Existing target mechanics and sprites are KEEP items. Source-only path aliases and overwriting target atlases are REJECT items.

## Old Path Audit
- cmcap/upp -> uppcap.
- ai/upp/rto -> ai/rto/upp.
- source Commando subtype -> existing target carbine plus recon subtype.

## Verification
- Test compile before expanded repair: colonialmarines.test.dmb, 0 errors, 0 warnings.
- Full unit-test process is still running while the expanded map and sprite repair begins.
- Final compile, map checks, DMI checks, and manifest reconciliation are pending.
