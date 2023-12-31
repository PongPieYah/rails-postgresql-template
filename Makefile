IMAGE:=rails-app-creator
CREATE_OPT=
CREATE_CMD=rails new . -f -d postgresql $(CREATE_OPT)

build:
	@docker build --target base -f docker/Dockerfile -t $(IMAGE) .

new-app: build
	@rm -rf .git* LICENSE
	@docker run --rm -it -v $(PWD):/workspace $(IMAGE) bash -c "$(CREATE_CMD)"

.env:
	@cp docker/.env.example docker/.env

up:
	@cd docker && docker compose up -d

down:
	@cd docker && docker compose down
