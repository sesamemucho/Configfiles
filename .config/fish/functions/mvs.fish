# Defined in - @ line 1
function mvs --description 'alias vs gulp mergeGui; and npm start'
    npm i gulp
	gulp mergeGui
    npm link VERA.neo
    npm start $argv
end
