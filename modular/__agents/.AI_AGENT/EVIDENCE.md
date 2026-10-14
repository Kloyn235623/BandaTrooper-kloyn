# EVIDENCE

## Source
- RU-CMSS13/cmss13-pve PR #113, merge commit 6d6086b8abb0b7bb4e48a481a0dd41c2d2d9e7a8.
- Original cmss13-devs/cmss13-pve PR #1251.

## Discovery
- The repository already contains Fox Stalkers core jobs, squads, radio, Laituri/Korobka, rappel UI, and dropship integration.
- Missing content is weapons, equipment, dedicated vendor inventory, assets, and selected map placements.
- Source RTO and UPP cap paths differ from the target.
- The source NVG patch contains invalid AND and turf expressions; the adaptation fixes them.

## Plan-Mapping Challenge
- Cherry-pick, whole-DMI replacement, and whole-map replacement are rejected because target files diverge and contain local content.
- Native target paths are required instead of compatibility aliases.

## Old Path Audit
- cmcap/upp -> uppcap.
- ai/upp/rto -> ai/rto/upp.
- source Commando subtype -> existing target carbine plus recon subtype.

## Scope Update\r\n- User explicitly expanded scope to every PR #113 change and required the complete rifle implementation.\r\n- Previous selective omission of CANC changes is rejected.\r\n- A complete 99-file manifest comparison is required before completion.\r\n\r\n## Verification
- First BUILD.cmd: 17 compile errors captured for path and typing repair.
- Repair build, map checks, and final old-path scan are pending.
