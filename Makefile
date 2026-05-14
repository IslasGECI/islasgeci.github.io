start: build serve

build:
	docker run \
		--rm \
		--volume ${PWD}:/srv/jekyll \
		-it jekyll/builder \
		jekyll build

serve:
	docker run \
		--detach \
		--name islasgeci.github.io \
		--publish 4000:4000 \
		--rm \
		--volume ${PWD}:/srv/jekyll\
		jekyll/jekyll \
		jekyll serve
down:
	docker stop islasgeci.github.io

.PHONY: check

check:
	src/check_style.sh
	src/check_spelling.sh
	