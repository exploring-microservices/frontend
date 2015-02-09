all: clean build run

build:
	docker build -t spadin/frontend .

test:
	docker run spadin/frontend bundle exec rspec

run:
	docker run -tip 8080:8080 spadin/frontend

clean:
	docker rmi -f spadin/frontend

release: clean build test
	docker push spadin/frontend
