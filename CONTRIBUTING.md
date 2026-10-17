# Contributing

Contributions to the skill instructions, supporting resources, and repository documentation are welcome through a GitHub pull request to `alsvinicius/skills`. Confirm with the maintainers whether an issue should be opened first for larger changes; no formal issue or review policy is documented yet.

## Before submitting

1. Read the target skill's `SKILL.md` and linked resources.
2. Keep changes scoped to that skill and preserve its relative links and package structure.
3. Update relevant documentation when paths, behaviour, or contributor steps change.
4. Review the diff for secrets, personal information, machine-specific paths, and material whose redistribution rights are unclear.
5. Parse changed evaluation JSON files with `python3 -m json.tool path/to/evals.json`.
6. Check links and references manually. There is no bundled test or evaluation runner.

Do not add a licence or third-party material without confirming the relevant rights with the repository owner. The repository currently has no declared licence; this is an owner decision and a release blocker for an explicitly open-source release.
