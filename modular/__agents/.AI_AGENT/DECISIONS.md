# DECISIONS

- Feature-owned definitions live in modular/cm_pve/code/upp_forecon where the target architecture allows it.
- Existing CM-PVE core stays in place and upstream files receive only required integration with SS220 markers.
- Use target RTO and uppcap type hierarchies.
- Port the source Type-71S on `/type71/carbine`, retain `/recon` for its FORECON attachment preset, and move the pre-existing Type 71MS Commando behavior to `/type71/carbine/commando`; redirect legacy Commando presets to that subtype.
- Keep separate forecon_upp uniform and upp/forecon cargo vendors.
- Reconstruct DMI files by three-way state merge using the source PR base, the BandaTroopers base, and the PR head.
- Preserve target-side versions for conflicting existing states unless the PR intentionally changes the state used by the port.
- Merge DMM objects surgically and port all supporting area, shuttle, camera, squad, and radio datums.
- Port the PR's CANC random loadouts and every other applicable source change because the user explicitly requires the entire PR.
- Implement the complete SPP-48M family instead of substituting another rifle or leaving undefined references.
- Treat PR #113 Laituri and Korobka geometry and areas as authoritative by explicit user request, then apply only required BandaTroopers path adaptations.
