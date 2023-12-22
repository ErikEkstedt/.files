apps=(
	"fzf"
	"bat"
	"exa"
	"tmux"
	"htop"
	"jesseduffield/lazygit/lazygit"
	"stow"
	"ripgrep"
	"fd"
)

# Loop through the list and install each application
for app in "${apps[@]}"; do
	brew install "$app"
done

$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc
