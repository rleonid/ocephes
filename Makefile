.PHONY: all clean build

PACKAGES="ctypes,ctypes.foreign,ctypes.stubs"
default: build

libcephes_stubs:
	ocamlbuild -use-ocamlfind -package ${PACKAGES} -I src/lib src/lib/libcephes_stubs.a

dllcephes_stubs:
	ocamlbuild -use-ocamlfind -package ${PACKAGES} -I src/lib src/lib/dllcephes_stubs.so

build: libcephes_stubs dllcephes_stubs
	ocamlbuild -use-ocamlfind -package ${PACKAGES} -I src/lib ocephes.cma ocephes.cmxa ocephes.cmxs

install:
	ocamlfind install ocephes META \
		_build/src/lib/cephes_bindings.cmx \
		_build/src/lib/cephes_generated.cmx \
		_build/src/lib/ocephes.a \
		_build/src/lib/ocephes.o \
		_build/src/lib/ocephes.cmi \
		_build/src/lib/ocephes.cma \
		_build/src/lib/ocephes.cmx \
		_build/src/lib/ocephes.cmxa \
		_build/src/lib/ocephes.cmxs \
		_build/src/lib/ocephes.mli \
		_build/src/lib/ocephes.annot \
		_build/src/lib/libcephes_stubs.a \
		_build/src/lib/dllcephes_stubs.so \
		-optional _build/src/lib/ocephes.cmti \
		_build/src/lib/ocephes.cmt

test.byte: libcephes_stubs
	ocamlbuild -use-ocamlfind -package ${PACKAGES} -I src/lib -I src/app test.byte

test.native: libcephes_stubs
	ocamlbuild -use-ocamlfind -package ${PACKAGES} -I src/lib -I src/app test.native

all: build test.byte test.native


clean:
	ocamlbuild -clean

download_cephes:
	curl -o src/lib/cprob.tgz http://www.netlib.org/cephes/cprob.tgz && \
	curl -o src/lib/eval.tgz http://www.netlib.org/cephes/eval.tgz

extract_cephes:
	tar xvfz src/lib/cprob.tgz -C src/lib && \
	tar xvfz src/lib/eval.tgz -C src/lib
