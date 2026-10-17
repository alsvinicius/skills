# How to update a skill

1. Identify the skill package and read its `SKILL.md` plus every resource it links to.
2. Edit the authoritative instruction or supporting file in place. Keep supporting files inside the package that uses them.
3. Update relative links and documentation references when moving or renaming files.
4. Review the diff for accidental personal data, secrets, machine-specific paths, and unlicensed third-party material.
5. If evaluation JSON changed, validate its syntax with `python3 -m json.tool path/to/evals.json`.
6. Check every referenced path manually and describe any evaluation that was not run.
7. Open a pull request for review; confirm with maintainers whether larger changes need an issue first.

The repository has no declared licence and no bundled skill evaluation runner. See [contributor guidance](../../CONTRIBUTING.md) before proposing a release or redistributing third-party content.
