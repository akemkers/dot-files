# Oppsett av Mac

Updated: February 15, 2024 9:30 AM
Created: August 16, 2021 3:47 PM

Denne guiden beskriver hvordan man setter opp en Mac. 

## Generelle ting å huske for mac i SB1

- Bruker ikke Apple ID, installerer alt gjennom Homebrew isteden.
- Følg først guiden for [Oppsett av Mac hos SB1U](https://sb1u.atlassian.net/wiki/spaces/MAC/pages/352616452/Sette+opp+utviklingsmilj+p+Mac)
- Er det noe galt med starting av hostfile-gen? Måtte starte manuelt med `bob docker hostsfilegen start`
- Gitt min egen bruker skrivetilgang til hosts fila: `sudo chmod u+w /etc/hosts`
- OBS! Husk å konfigurere `provision-dev` først. (./provision.sh)
- Det var en del problemer med å kjøre provision-dev. Her hjalp det å være tålmodig. Kjørte mange ganger før det var helt OK.

## SSH nøkkel

```bash
mkdir ~/.ssh 
cd ~/.ssh 
eval $(ssh-agent)
ssh-keygen -t ed25519 -b 4096 -C «[Andreas.foldvik.kemkers@sparebank1.no](mailto:Andreas.foldvik.kemkers@sparebank1.no)» -f id_rsa
ssh-add id_rsa

```

### SSH agent

Setter opp starting av ssh agent og adding av ssh keys ved start av terminal:

```bash
# SSH Agent should be running, once
if ! ps -ef | grep "[s]sh-agent" &>/dev/null; then
echo Starting SSH Agent
eval $(ssh-agent -s)
fi

# Add identities if none are added
if ! ssh-add -l &>/dev/null; then
echo Adding identities to SSH Agent
ssh-add -t 1d
fi

```
- Legg deretter til pub key i brukerinnstillinger i stash

## Brew

Installer følgende:

- **rectangle** (For å styre vinduer) -  `brew install rectangle`
- **shottr** (Bedre screenshotting) Endret Shortcut for screenshot til `cmd + shift + s`
- **maccy** (clip board manager for Mac) Endret shortcut til `cmd + shift + v`

## iTerm2

Installer iTerm2 og endre følgende i preferanser (cmd + ,)

- Profiles -> Text -> Font -> Menlo 
- Profiles -> Text -> Font -> Størrelse 14
- Profiles -> Window -> Settings for new Windows -> Columns: 300, Rows: 50
- Appearance -> General -> Theme -> Minimal
- Advanced -> Søk: in the minimal theme how prominent should the tab outline be? -> 0.1


Last ned Snazzy theme:
```bash
(curl -Ls https://raw.githubusercontent.com/sindresorhus/iterm2-snazzy/main/Snazzy.itermcolors > /tmp/Snazzy.itermcolors && open /tmp/Snazzy.itermcolors)
```

Aktiver det med:
Profiles -> Color Presets -> Snazzy


### Oh my zsh

Installer ohmyzsh og zplug:

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zplug
brew install zplug
```

Legg til følgende i `zshrc`: 

```bash
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

zplug load
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
```

Resource zshrc og trykk y for å innstallere plugins

### Bashrc

Har hatt problem med at bash blir kjørt isteden for zsh, feks gjennom intellij subprosesser. Da må homebrew scripts lastes for bash i tillegg. Lag en `.bashrc` med følgende

```jsx
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### (SpareBank1) Aktiver bash kommandoer (bob etc)


```bash
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Bob commands
[ -f /Users/andreas.foldvik.kemkers/opt/etc/shrc ] && . /Users/andreas.foldvik.kemkers/opt/etc/shrc
```


## Innstillinger i OSX

Endre følgende:

- Tracking speed på mus, og cursor på tastatur.
- I “Trackpad” Enabler `App expose` under “More gestures”. Swipe ned med tre fingre for å se alle aktive vinduer for en gitt app
- i “Desktop & Dock”, sett “Automatically hide and show the dock.
- Fjerne delay på dock åpning:

```
defaults write com.apple.dock autohide-delay -float 0.2
defaults write com.apple.dock autohide-time-modifier -float 0.2
killall Dock

```

## IntelliJ

Importer settings fra [dot-files](https://github.com/akemkers/dot-files/tree/main/intellij/settings) 
File -> Manage IDE Settings -> Import settings

## Browser extensions

- Vimium
- JSON formatter
- React

### Ønsket programvare

- Shottr - screenshots
- Maccey - clipboard
- Rectangle
- Logi Options + (for å reverse scroll og få smooth scroll)
