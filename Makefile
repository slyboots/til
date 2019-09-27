start:
	bundle exec jekyll serve

publish:
	git add . && git commit && git push
