# PLAN

## Active Task
Fully port and adapt RU-CMSS13/cmss13-pve PR #113 (UPP Fox Stalkers FORECON) into BandaTroopers through a separate pull request.

## Contract
- MUST port every applicable change from all 99 files in PR #113, including SPP-48M, ammunition, attachments, balance changes, sprites, sounds, maps, areas, jobs, presets, vendors, shuttle systems, and UI integration.
- MUST keep separate FORECON uniform and cargo vendors.
- MUST adapt source paths and datums to the current BandaTroopers hierarchy.
- MUST preserve every pre-existing BandaTroopers DMI state and add only the PR states or intentionally adapted replacements.
- MUST restore visible armor, backpacks, and clothing sprites for every faction and make UPP uniforms visible in role previews.
- MUST include the PR's Laituri, Chapaev, and Korobka map content together with their areas, cameras, squads, radio, transit, and shuttle dependencies.
- MUST preserve existing BandaTroopers mechanics and map equipment.
- MUST verify through the repository build workflow plus map, resource, DMI, and old-path checks.
- MUST not add explanatory code comments; retain only repository-required SS220 EDIT markers in upstream files.
- KEEP existing CM-PVE core while adapting every missing or divergent PR #113 change; no source change may be silently omitted.
- REJECT whole-file replacement of divergent DMI or DMM files.
- REJECT invalid source-path aliases, partial code-only completion, and DMI rewrites that alter unrelated states.
- CHECK the complete source-file manifest against the port, old paths, duplicate definitions, icon states, sounds, maps, vendor separation, and runtime preview paths.

## Forbidden Substitutions
- No generic UPP vendor may replace the dedicated FORECON vendors.
- No new DMI may be based on the source fork alone; the BandaTroopers version is the preserved side of every merge.
- No unverified branch may be merged into PVE-MAPPING-KLOYN.

## Acceptance Criteria
- Repository compile succeeds with 0 errors and 0 warnings.
- Chapaev, Laituri, and Korobka map checks pass.
- All modified DMI files verify and unrelated target states match the base branch.
- UPP role preview and faction armor/backpack sprites have valid referenced states.
- Task-state files are absent from the PR.
- The verified branch is merged into local PVE-MAPPING-KLOYN.
