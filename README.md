# Issue with `ng get/set` commands

## Summary of sequence of commands used to create Dockerfile


```bash
apt-get install -y nodejs
npm install -g @angular/cli
ng version
ng new tryGetSet
cd tryGetSet
```

## Instructions for running docker build
First setup angular/cli in docker by cloning this repo and running:

```bash
$ docker build -t my-ngcli-image .
```

Then,
To test that docker build correctly installed @angular/cli and created a fresh angular-cli project, run:

```bash
$ docker run -it --rm --name my-ngcli-container my-ngcli-image  /usr/local/bin/ng version
```
Expected Output:
```
    _                      _                 ____ _     ___
   / \   _ __   __ _ _   _| | __ _ _ __     / ___| |   |_ _|
  / △ \ | '_ \ / _` | | | | |/ _` | '__|   | |   | |    | |
 / ___ \| | | | (_| | |_| | | (_| | |      | |___| |___ | |
/_/   \_\_| |_|\__, |\__,_|_|\__,_|_|       \____|_____|___|
               |___/
@angular/cli: 1.0.0
node: 6.10.2
os: linux x64
@angular/common: 4.0.2
@angular/compiler: 4.0.2
@angular/core: 4.0.2
@angular/forms: 4.0.2
@angular/http: 4.0.2
@angular/platform-browser: 4.0.2
@angular/platform-browser-dynamic: 4.0.2
@angular/router: 4.0.2
@angular/cli: 1.0.0
@angular/compiler-cli: 4.0.2
```

To reproduce the `ng get` issue run:
```bash
$ docker run -it --rm --name my-ngcli-container my-ngcli-image  /usr/local/bin/ng get apps.0.root
```
Expected Output is `src`

Actual Output is `Value cannot be found.`

To reproduce the `ng set` issue run:
```bash
$ docker run -it --rm --name my-ngcli-container my-ngcli-image  /usr/local/bin/ng set apps.0.prefix newpfx
```
Problematic Output is `Value cannot be found.`
