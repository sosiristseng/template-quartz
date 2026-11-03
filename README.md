# Quartz v5 Template for GitHub pages

[Quartz][] is a set of tools that helps you publish your [digital garden](https://jzhao.xyz/posts/networked-thought) and notes as a website for free.

This template repository

- builds the website from the notes and publishes to GitHub pages by GitHub actions, using [quartz-action][] and a Quartz version pinned in `quartz.version`.
- keeps the pinned Quartz fresh: a weekly workflow opens a pull request when a newer version is available.
- is [Obsidian](https://obsidian.md/)-friendly (thanks to [Quartz][]). Open the `content` folder as an Obsidian vault.

[Quartz]: https://github.com/jackyzha0/quartz
[quartz-action]: https://raven-wing.github.io/quartz-action/

## How-to

Click the big green `Use this template` button to create a repository. Clone the created repository using GitHub Desktop or the `git clone` command:

```bash
git clone https://github.com/$USER/$REPO.git
```

Open the `content` folder as an Obsidian vault, edit/add notes and use GitHub Desktop or `git push` command to commit and push the changes to GitHub. GitHub actions will build and publish the website automatically.

> [!IMPORTANT]
> You need to enable GitHub pages in your repository settings -> pages -> selecting `GitHub actions` as the source.

> [!NOTE]
> If you cloned an older revision of this template, when Quartz was a git submodule, remove the leftover: `git submodule deinit -f runtime && git rm -f runtime && rm -rf .git/modules/runtime`.

## Preview your Quartz website

(See [Building your Quartz](https://quartz.jzhao.xyz/build) for details)

```bash
./preview.sh
```

The script checks out the pinned Quartz into `.quartz-preview/` (gitignored) and serves the site at `http://localhost:8080`. You can open the `content` folder in Obsidian (or other editors) to edit/add your notes while previewing.

## Updating the Quartz version

Every week a workflow checks [Quartz][] `v5` and opens a pull request updating `quartz.version` when it moved. The website build runs on that pull request; merge it manually once it passes. To update on your own schedule, edit the commit SHA in `quartz.version`.
