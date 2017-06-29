TARGETS=all check clean clobber distclean install uninstall
TARGET=all

PREFIX=${DESTDIR}/opt
BINDIR=${PREFIX}/bin
SUBDIRS=

ifeq	(${MAKE},gmake)
	INSTALL=ginstall
else
	INSTALL=install
endif

.PHONY: ${TARGETS} ${SUBDIRS}

all::	unconsole

${TARGETS}::

clobber distclean:: clean

ARGS	= --prefix=WORKAREA sample.txt

check::	unconsole
	./unconsole ${ARGS}

install:: unconsole
	${INSTALL} -D unconsole ${BINDIR}/unconsole

uninstall::
	${RM} ${BINDIR}/unconsole

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}
${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
