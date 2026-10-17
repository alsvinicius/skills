# Try a skill from this repository

This tutorial installs both bundled skills in the default Codex skills directory. It assumes you have cloned this repository and have a shell available.

1. Read both skills' `SKILL.md` files from beginning to end, including their linked resources.
2. Run these commands from the repository root:

   ```sh
   skills_dir="${CODEX_HOME:-$HOME/.codex}/skills"
   mkdir -p "$skills_dir/product-dev-workflow" "$skills_dir/open-source-preparation"
   cp SKILL.md "$skills_dir/product-dev-workflow/"
   cp -R assets references evals "$skills_dir/product-dev-workflow/"
   cp -R open-source-preparation/. "$skills_dir/open-source-preparation/"
   ```

3. Refresh or restart Codex if it does not discover the skills.
4. Start a conversation with a task that matches one skill. Review the instructions and confirm they fit your project before authorising repository changes.

The skill should be treated as guidance, not as evidence that its suggested commands or project assumptions apply to every repository. For package paths and repository limitations, see the [reference](../reference/repository-layout.md). The install location follows the `${CODEX_HOME:-$HOME/.codex}/skills` convention shown in [OpenAI's Codex workflow documentation](https://developers.openai.com/cookbook/examples/codex/iterating-development-workflows-with-codex).
