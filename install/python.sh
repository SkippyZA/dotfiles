echo -e "\nInstalling python stuff:"

printf "  gcalcli... "
pip2 install gcalcli &> /dev/null
echo "done"

printf "  patch 'requests' and 'pyOpenSSL'... "
pip2 install --upgrade requests &> /dev/null
pip2 install --upgrade pyOpenSSL &> /dev/null
pip3 install --upgrade requests &> /dev/null
pip3 install --upgrade pyOpenSSL &> /dev/null
echo "done"

printf "  neovim... "
pip2 install --upgrade --force-reinstall neovim &> /dev/null
pip3 install --upgrade --force-reinstall neovim &> /dev/null
echo "done"

printf "  tasklib... "
pip2 install --upgrade git+git://github.com/tbabej/tasklib@develop &> /dev/null
pip3 install --upgrade git+git://github.com/tbabej/tasklib@develop &> /dev/null
echo "done"
