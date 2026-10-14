# DECISIONS

- Feature-owned definitions live in modular/cm_pve/code/upp_forecon where the target architecture allows it.
- Existing CM-PVE core stays in place and upstream files receive only required integration with SS220 markers.
- Use target RTO and uppcap type hierarchies.
- Preserve the existing Type 71 Commando and add a separate recon subtype.
- Keep separate forecon_upp uniform and upp/forecon cargo vendors.
- Reconstruct DMI files by three-way state merge using the source PR base, the BandaTroopers base, and the PR head.
- Preserve target-side versions for conflicting existing states unless the PR intentionally changes the state used by the port.
- Merge DMM objects surgically and port all supporting area, shuttle, camera, squad, and radio datums.
- Port the PR's CANC random loadouts and every other applicable source change because the user explicitly requires the entire PR.
- Implement the complete SPP-48M family instead of substituting another rifle or leaving undefined references.
