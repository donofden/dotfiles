HOME ?= `$HOME`
PWD ?= `pwd`

help: ## Welcome
	### Welcome
	#
	### Installation
	#
	#  -> $$ make setup
	#
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: ## copy all the .bash_aliases & Link all the bash aliases into the relevant places
	@echo '##'
	@echo '# Copying..'
	@echo '##'
	for file in  \
	.bash_aliases \
	; \
	do \
		echo $$file; \
		ln -sf $(PWD)/$$file $(HOME)/$$file; \
	done
