# environment variables

export GOPATH="$HOME/code/go"

GEM_BIN="$HOME/.gem/ruby/2.2.0/bin"
export PATH="$PATH:$HOME/bin:$GOPATH/bin:$HOME/code/auv/link-stage:$GEM_BIN:$HOME/.cargo/bin"
export PYTHONPATH="$HOME/code/auv"

export CUAUV_SOFTWARE="$HOME/code/auv/"
export CUAUV_VEHICLE="thor"
export CUAUV_LOCALE="teagle"
export CHICKEN_REPOSITORY="$CUAUV_SOFTWARE/link-stage/chicken"
export C_INCLUDE_PATH="$CUAUV_SOFTWARE"
export CGO_LDFLAGS="-L${CUAUV_SOFTWARE}link-stage"
export VISION_TEST_PATH="$HOME/vid/auv"
export CSC_OPTIONS"=-L$CUAUV_SOFTWARE/link-stage -C -I$CUAUV_SOFTWARE -I$CUAUV_SOFTWARE"
export CSC_OPTIONS="$CSC_OPTIONS -Wl,-rpath,${CUAUV_SOFTWARE}/link-stage"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java guis
export MATLAB_JAVA="/usr/lib/jvm/java-8-openjdk/jre"

export QSYS_ROOTDIR="/home/alex/build/aur/tmp/yaourt-tmp-alex/aur-quartus-lite/pkg/quartus-lite//opt/altera/quartus/sopc_builder/bin"

export ALTERAOCLSDKROOT="/home/alex/build/aur/tmp/yaourt-tmp-alex/aur-quartus-lite/pkg/quartus-lite//opt/altera/hld"

export PATH="$HOME/.cargo/bin:$PATH"
