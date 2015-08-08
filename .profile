export GOPATH="$HOME/build/go"
export PATH="$PATH:$HOME/bin:$GOPATH/bin"
export WINEARCH=win32

syndaemon -i 0.2 -k -t -R &
$HOME/bin/kbd &
