function fish_title
  true
end

set fish_function_path $fish_function_path $HOME/.config/fish/plugins/plugin-foreign-env/functions

fenv ". $HOME/.profile"
