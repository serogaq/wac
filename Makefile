.PHONY: all help build start stop restart status logs bashrc

from_app=0

define help_text
commands:
	help - what you see now
	build - build app
	start - app launch and build (if needed)
	stop - stop app
	restart [soft=1|0] - restart app
	status - app status
	logs - app logs
	bashrc - add this command to user .bashrc
endef
export help_text

all: help

help:
	@echo "$$help_text"

build:
	@sudo docker-compose build

start:
	@sudo docker-compose up -d

stop:
	@sudo docker-compose stop

soft=1
restart:
ifeq ($(soft),0)
	$(info Full restart)
	@sudo docker-compose down
else
	@make --no-print-directory stop
endif
	@make --no-print-directory start

status:
	@sudo docker-compose top
	@sudo docker-compose ps

logs:
	@sudo docker-compose logs -f -t --tail="500"

.ONESHELL:
bashrc:
ifeq ($(from_app),0)
	$(info Call the command via ./bin/app bashrc)
else
	@path=`pwd`;
	folder="$${path##*/}";
	printf "\nfunction app-%s() {\n	bash $${path}/bin/app \"\$$@\"\n}" "$$folder" >> ~/.bashrc;
	printf "Success\nRun \". ~/.bashrc\" command to update .bashrc \n\nUsage: %s <command>\n" "app-$$folder";
endif
