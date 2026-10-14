# PLAN

## Active Task
Port RU-CMSS13/cmss13-pve PR #113 (UPP Fox Stalkers FORECON) into BandaTroopers through a separate pull request.

## Contract
- MUST port every change from all 99 files in PR #113, including SPP-48M, ammunition, attachments, balance changes, sprites, sounds, maps, jobs, presets, and vendors.
- MUST keep separate FORECON uniform and cargo vendors.
- MUST adapt source paths to the current BandaTroopers hierarchy.
- MUST merge DMI states without replacing unrelated sprites.
- MUST preserve existing BandaTroopers mechanics and map equipment.
- MUST verify with BUILD.cmd plus map/resource checks.\r\n- MUST not add explanatory code comments; retain only repository-required SS220 EDIT markers in upstream files.
- KEEP existing CM-PVE core while adapting every missing or divergent PR #113 change; no source change may be silently omitted.
- REJECT whole-file replacement of divergent DMI or DMM files.
- REJECT invalid source-path aliases and partial code-only completion.
- CHECK the complete source-file manifest against the port, plus old paths, duplicate definitions, icon states, sounds, maps, and vendor separation.

## Forbidden Substitutions
- No generic UPP vendor may replace the dedicated FORECON vendors.
- No unverified branch may be merged into PVE-MAPPING-KLOYN.

## Acceptance Criteria
- BUILD.cmd succeeds.
- Chapaev, Laituri, and Korobka checks pass.
- Task-state files are absent from the PR.
- The verified branch is merged into local PVE-MAPPING-KLOYN.
