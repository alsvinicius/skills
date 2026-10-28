# Try a skill from this repository

This tutorial copies one bundled skill into a directory scanned by an Agent Skills-compatible host. It assumes you have cloned this repository and have a shell available.

1. Choose a skill and read its `SKILL.md`, including any linked resources it needs.
2. Find the skills directory and refresh procedure for your agent in its documentation. The open format does not standardise host discovery paths.
3. Set `AGENT_SKILLS_DIR` to that directory and run these commands from the repository root (replace the example skill name as needed):

   ```sh
   skill_name="uniao-sinistra"
   test -n "$AGENT_SKILLS_DIR" || { echo "Set AGENT_SKILLS_DIR to your agent's skills directory" >&2; exit 1; }
   mkdir -p "$AGENT_SKILLS_DIR/$skill_name"
   cp -R "skills/$skill_name/." "$AGENT_SKILLS_DIR/$skill_name/"
   ```

4. Refresh or restart the agent if it does not discover the skill.
5. Start a conversation with a task that matches the skill. Review its instructions and confirm they fit your project before authorising repository changes.

The skill should be treated as guidance, not as evidence that its suggested commands or project assumptions apply to every repository. Hosts may differ in how they discover, activate, or interpret skill files. For package paths and repository limitations, see the [reference](../reference/repository-layout.md) and the [Agent Skills specification](https://agentskills.io/specification).
