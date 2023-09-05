# Quartz v4 Template for GitHub pages

[Quartz][] is a set of tools that helps you publish your [digital garden](https://jzhao.xyz/posts/networked-thought) and notes as a website for free.

This template repository

- uses [Quartz][] by Jacky Zhao as a git submodule to catch up its rapid development.
- builds the website from the notes and publishes to GitHub pages by GitHub actions.
- is [Obsidian](https://obsidian.md/)-friendly (thanks to [Quartz][]). Just open the `content` folder in Obsidian.

[Quartz]: https://github.com/jackyzha0/quartz

## Easiest way to use (without using Quartz locally)

Click the big green `Use this template` button to create a repository. Clone the created repository using GitHub Desktop or `git clone` command:

```bash
git clone https://github.com/<username>/<reponame>.git
```

Open the `content` folder in Obsidian, edit/add notes and use GitHub Desktop or `git push` command to commit and push the changes to GitHub. GitHub actions will build and publish the website automatically.

> [!IMPORTANT]
> You need to enable GitHub pages in your repository settings -> pages -> selecting `GitHub actions` as the source.

## How to use Quartz locally

Click the big green `Use this template` button to create a repository.

Since this repository has [Quartz][] as a submodule, if you want to use quartz to build/preview the website, you need to clone both the repository and the submodule:

```bash
git clone --recursive https://github.com/<username>/<reponame>.git
```

To run Quartz in preview mode (See [Building your Quartz](https://quartz.jzhao.xyz/build) for details)

```bash
cd quartz
npm i
npx quartz build -d ../content --serve
```

You can open the `content` folder in Obsidian (or other editors) to edit/add your notes. After that, use GitHub Desktop or `git push` command to commit and push the changes to GitHub. GitHub actions will build and publish the website automatically.

> [!IMPORTANT]
> You need to enable GitHub pages in your repository settings -> pages -> selecting `GitHub actions` as the source.

## Cloudflare pages

[Cloudflare pages](https://dash.cloudflare.com/) build configurations:

- Framework preset: `None`
- Build command : `cp quartz.config.ts quartz.layout.ts quartz/ && cd quartz && npm ci && npx quartz build --directory ../content`
- Build output directory: `quartz/public`
