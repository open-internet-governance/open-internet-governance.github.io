
JEKYLL = bundle exec --gemfile=Gemfile jekyll

export BUNDLE_PATH ?= .gems

# Build the site in the build directory
.PHONY: _site
_site: Gemfile.lock
	LANG=en_US.UTF-8 JEKYLL_ENV=production $(JEKYLL) build 

.PHONY: clean
clean:
	rm -rf _site
	rm Gemfile.lock

Gemfile.lock:
	bundle install --gemfile=Gemfile

.PHONY: server
server: Gemfile.lock
	JEKYLL_ENV=development $(JEKYLL) serve --drafts

