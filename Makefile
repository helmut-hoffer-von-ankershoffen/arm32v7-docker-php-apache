.PHONY: build

help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##/:/'`); \
	printf "%-30s %s\n" "DevOps console for Project arm32v7-docker-php-apache" ; \
	printf "%-30s %s\n" "====================================================" ; \
	printf "%-30s %s\n" "" ; \
	printf "%-30s %s\n" "Target" "Help" ; \
	printf "%-30s %s\n" "------" "----" ; \
	for help_line in $${help_lines[@]}; do \
        IFS=$$':' ; \
        help_split=($$help_line) ; \
        help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
        help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
        printf '\033[36m'; \
        printf "%-30s %s" $$help_command ; \
        printf '\033[0m'; \
        printf "%s\n" $$help_info; \
    done

%:      # thanks to chakrit
	@:    # thanks to Wi.lliam Pursell


build: ## Build docker image on Docker for Mac and save in images/
	cd src && docker build  -t arm32v7-docker-php-apache  .
	docker save --output images/arm32v7-docker-php-apache.tar arm32v7-docker-php-apache

push: ## Push to private docker registry via router
	cd ansible && ansible-playbook push.yml

build-tag-and-push: ## Build docker image on Docker for Mac, tag and push directly
	cd src && docker build  -t arm32v7-docker-php-apache  .
	docker tag arm32v7-docker-php-apache ceil-router.dev:5001/helmuthva/arm32v7-docker-php-apache
	docker push ceil-router.dev:5001/helmuthva/arm32v7-docker-php-apache

