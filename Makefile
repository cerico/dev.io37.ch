tldr:
	@echo Available commands
	@echo ------------------
	@grep '^[[:alpha:]][^:[:space:]]*:' Makefile | cut -d ':' -f 1 | sort -u | sed 's/^/make /'
start:
	npm run dev
build:
	npm run build
netlify:
	netlify init
gist:
	node gist.js
debugcss:
	sed -i "" -e s/^\\/\\/\ \\@use\ \'debug\'\;/\\@use\ \'debug\'\;/g src/styles/defaults.scss
undebugcss:
	sed -i "" -e s/^\\@use\ \'debug\'\;/\\/\\/\ \\@use\ \'debug\'\;/g src/styles/defaults.scss

repo:
	gh repo create dev.io37.ch --public --source=. --remote=upstream
index:
	@grep -E 'title:|displayDate:' src/pages/gists/*.mdx | tac | awk -F': ' 'NR % 2 { title=$$2; next } { printf  "\033[0;36m%-6s \033[1;0m%s\n", title, $$2 }'
%:
	@$(MAKE) tldr
