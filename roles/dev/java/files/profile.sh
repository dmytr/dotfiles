export JAVA_HOME="$HOME/.cache/current-jdk"

if ! [[ ":$PATH:" =~ ":$JAVA_HOME/bin:" ]]; then
  export PATH="$JAVA_HOME/bin:$PATH"
fi
