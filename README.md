# Quartz v4 Template for GitHub pages

[Quartz][] is a set of tools that helps you publish your [digital garden](https://jzhao.xyz/posts/networked-thought) and notes as a website for free.

This template repository

- wraps [Quartz][] by Jacky Zhao into a git submodule to integrate with dependabot updates.
- builds the website from the notes and publishes to GitHub pages by GitHub actions.
- is [Obsidian](https://obsidian.md/)-friendly (thanks to [Quartz][]). Open the `content` folder as an Obsidian vault.

[Quartz]: https://github.com/jackyzha0/quartz

## How-to

Click the big green `Use this template` button to create a repository. Clone the created repository using GitHub Desktop or the `git clone` command:

```bash
git clone --recursive https://github.com/$USER/$REPO.git
```

Open the `content` folder as an Obsidian vault, edit/add notes and use GitHub Desktop or `git push` command to commit and push the changes to GitHub. GitHub actions will build and publish the website automatically.

> [!IMPORTANT]
> You need to enable GitHub pages in your repository settings -> pages -> selecting `GitHub actions` as the source.

## Preview your Quartz website

(See [Building your Quartz](https://quartz.jzhao.xyz/build) for details)

```bash
cd quartz
npm i
npx quartz build -d ../content --serve
```

You can open the `content` folder in Obsidian (or other editors) to edit/add your notes. After that, use GitHub Desktop or `git push` command to commit and push the changes to GitHub. GitHub actions will build and publish the website automatically.

> [!IMPORTANT]
> You need to enable GitHub pages in your repository settings -> pages -> selecting `GitHub actions` as the source.

## Cloudflare pages settings

[Cloudflare pages](https://dash.cloudflare.com/) build configurations:

- Framework preset: `None`
- Build command : `cp quartz.config.ts quartz.layout.ts quartz/ && cd quartz && npm ci && npx quartz build --directory ../content`
- Build output directory: `quartz/public`
