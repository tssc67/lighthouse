NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
W_COLOR=\033[34;01m
DARK_RED_COLOR=\033[30;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

ccred=$(echo -e "\033[0;31m")
ccyellow=$(echo -e "\033[0;33m")
ccend=$(echo -e "\033[0m")
IDIR =./include
SRCDIR =./src
CC=g++
CFLAGS=-I$(IDIR)

ODIR=obj
LDIR =./lib

LIBS=-lstdc++ -lPocoNet -std=c++11 -lPocoFoundation

_DEPS = lighthouse_sv.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = lighthouse_sv.o main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

_FUSION_OBJ = fusion.o
FUSION_OBJ = $(patsubst %,$(ODIR)/%,$(_FUSION_OBJ))



lighthouse_sv: $(OBJ)
	
	@echo "$(W_COLOR)"
	g++ -o $@ $(OBJ) $(CFLAGS) $(LIBS)
	@echo "$(OK_COLOR)Compilation Successful$(NO_COLOR)"
$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	@echo "$(DARK_RED_COLOR)"
	$(CC) -c -o $@ $< $(CFLAGS)
fusion: $(FUSION_OBJ)
	@echo "[Building]Lighthouse_sv"
	

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 