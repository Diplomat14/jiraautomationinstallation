windows() { [[ -n "$WINDIR" ]]; }

mylink() {
    if [[ -z "$2" ]]; then
        # Link-checking mode.
        if windows; then
            fsutil reparsepoint query "$1" > /dev/null
        else
            [[ -h "$1" ]]
        fi
    else
        # Link-creation mode.
        if windows; then
            # Windows needs to be told if it's a directory or not. Infer that.
            # Also: note that we convert `/` to `\`. In this case it's necessary.
            if [[ -d "$2" ]]; then
                echo "mklink /D \"$1\" \"${2//\//\\}\""
                cmd <<< "mklink /D \"$1\" \"${2//\//\\}\"" > /dev/null
            else
               echo "mklink \"$1\" \"${2//\//\\}\""
                cmd <<< "mklink \"$1\" \"${2//\//\\}\"" > /dev/null
            fi
        else
            # You know what? I think ln's parameters are backwards.
            ln -s "$2" "$1"
        fi
    fi
}

if [ -n "$1" ]; then
   
   if [ ! -d "$1" ]; then
      echo "Dependencies root directory doesn't exist: $1"
   elif [ ! -d "$1/xdev" ]; then
      echo "xdev directory doesn't  exist ($1/xdev)"
   elif [ ! -d "$1/jiraorm" ]; then
      echo "jiraorm directory doesn't  exist ($1/jiraorm)"
   elif [ ! -d "$1/jiraautomation" ]; then
      echo "jiraautomation directory doesn't  exist ($1/jiraautomation)"
   elif [ ! -d "$1/jiraautomationcustomization" ]; then
      echo "jiraautomationcustomization directory doesn't  exist ($1/jiraautomationcustomization)"
   else
      # Installing dependencies
      ./uninstall.sh
      
      # Installing dependencies
      mkdir -p ./dependencies
      mylink "./dependencies/xdev" "$1/xdev"
      mylink "./dependencies/jiraorm" "$1/jiraorm"
      mylink "./dependencies/jiraautomation" "$1/jiraautomation"

      # Installing example
      mkdir -p ./working
      mylink "./working/jiraautomationcustomization" "$1/jiraautomationcustomization"

      pip3 install -e $1/xdev
      pip3 install -e $1/jiraorm
      pip3 install -e $1/jiraautomation
      pip3 install -e $1/jiraautomationcustomization


      # Initializing output folder for example scripts
      mkdir -p ./output

      # testing command line
      jacustomization-main
      
   fi
  
else
   echo "Please specify a path to clones repositories"
fi

