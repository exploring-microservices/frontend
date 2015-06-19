all: clean build run

build:
	docker build -t sitebuilder/frontend .

test:
	docker run sitebuilder/frontend bundle exec rspec

run:
	docker run -tip 8080:8080 sitebuilder/frontend

clean:
	docker rmi -f sitebuilder/frontend

release: clean build test
	docker push sitebuilder/frontend
