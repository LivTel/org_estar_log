#include ../../../Makefile.common
include ../Makefile.common
#
# Specfic options
#
LOG_NAME	=log
PACKAGEDIR 	=org/$(ESTAR_NAME)/$(LOG_NAME)
PACKAGENAME	=org.$(ESTAR_NAME).$(LOG_NAME)
JAR_FILE	=org_$(ESTAR_NAME)_$(LOG_NAME).jar
JAVACFLAGS 	= -d $(LIBDIR) -sourcepath ../../../ -classpath $(LIBDIR):$(CLASSPATH)
DOCSDIR 	= $(ESTAR_DOC_HOME)/javadocs/$(PACKAGEDIR)

SRCS = ILoggable.java ILogger.java

OBJS = $(SRCS:%.java=$(LIBDIR)/$(PACKAGEDIR)/%.class)
DOCS = $(SRCS:%.java=$(DOCSDIR)/$(PACKAGEDIR)/%.html)

DIRS =

top: jar 
#configs
#	@for i in $(DIRS); \
#	do \
#		(echo making in $$i...; cd $$i; $(MAKE) ); \
#	done;

#docs

$(LIBDIR)/$(PACKAGEDIR)/%.class: %.java
	$(JAVAC) $(JAVAC_OPTIONS) $(JAVACFLAGS) $<
jar: $(JARLIBDIR)/$(JAR_FILE)

$(JARLIBDIR)/$(JAR_FILE): $(OBJS)
	(cd $(LIBDIR); $(JAR) $(JAR_OPTIONS) $(JAR_FILE) $(PACKAGEDIR); $(MV) $(JAR_FILE) $(JARLIBDIR))

docs: $(DOCS)
#	@for i in $(DIRS); \
#	do \
#		(echo docs in $$i...; cd $$i; $(CO) $(CO_OPTIONS) Makefile; $(MAKE) docs); \
#	done;

$(DOCSDIR)/$(PACKAGEDIR)/%.html: %.java
	$(JAVADOC) -sourcepath ../../..:$(CLASSPATH) -d $(DOCSDIR) $(DOCFLAGS) $(PACKAGENAME)

configs: $(CONFIGSBIN)

$(LIBDIR)/%: %
	$(CP) $< $@

checkout:
	$(CO) $(CO_OPTIONS) $(SRCS)
#	@for i in $(DIRS); \
#	do \
#		(echo checkout in $$i...; cd $$i; $(CO) $(CO_OPTIONS) Makefile; $(MAKE) checkout); \
#	done;

checkin:
	-$(CI) $(CI_OPTIONS) $(SRCS)
#	-@for i in $(DIRS); \
#	do \
#		(echo checkin in $$i...; cd $$i; $(MAKE) checkin; $(CI) $(CI_OPTIONS) Makefile); \
#	done;

depend:
#	(echo depend in c...; cd c; $(MAKE) depend);

clean:
	-$(RM) $(RM_OPTIONS) $(OBJS) $(TIDY_OPTIONS)
#	@for i in $(DIRS); \
#	do \
#		(echo cleaning in $$i...; cd $$i; $(MAKE) clean); \
#	done;

tidy:
	-$(RM) $(RM_OPTIONS) $(TIDY_OPTIONS)
#	@for i in $(DIRS); \
#	do \
#		(echo cleaning in $$i...; cd $$i; $(MAKE) tidy); \
#	done;

backup: tidy checkin
#	@for i in $(DIRS); \
#	do \
#		(echo backup in $$i...; cd $$i; $(MAKE) backup); \
#	done;
	$(TAR) cvf $(BACKUP_DIR)/org_$(ESTAR_NAME)_$(LOG_NAME).tar .
	$(COMPRESS) $(BACKUP_DIR)/org_$(ESTAR_NAME)_$(LOG_NAME).tar
