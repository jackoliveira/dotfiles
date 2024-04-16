# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "/home/jack/repos/gringo/gringo-app"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "gringo-app"; then

  # Create a new window inline within session layout definition.
  new_window "neovim"
  
  split_v 20
  run_cmd "nvm use && yarn start:production"
  split_h 50

  run_cmd "nvm use && yarn run-android"
  # Select the default active window on session creation.
  #select_window 0
  select_pane 0
  run_cmd "nvim ."
fi

# Finalize session creation and switch/attach to it.
