echo "Hi! I'm gonna create the .vimrc file for you and copy the color scheme to the appropriate place."
echo "Have a nice day :)"

cp .vimrc ~/
mkdir -p ~/.vim/colors
cp monokai.vim ~/.vim/colors
