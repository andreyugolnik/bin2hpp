BUILD_DIR_RELEASE=.build_release
BUILD_DIR_DEBUG=.build_debug

all:
	@echo "Usage:"
	@echo "    make <release | debug>"
	@echo "    make <check>"
	@echo "    make <clean>"

release:
	$(shell if [ ! -d $(BUILD_DIR_RELEASE) ]; then mkdir $(BUILD_DIR_RELEASE); fi )
	cd $(BUILD_DIR_RELEASE) ; cmake -DCMAKE_BUILD_TYPE=Release .. ; make ; cd ..
	cp $(BUILD_DIR_RELEASE)/bin2hpp .

debug:
	$(shell if [ ! -d $(BUILD_DIR_DEBUG) ]; then mkdir $(BUILD_DIR_DEBUG); fi )
	cd $(BUILD_DIR_DEBUG) ; cmake -DCMAKE_BUILD_TYPE=Debug .. ; make ; cd ..
	cp $(BUILD_DIR_DEBUG)/bin2hpp .

check:
	cppcheck -j 1 --enable=all -f -I src src/ 2> cppcheck-output

clean:
	rm -fr $(BUILD_DIR_RELEASE) $(BUILD_DIR_DEBUG) bin2hpp

