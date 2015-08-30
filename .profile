export GOPATH="$HOME/build/go"
export PATH="$PATH:$HOME/bin:$GOPATH/bin"

syndaemon -i 0.2 -k -t -R &
$HOME/bin/kbd &
