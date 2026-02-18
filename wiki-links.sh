rm -rf ./wiki
cp -r ./pages ./wiki

# Fix links
OLD="https:\/\/gitlab.com\/asacolips-projects\/foundry-mods\/foundryvtt-system-tutorial\/-\/blob\/master\/pages\/"
NEW="https:\/\/foundry-vtt-community.github.io\/wiki\/system-dev-"
find ./wiki -type f -exec \
  sed -i -e "s/$OLD/$NEW/g" {} +
find ./wiki -type f -exec \
  sed -i -e "s/.md//g" {} +

# Delete files
rm -rf ./wiki/*.md-*

# Rename files
cd ./wiki ; for f in * ; do mv -- "$f" "system-dev-$f" ; done