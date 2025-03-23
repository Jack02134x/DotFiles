VENV_PATH="$HOME/.pipins_env"
if [ ! -d "$VENV_PATH" ]; then
    echo "Creating virtual environment at $VENV_PATH..."
    python -m venv "$VENV_PATH"
fi
source "$VENV_PATH/bin/activate"
if [ "$#" -eq 0 ]; then
    echo "Usage: pipins <package1> [<package2> ...]"
    deactivate
    exit 1
fi
echo "Installing packages: $@"
pip install "$@"
deactivate

echo "Done man it's fucking done."
