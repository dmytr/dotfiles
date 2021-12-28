export JAVA_HOME="$(cs java-home --jvm openjdk:17 --update)"

if ! [[ ":$PATH:" =~ ":$JAVA_HOME/bin:" ]]; then
  export PATH="$JAVA_HOME/bin:$PATH"
fi
