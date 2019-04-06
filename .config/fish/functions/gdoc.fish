function gdoc
	mkdir -p images
gdownload DocumentUpload
mv DocumentUpload/* images/
rm -r DocumentUpload/
end
