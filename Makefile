init:
	@echo '==> Repository initial'
	git init

html:
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -a icons -a iconsdir=./images/icons main.txt

compact:
	@echo '==> Compiling asciidoc files to generate compact HTML'
	asciidoc -a theme=compact -a icons -a iconsdir=./images/icons main.txt -o main.compact.html

slidy:
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc --backend slidy2 -a icons -a iconsdir=./images/icons -a stylesheet=~/.asciidoc/backends/slidy2/doc/keycap.css -a data-uri -a slide -o main.slidy.html main.txt
	
checkout: 
	@echo '==> Checkout de la dernière version'
	git checkout master

commit: 
	@echo '==> Commit de la dernière version'
	git add .
	git commit -m "maj by JMB"

#push:
#	@echo '==> Pushing to heroku'
#	git push heroku

clean: 
	@echo '==> Suppression des fichiers de compilation'
	@# fichiers de compilation latex
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.ilg
	@# fichiers de bibtex
	@rm -f *.blg
