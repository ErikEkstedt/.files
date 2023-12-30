apps=(
	"bat"
	"exa"
	"fd"
	"fzf"
	"htop"
	"jesseduffield/lazygit/lazygit"
	"lf"
	"ripgrep"
	"stow"
	"tmux"
	"wget"
)

# Loop through the list and install each application
for app in "${apps[@]}"; do
	brew install "$app"
done

$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
