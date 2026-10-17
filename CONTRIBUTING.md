# Contributing

Contributions to the skill instructions, supporting resources, and repository documentation are welcome through a GitHub pull request to `alsvinicius/skills`. Confirm with the maintainers whether an issue should be opened first for larger changes; no formal issue or review policy is documented yet.

## Before submitting

1. Read the target skill's `SKILL.md` and linked resources.
2. Keep changes scoped to that skill and preserve its relative links and package structure.
3. Update relevant documentation when paths, behaviour, or contributor steps change.
4. Review the diff for secrets, personal information, machine-specific paths, and material whose redistribution rights are unclear.
5. Parse changed evaluation JSON files with `python3 -m json.tool path/to/evals.json`.
6. Check links and references manually. There is no bundled test or evaluation runner.

The repository content is licensed under MIT; see [LICENSE](LICENSE). Before adding third-party material, confirm that its terms allow inclusion under MIT and retain any required attribution or notices. No separate contributor licence agreement is documented. See [licence and redistribution status](docs/reference/licensing-and-redistribution.md).
