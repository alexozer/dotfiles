# environment variables

GOPATH1="$HOME/build/go"
GOPATH2="$HOME/code/go"
GOPATH3="$HOME/code/auv/gocode"
export GOPATH="$GOPATH1:$GOPATH2:$GOPATH3"

GEM_BIN=$HOME/.gem/ruby/2.2.0/bin
export PATH="$PATH:$HOME/bin:$GOPATH1/bin:$GOPATH2/bin:$GOPATH3/bin:$HOME/code/auv/link-stage:$GEM_BIN"
export PYTHONPATH="$HOME/code/auv:/usr/local/lib/python3.5/site-packages"
export VISION_TEST_PATH="$HOME/vid/auv"
