PORT ?= 4321
DECK ?= self-improving-agents-deck.html

.PHONY: serve kill restart open

## restart: kill anything on $(PORT) and start the deck server fresh
restart: kill serve

## kill: stop whatever is listening on $(PORT)
kill:
	@lsof -ti tcp:$(PORT) | xargs kill -9 2>/dev/null || true
	@echo "freed port $(PORT)"

## serve: serve the deck on $(PORT)
serve:
	@echo "serving $(DECK) at http://localhost:$(PORT)/$(DECK)"
	@python3 -m http.server $(PORT)

## open: open the deck in the default browser (run after `make serve` in another shell)
open:
	@open "http://localhost:$(PORT)/$(DECK)"
