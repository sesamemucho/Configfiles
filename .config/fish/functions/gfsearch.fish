function gfsearch
	gdrive list --order folder -q "name contains '$argv'"
end
