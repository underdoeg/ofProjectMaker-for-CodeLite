.PHONY: clean All

All:
	@echo ----------Building project:[ ofMakerStandalone - Debug ]----------
	@"$(MAKE)" -f "ofMakerStandalone.mk"
clean:
	@echo ----------Cleaning project:[ ofMakerStandalone - Debug ]----------
	@"$(MAKE)" -f "ofMakerStandalone.mk" clean
