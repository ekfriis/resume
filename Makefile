
all: resume.html resume.pdf

resume.pdf: resume.md style.css
	pandoc resume.md -f markdown -t pdf --pdf-engine=wkhtmltopdf \
	--pdf-engine-opt=--enable-local-file-access \
	-c style.css -s -o resume.pdf 

resume.html: resume.md style.css
	pandoc -s -c style.css -o resume.html resume.md