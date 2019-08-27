echo -e "\nInstalling App Store applications"

declare -a mas_apps=(
  '926036361'       # LastPass
  '803453959'       # Slack
  '1147396723'      # WhatsApp Desktop
)

for app in "${mas_apps[@]}"; do
  mas install "$app"
done
