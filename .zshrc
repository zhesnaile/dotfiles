# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#Check if oh-my-zsh is installed and if not, use curl or wget to install it.
if [[ ! -d $ZSH && ! -L $ZSH ]]
then
	if command -v curl &> /dev/null
	then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
		echo "Moving ~/.zshrc.pre-oh-my-zsh back to ~/.zshrc";
		mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc;
		rm ~/.shell.pre-oh-my-zsh
		zsh;
	elif command -v wget &> /dev/null
	then 
		sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
		echo "Moving ~/.zshrc.pre-oh-my-zsh back to ~/.zshrc";
		mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc;
		rm ~/.shell.pre-oh-my-zsh
		zsh;
	else 
		echo "Install curl or wget to install oh-my-zsh"
	fi
	exit 1
fi


# Set ZSH_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$ZSH_CUSTOM" ]]; then
	ZSH_CUSTOM="$ZSH/custom"
fi

#Links for Custom Plugins
links=(
	"https://github.com/zsh-users/zsh-autosuggestions"
	"https://github.com/spwhitt/nix-zsh-completions"
)
for i in "${links[@]}"
do
	short="$(awk -F'/' '{print $NF}' <<<"$i")"
	if [[ ! -d "$ZSH_CUSTOM/plugins/$short" ]]
	then
		echo "Missing plugin: $short"
		mkdir -p "$ZSH_CUSTOM/plugins"
		echo "Installing $short"
		git clone "$i" "$ZSH_CUSTOM/plugins/$short"
	else
		if [[ -z "$short" ]] then
			echo "Wrong link for $i, make sure there is no / at the end"
		fi
	fi
done

# Install the best theme.
if [[ ! -f "$ZSH_CUSTOM/themes/zshred.zsh-theme" ]]
then
	echo "Installing the sweetest theme by RedXtech that totally doesn't rip off"
	curl -L "https://raw.githubusercontent.com/redxtech/zshred/master/zshred.zsh-theme" -o "$ZSH_CUSTOM/themes/zshred.zsh-theme"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="zshred"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
)

for i in "${links[@]}"
do
	plugins+="$(awk -F'/' '{print $NF}' <<<"$i")"
done

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#aliases
if [ -f ~/.config/shells/aliases ]; then
	. ~/.config/shells/aliases
fi
# exports
if [ -f ~/.config/shells/exports ]; then
	. ~/.config/shells/exports
fi

# Add fzf keyboard shortcuts on Fedora.
if [ -x "$(command -v fzf)"  ]
then
	source /usr/share/fzf/shell/key-bindings.zsh
fi
