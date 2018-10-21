# Defined in - @ line 0
function yta --description 'alias yta youtube-dl -x --audio-format mp3 --add-metadata'
	youtube-dl -ic -x --audio-format mp3 --add-metadata $argv;
end
