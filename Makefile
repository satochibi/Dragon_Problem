PYTHON	= python
PYDOC	= pydoc
PYCS	= $(shell find . -name "*.pyc")
#PYOPENGL	= PyOpenGL-3.0.1
#PYOPENGL	= PyOpenGL-3.0.2
PYOPENGL	= PyOpenGL-3.1.0
OPENGL	= OpenGL
MODULE	= dragon
TARGET	= $(MODULE).py

all:
	@if [ ! -e $(PYOPENGL) ] ; then unzip $(PYOPENGL).zip ; fi
	@if [ ! -e $(OPENGL) ] ; then ln -s $(PYOPENGL)/$(OPENGL) $(OPENGL) ; fi

clean:
	@for each in ${PYCS} ; do echo "rm -f $${each}" ; rm -f $${each} ; done

wipe: clean
	if [ -e $(OPENGL) ] ; then rm -f $(OPENGL) ; fi
	if [ -e $(PYOPENGL) ] ; then rm -f -r $(PYOPENGL) ; fi

test: all
	$(PYTHON) $(TARGET)

pydoc: all clean
	(sleep 3 ; open http://localhost:9999/$(MODULE).html) & $(PYDOC) -p 9999
