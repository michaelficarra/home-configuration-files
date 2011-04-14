task :default do
	%q!git submodule init && git submodule update!
	puts 'making directories...'
	sh %q!find . -type d -not -name '.' -a -not -regex '.*/\\.git/.*' -print -exec mkdir -p ~/\{\} \;!
	puts 'linking files...'
	sh %q!find . -type f -not -regex '^\\./README.md$' -a -not -regex '^\\./Rakefile$' -a -not -regex '.*/\\.git/.*' -print -exec ln -f -T '{}' ~/\{\} \;!
end
