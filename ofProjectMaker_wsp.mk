.PHONY: clean All

All:
	@echo ----------Building project:[ ofMakerStandalone - Debug ]----------
	@cd "standalone" && "$(MAKE)" -f "ofMakerStandalone.mk"
clean:
	@echo ----------Cleaning project:[ ofMakerStandalone - Debug ]----------
	@cd "standalone" && "$(MAKE)" -f "ofMakerStandalone.mk" clean
