# makefile to help building ring for android
# Majdi Sobain <majdisobain@gmail.com>
# 9-9-2018


OUTPUTDIR=$$PWD/bin_output/


CFLAGS += -Wall -g -fpic
mainCFLAGS = -fPIE -pie -rdynamic
sharedCFLAGS = -shared
staticCFLAGS = rcs

INCLUDES += -I $$PWD/../include
LFLAGS = 
LIBS += -lm -ldl

SRCS = ring_state.c ring_ext.c ring_hashlib.c ring_hashtable.c ring_vmgc.c ring_vmos.c ring_string.c ring_list.c ring_item.c ring_items.c ring_scanner.c ring_parser.c ring_stmt.c ring_expr.c ring_codegen.c ring_vm.c ring_vmexpr.c ring_vmvars.c ring_vmlists.c ring_vmfuncs.c ring_api.c ring_vmoop.c ring_vmcui.c ring_vmtrycatch.c ring_vmstrindex.c ring_vmjump.c ring_vmduprange.c ring_vmlistfuncs.c ring_vmrefmeta.c ring_vmperformance.c ring_vmexit.c ring_vmstackvars.c ring_vmstate.c ring_vmmath.c ring_vmfile.c ring_vmdll.c ring_objfile.c

OBJS = $(SRCS:.c=.o)

# Target executable files
MAIN=ring
SHARED_LIB=libring.so
STATIC_LIB=libringstatic.a


.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

all:    $(OUTPUTDIR) $(SHARED_LIB) $(STATIC_LIB) $(MAIN)
	@echo  Ring Compiler and VM have been compiled

$(OUTPUTDIR):
	mkdir $(OUTPUTDIR)

$(SHARED_LIB): $(OBJS) 
	$(CC) $(sharedCFLAGS) $(INCLUDES) -o $(OUTPUTDIR)$(SHARED_LIB) $(OBJS) $(LFLAGS) $(LIBS)

$(STATIC_LIB): $(OBJS) 
	$(AR) $(staticCFLAGS) $(OUTPUTDIR)$(STATIC_LIB) $(OBJS)

$(MAIN): $(OBJS)
	$(CC) $(CFLAGS) $(mainCFLAGS) ring.c -o $(OUTPUTDIR)$(MAIN) -L$(OUTPUTDIR) $(SHARED_LIB) $(LIBS) $(INCLUDES)

clean:
	$(RM)R *.o *~ $(OUTPUTDIR)

