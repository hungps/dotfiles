set -gx JAVA_HOME (/usr/libexec/java_home -v 17)
set -gx ANDROID_HOME $HOME/Library/Android/sdk

set -gx PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $ANDROID_HOME/emulator
