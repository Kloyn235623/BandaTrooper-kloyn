# DECISIONS

- Feature-owned definitions live in modular/cm_pve/code/upp_forecon.
- Existing CM-PVE core stays in place.
- Use target RTO and uppcap type hierarchies.
- Preserve the existing Type 71 Commando and add a separate recon subtype.
- Keep separate forecon_upp uniform and upp/forecon cargo vendors.
- Merge DMI states and DMM objects surgically.
- Port the PR's CANC random-loadout and every other source change because the user explicitly requires the entire PR; adapt conflicts without changing unrelated target content.\r\n- Implement the complete SPP-48M family instead of substituting MG82 flags or leaving an undefined parent reference.
