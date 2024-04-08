# Define variables
SRC_DIR := .
DEST_DIR := .
OPT := --to slides --SlidesExporter.reveal_width=1000 --SlidesExporter.reveal_number='c/t'

# Convert .ipynb files to HTML
.PHONY: convert
convert:
	@mkdir -p $(DEST_DIR)
	@for file in $(SRC_DIR)/*.ipynb; do \
		echo "Converting $$file to HTML..."; \
		jupyter nbconvert $(OPT) "$$file" --output-dir=$(DEST_DIR); \
	done

# Clean up generated HTML files
.PHONY: clean
clean:
	@rm -rf $(DEST_DIR)/*.html

# Define default target
.DEFAULT_GOAL := convert