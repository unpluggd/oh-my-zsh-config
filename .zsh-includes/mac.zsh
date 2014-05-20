# hide/show desktop icons on lion & re-launch TotalFinder
hide_desktop_icons() {
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder && open /Applications/TotalFinder.app
}
show_desktop_icons() {
    defaults write com.apple.finder CreateDesktop -bool true
    killall Finder && open /Applications/TotalFinder.app
}
alias hide-desktop-icons=hide_desktop_icons
alias show-desktop-icons=show_desktop_icons
