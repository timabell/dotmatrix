ver=0.4.0
file=git-delta_${ver}_amd64.deb
path=https://github.com/dandavison/delta/releases/download/$ver/$file
echo downloading $path
wget --directory-prefix /tmp/ $path
sudo dpkg -i /tmp/$file

