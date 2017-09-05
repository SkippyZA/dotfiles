echo -e "\nInstalling python stuff:"

printf "  gcalcli... "
pip2 install gcalcli &> /dev/null
echo "done"

printf "  neovim... "
pip2 install --upgrade --force-reinstall neovim &> /dev/null
pip3 install --upgrade --force-reinstall neovim &> /dev/null
echo "done"
