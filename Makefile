# define standard colors
BLACK        := $(shell tput -Txterm setaf 0)
RED          := $(shell tput -Txterm setaf 1)
GREEN        := $(shell tput -Txterm setaf 2)
YELLOW       := $(shell tput -Txterm setaf 3)
LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
PURPLE       := $(shell tput -Txterm setaf 5)
BLUE         := $(shell tput -Txterm setaf 6)
WHITE        := $(shell tput -Txterm setaf 7)
RESET := $(shell tput -Txterm sgr0)
BOLD := $(shell tput bold)

.PHONY: server
server:
	bash -c 'python3 manage.py runserver'

.PHONY: migrate
migrate:
	bash -c 'python3 manage.py makemigrations && python3 manage.py migrate'

.PHONY: superuser
superuser:
	bash -c 'python3 manage.py createsuperuser'

.PHONY: admin
admin:
	@echo ''
	@echo '$(RED)username: $(GREEN)admin'
	@echo '$(RED)password: $(GREEN)cyberpunk'
	@echo ''
	@:

.PHONY: help
help:
	@echo ''
	@echo '$(BOLD)$(BLUE)Available commands:$(RESET)'
	@echo '$(RED)server:$(RESET) run the django server'
	@echo '$(RED)migrate:$(RESET) run makemigrations and migrate'
	@echo '$(RED)superuser:$(RESET) create a django admin (superuser)'
	@echo '$(RED)users:$(RESET) display $(BOLD)$(RED)my$(RESET) admin username and password'
	@echo ''
	@: