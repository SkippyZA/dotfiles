echo -e "\nInstalling fonts:"

POWERLINE_FONT=/Library/Fonts/Source\ Code\ Pro\ Medium\ for\ Powerline.otf
printf "  Powerline font... "
if [ ! -f "$POWERLINE_FONT" ]; then
    curl -o "$POWERLINE_FONT" https://raw.githubusercontent.com/powerline/fonts/master/SourceCodePro/Source%20Code%20Pro%20Medium%20for%20Powerline.otf
else
    echo "exists"
fi

POWERLINE_FONT=/Library/Fonts/Source\ Code\ Pro\ Medium\ Nerd\ Font\ Complete.otf
printf "  Nerd font... "
if [ ! -f "$POWERLINE_FONT" ]; then
    curl -o "$POWERLINE_FONT" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Medium/complete/Sauce%20Code%20Pro%20Medium%20Nerd%20Font%20Complete.ttf
else
    echo "exists"
fi
