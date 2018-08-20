#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/dbushev/.nix-profile/etc/profile.d/nix.sh ]; then . /home/dbushev/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
