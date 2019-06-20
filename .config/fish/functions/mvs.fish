# Defined in - @ line 1
function mvs --description 'alias vs gulp mergeGui; and npm start'
	gulp mergeGui
    npm link VERA.neo
    npm start $argv
end
