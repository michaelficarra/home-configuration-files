task :default do
	exec %q!find . -maxdepth 1 -name .\* -type f -exec ln -i -T '{}' ~/\{\} \;; find . -type d -not -name '.' -a -not -regex '\./\.git/?.*' -ok mkdir -p ~/\{\} \;; find . -mindepth 2 -type f -regex '\\./[^\\.].*' -exec ln -i -T '{}' ~/\{\} \;!
end
