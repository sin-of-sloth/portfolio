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
	@:

.PHONY: migrate
migrate:
	bash -c 'python3 manage.py makemigrations && python3 manage.py migrate'
	@:

.PHONY: superuser
superuser:
	bash -c 'python3 manage.py createsuperuser'
	@:

.PHONY: admin
admin:
	@echo ''
	@echo '$(RED)username: $(GREEN)admin'
	@echo '$(RED)password: $(GREEN)thedarklord password'
	@echo ''
	@:

.PHONY: static
static:
	python3 manage.py collectstatic

.PHONY: push
push:
	@echo ''
	@echo '$(BLUE)$(BOLD)Commands to run to push to git$(RESET)'
	@echo 'pip3 freeze > requirements.txt'
	@echo 'git add .'
	@echo 'git commit -m "<your message here>"'
	@echo 'git push origin'
	@echo ''
	@:

.PHONY: pull
pull:
	@echo ''
	@echo '$(BLUE)$(BOLD)Commands to run to pull from git to production$(RESET)'
	@echo 'workon <environment>'
	@echo 'git pull origin'
	@echo 'pip install -r requirements.txt'
	@echo 'python manage.py migrate'
	@echo 'make static'
	@echo ''
	@:

.PHONY: help
help:
	@echo ''
	@echo '$(BOLD)$(BLUE)Available commands:$(RESET)'
	@echo '$(RED)server:$(RESET) run the django server'
	@echo '$(RED)migrate:$(RESET) run makemigrations and migrate'
	@echo '$(RED)superuser:$(RESET) create a django admin (superuser)'
	@echo '$(RED)admin:$(RESET) display $(BOLD)$(RED)my$(RESET) admin username and password'
	@echo '$(RED)static:$(RESET) collect static files to root $(RED)(do not run on local! bad!)$(RESET)'
	@echo '$(RED)push:$(RESET) commands to run to push to git'
	@echo '$(RED)pull:$(RESET) commands to run to pull from git to production'
	@echo ''
	@: