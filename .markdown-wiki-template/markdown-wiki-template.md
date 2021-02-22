# markdown wiki template

This is a template to be cloned to quickly set up a repository for keeping documentation in [Markdown](https://en.wikipedia.org/wiki/Markdown).

Specifically, it arranges how image files are handled.

Additionally, it provides some handy settings for VS Code users.

You may remove `.markdown-wiki-template` directory if you don't need this documentation.

**Table of content:**

- [Prerequisites](#prerequisites)
- [Get started](#get-started)
- [Images](#images)
  - [`.images` directory](#images-directory)
  - [`pre-commit` hook](#pre-commit-hook)
- [markdownlint](#markdownlint)
- [VS Code](#vs-code)
  - [VS Code internal settings](#vs-code-internal-settings)
  - ["Paste Image" extenstion](#paste-image-extenstion)
  - ["Markdown All in One" extension](#markdown-all-in-one-extension)
  - ["markdownlint" extension](#markdownlint-extension)

## Prerequisites

- OS: GNU Linux / Mac (though it's not tested for Mac yet - it _**should**_ work there)
- `git` available on `$PATH`

## Get started

Download this repository to your local machine:

```shell
git clone https://github.com/vsudakov/markdown-wiki-template.git
```

## Images

### `.images` directory

Keep all images in `.images` directory of the project root. This allows moving markdown documents across any subdirectories without the need to update links to images.

Regardless of where the markdown page is placed within the repository, all image links are related to the project root as below:

```markdown
![img](/.images/sample-image.png)
```

![img](/.images/sample-image.png)

### `pre-commit` hook

`pre-commit` hook automatically detects the image files that are not referenced anywhere within the repository anymore and removes them.

To enable this `pre-commit` hook - run the following command within the project root directory:

```shell
chmod 755 .images/untrack-unused-images.sh; \
ln --symbolic ../../.images/untrack-unused-images.sh .git/hooks/pre-commit
```

## markdownlint

- usage of style checker ([like this](https://github.com/DavidAnson/markdownlint)) which detects styling issues - is highly-appreciated

## VS Code

For [VS Code](https://code.visualstudio.com/) plenty of settings and extensions are available to simplify work with Markdown. The below is the list of the selected settings/extensions.

EXTENSIONS ARE NOT INSTALLED AUTOMATICALLY - each extension needs to be installed individually. But the configuration for each extension is applied automatically.

Proposed VS Code **workspace** settings are located in [/.vscode/settings.json](/.vscode/settings.json). These settings include both vs-code-internal and extenstion-specific settings.

You may remove [/.vscode/](/.vscode/) directory if you don't use VS Code.

### VS Code internal settings

- auto-save files [/.vscode/settings.json#L9-L10](/.vscode/settings.json#L9-L10)
- render new-lines on Markdown Preview (as github does) [/.vscode/settings.json#L12-L13](/.vscode/settings.json#L12-L13)

### "Paste Image" extenstion

home page: [https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image)

installation from command palette (`Ctrl + P`): `ext install mushan.vscode-paste-image`

allows pasting images from the clipboard directly into Markdown document by pressing `Ctrl + Alt + V` (by default).

Every image is automatically saved in `/.images/` directory using an automatically-generated name and the project-root-related-link to that is pasted in the current markdown document.

Preferences for this extension: [/.vscode/settings.json#L17-L31](/.vscode/settings.json#L17-L31)

### "Markdown All in One" extension

home page: [https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)

installation from command palette (`Ctrl + P`): `ext install yzhang.markdown-all-in-one`

among those numerous features what this extension provides - there is one extra useful to generate/update a table of content.

Preferences for this extension: [/.vscode/settings.json#L35-L40](/.vscode/settings.json#L35-L40)

### "markdownlint" extension

home page: [https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

installation from command palette (`Ctrl + P`): `ext install DavidAnson.vscode-markdownlint`

aforementioned [markdownlint style checker](#markdownlint) is available as [a plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint).
