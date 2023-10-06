# makefile to help building ring for android
# Majdi Sobain <majdisobain@gmail.com>
# 9-9-2018


OUTPUTDIR=$$PWD/bin_output


CFLAGS += -fPIC
mainCFLAGS = -O2 -rdynamic -pie
mainsCFLAGS = -O2 -pie
sharedCFLAGS = -shared
staticCFLAGS = rcs

INCLUDES += -I $$PWD/../include
LFLAGS = 
LIBS += -lm -ldl

SRCS = general.c state.c ext.c hashlib.c rhtable.c vmgc.c os_e.c rstring.c rlist.c ritem.c ritems.c scanner.c parser.c stmt.c expr.c codegen.c vm.c vmerror.c vmeval.c vmthreads.c vmexpr.c vmvars.c vmlists.c vmfuncs.c ringapi.c vmoop.c vmcui.c vmtry.c vmstr.c vmjump.c vmrange.c list_e.c meta_e.c vmperf.c vmexit.c vmstack.c vmstate.c genlib_e.c math_e.c file_e.c dll_e.c objfile.c

OBJS = $(SRCS:.c=.o)

# Target executable files
MAIN=ring
SHARED_LIB=libring.so
STATIC_LIB=libringstatic.a


.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

all: $(OUTPUTDIR) $(SHARED_LIB) $(STATIC_LIB) $(MAIN) $(MAIN)
	@echo  Ring Compiler and VM have been compiled

$(OUTPUTDIR):
	mkdir -p $(OUTPUTDIR)/libs

$(SHARED_LIB): $(OBJS) 
	$(CC) $(sharedCFLAGS) $(INCLUDES) -o $(OUTPUTDIR)/libs/$(SHARED_LIB) $(OBJS) $(LFLAGS) $(LIBS)

$(STATIC_LIB): $(OBJS) 
	$(AR) $(staticCFLAGS) $(OUTPUTDIR)/libs/$(STATIC_LIB) $(OBJS)

# Build lring with shared lib link
# Build sring linked statically
$(MAIN): $(OBJS)
	$(CC) $(CFLAGS) $(mainCFLAGS) ring.c -o $(OUTPUTDIR)/l$(MAIN) -L$(OUTPUTDIR)/libs -l:$(SHARED_LIB) $(LIBS) $(INCLUDES)
	$(CC) $(CFLAGS) $(mainsCFLAGS) ring.c -o $(OUTPUTDIR)/s$(MAIN) -L$(OUTPUTDIR)/libs -l:$(STATIC_LIB) $(LIBS) $(INCLUDES)

clean:
	$(RM)R *.o *~ $(OUTPUTDIR)

