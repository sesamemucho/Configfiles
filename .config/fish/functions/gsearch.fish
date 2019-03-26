function gsearch
	gdrive list --order name -q "name contains '$argv'"
end
