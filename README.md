# Base Devbox Repository

Goal is for a repository that can be used as a baseline for future projects where devbox is primary way of handling the installation of build tools etc.


## Maintenance

Have devbox installed and run:

```bash
devbox run setup
```

This will set up the git hooks and the ```git cz``` alias.

You can make commits via passing in arguments to ```git cz``` as you would to cocogitto:

```bash
git cz feat "first commit message"
```

## Usage

```bash
./create_repo.sh /home/path/to/new/repo
```

> NOTE: it will create the path to the destination if needed

Then setup the repo via:

```bash
cd /home/path/to/new/repo

git init

echo "# <Repo Title>\n\nTODO" > README.md

devbox run setup

```

