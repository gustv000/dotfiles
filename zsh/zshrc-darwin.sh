export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_HOME=$(/usr/libexec/java_home)

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk"

export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH" 
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export CPPFLAGS="-I/usr/local/opt/openjdk/include"

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias e64="cat | tr -d \"\\n\" | base64"
alias d64="base64 -d"
