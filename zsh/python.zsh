pythonpath_prepend() {
    if [ -d "$1" ] && [[ ":$PYTHONPATH:" != *":$1:"* ]]; then
        export PYTHONPATH="$1${PYTHONPATH:+":$PYTHONPATH"}"
    fi
}

pythonpath_prepend ~/python
