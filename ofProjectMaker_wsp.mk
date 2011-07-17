.PHONY: clean All

All:
	@echo ----------Building project:[ ofMaker - DebugUnicode ]----------
	@"$(MAKE)" -f "ofMaker.mk"
clean:
	@echo ----------Cleaning project:[ ofMaker - DebugUnicode ]----------
	@"$(MAKE)" -f "ofMaker.mk" clean
