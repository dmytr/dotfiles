export JAVA_HOME="$(cs java-home --jvm 11)"

if ! [[ ":$PATH:" =~ ":$JAVA_HOME/bin:" ]]; then
  export PATH="$JAVA_HOME/bin:$PATH"
fi
