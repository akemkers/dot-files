# Oppsett av Mac

Updated: February 15, 2024 9:30 AM
Created: August 16, 2021 3:47 PM

Denne guiden beskriver hvordan man setter opp en Mac. 

## Generelle ting å huske for mac i SB1

- Bruker ikke Apple ID, installerer alt gjennom Homebrew isteden.
- Følg først guiden for [Oppsett av Mac hos SB1U](https://sb1u.atlassian.net/wiki/spaces/MAC/pages/352616452/Sette+opp+utviklingsmilj+p+Mac)
- Er det noe galt med starting av hostfile-gen? Måtte starte manuelt med `bob docker hostsfilegen start`
- Gitt min egen bruker skrivetilgang til hosts fila: `sudo chmod u+w /etc/hosts` (18. juni. Ser ikke ut til å fungere lenger dette her)
- Hvis det over ikke fungerer så kan man kjøre vim i sudo mode for å editere den 
- OBS! Husk å konfigurere `provision-dev` først. (./provision.sh)
- Det var en del problemer med å kjøre provision-dev. Her hjalp det å være tålmodig. Kjørte mange ganger før det var helt OK.
- Support og hjelp finner man `#ext-mac-systemdrift`

## SSH tilgang til Stash/GitHub
For å koble til stash og Github uten å måtte skrive passordet hver gang. 
```bash
mkdir ~/.ssh 
cd ~/.ssh 
eval $(ssh-agent)
ssh-keygen -t ed25519 -b 4096 -C «[Andreas.foldvik.kemkers@sparebank1.no](mailto:Andreas.foldvik.kemkers@sparebank1.no)» -f id_rsa
ssh-add id_rsa

```
Husk også å sette riktig brukernavn (e-post) i git configen.  

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

- Legg deretter til pub key i brukerinnstillinger i stash og github

## Brew

Installer følgende:
- **rectangle** (For å styre vinduer) -  `brew install rectangle`
- **shottr** (Bedre screenshotting) Endret Shortcut for screenshot til `cmd + shift + s`
- **maccy** (clip board manager for Mac) Endret shortcut til `cmd + shift + v`
- **go** `brew install go`
- **rg** rip-grep trengs for at fuzzy søket i nvim skal fungere `brew install rg`t

## iTerm2

Installer iTerm2 og endre følgende i preferanser (cmd + ,)

- Profiles -> Window -> Settings for new Windows -> Columns: 300, Rows: 50
- Appearance -> General -> Theme -> Minimal
- Advanced -> Søk: in the minimal theme how prominent should the tab outline be? -> 0.1

### Terminal font
Last ned NerdFonts fonten som skal brukes i terminalen fra https://github.com/ryanoasis/nerd-fonts

```
brew install font-hack-nerd-font
```
Sett deretter opp fonten i preferences i Iterm2
- Profiles -> Text -> Font -> Nerd Fonts Mono 

Last ned Catppuccin Macchiato theme:
```bash
curl -Ls https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-macchiato.itermcolors > /tmp/catpuccin-macchiato.itermcolors && open /tmp/catpuccin-macchiato.itermcolors
```

Aktiver det med:
Profiles -> Color Presets -> Catppuccin Macchiato

### Oh my zsh

Installer ohmyzsh og zplug:

```bash
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zplug
brew install zplug
```

## dot-files
Klon dette repoet [dot-files](https://github.com/akemkers/dot-files)
Følg readme for å installere alle nødvendig dot-filer. 

## Innstillinger i OSX

Endre følgende:

- Tracking speed på mus, og cursor på tastatur.
- I “Trackpad” Enabler `App expose` under “More gestures”. Swipe ned med tre fingre for å se alle aktive vinduer for en gitt app
- i “Desktop & Dock”, sett “Automatically hide and show the dock.

Fjerne delay på dock åpning:
```
defaults write com.apple.dock autohide-delay -float 0.2
defaults write com.apple.dock autohide-time-modifier -float 0.2
killall Dock
```

Hindre at holding av j og k ikke fungerer
```
defaults write -g ApplePressAndHoldEnabled -bool false
```

## IntelliJ

Importer settings fra [dot-files](https://github.com/akemkers/dot-files/tree/main/intellij/settings) 
File -> Manage IDE Settings -> Import settings

Noen manuelle steg må også gjøres:
- Ta i bruk det importerte keymappet: Keymap -> Velg "macOS BRUK DENNE".
- Ta i bruk catppuccin themet i menyen: settings -> Appearance -> theme: Catpuccin
- På samme sted: bytt til å bruke themet _uten_ italics.
- Sett også opp fonten på menyen til å være ca det samme som i editor: setttigs -> Appearance & Behavior -> Appearance -> Use custom font -> Inter 16

## Neovim 
1. `brew install neovim`
2. Installer [lazyvim](https://www.lazyvim.org/installation)
3. 

nvim configen skal ha blitt installert gjennom dot-files.


## Tmux
1. brew install tmux
2. Installer TPM (Tmux Plugin Manager). 

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

3. Installer tmux.conf fra dot-files
t4. Restart tmux med `tmux source ~/.config/tmux/tmux.conf`

## Browser extensions

- Vimium
- 1password
- json formatter
- React Developer Toolst


# Feilsøking

### Bash blir kjørt isteden for zsh i terminalen til Intellij

feks gjennom intellij subprosesser. Da må homebrew scripts lastes for bash i tillegg. Lag en `.bashrc` med følgende

```jsx
eval "$(/opt/homebrew/bin/brew shellenv)"
```
- JSON formatter
- React

### Bash kommandoer (bob etc) blir ikke autocompleted

```bash
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Bob commands
[ -f /Users/andreas.foldvik.kemkers/opt/etc/shrc ] && . /Users/andreas.foldvik.kemkers/opt/etc/shrc
```

## Ønsket programvare
- Logi Options + (for å reverse scroll og få smooth scroll)
