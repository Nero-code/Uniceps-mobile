# ==========================================
# FLUTTER PROJECT MAKEFILE
# ==========================================

# Tool Variables
FLUTTER := flutter
APP_MAIN := lib/main.dart

# Config File Variables
DEV_CONF     := config_dev.json
STAGING_CONF := config_staging.json
PROD_CONF    := config_prod.json

# Colors for terminal output
BLUE   := \033[34m
GREEN  := \033[32m
YELLOW := \033[33m
RED    := \033[31m
RESET  := \033[0m

.PHONY: dev staging prod build-dev build-staging build-prod bundle-prod clean

## --- Utility Commands ---

clean:
	@echo "$(YELLOW)🧹 Cleaning build artifacts and derived data...$(RESET)"
	$(FLUTTER) clean
	@echo "$(GREEN)✅ Project cleaned$(RESET)"

## --- Run Commands (Debug) ---

dev:
	@if [ ! -f $(DEV_CONF) ]; then echo "$(RED)❌ Error: $(DEV_CONF) not found!$(RESET)"; exit 1; fi
	@echo "$(BLUE)🚀 Launching [DEV] Flavor...$(RESET)"
	$(FLUTTER) run --flavor dev --dart-define-from-file=$(DEV_CONF) -t $(APP_MAIN)

staging:
	@if [ ! -f $(STAGING_CONF) ]; then echo "$(RED)❌ Error: $(STAGING_CONF) not found!$(RESET)"; exit 1; fi
	@echo "$(BLUE)🧪 Launching [STAGING] Flavor...$(RESET)"
	$(FLUTTER) run --flavor staging --dart-define-from-file=$(STAGING_CONF) -t $(APP_MAIN)

prod:
	@if [ ! -f $(PROD_CONF) ]; then echo "$(RED)❌ Error: $(PROD_CONF) not found!$(RESET)"; exit 1; fi
	@echo "$(GREEN)💎 Launching [PRODUCTION] Flavor...$(RESET)"
	$(FLUTTER) run --flavor prod --dart-define-from-file=$(PROD_CONF) -t $(APP_MAIN)

## --- Build Commands (Release APK & Bundle) ---

build-dev:
	@echo "$(BLUE)📦 Building [DEV] APK...$(RESET)"
	$(FLUTTER) build apk --release --flavor dev --dart-define-from-file=$(DEV_CONF)
	@echo "$(GREEN)✅ DEV APK Build Complete$(RESET)"

build-staging:
	@echo "$(BLUE)📦 Building [STAGING] APK...$(RESET)"
	$(FLUTTER) build apk --release --flavor staging --dart-define-from-file=$(STAGING_CONF)
	@echo "$(GREEN)✅ STAGING APK Build Complete$(RESET)"

build-prod:
	@echo "$(GREEN)📦 Building [PRODUCTION] APK...$(RESET)"
	$(FLUTTER) build apk --release --flavor prod --dart-define-from-file=$(PROD_CONF)
	@echo "$(GREEN)✅ PRODUCTION APK Build Complete$(RESET)"

bundle-prod:
	@echo "$(GREEN)🎁 Creating [PRODUCTION] App Bundle (.aab)...$(RESET)"
	$(FLUTTER) build appbundle --release --flavor prod --dart-define-from-file=$(PROD_CONF)
	@echo "$(GREEN)✅ PRODUCTION Bundle Complete$(RESET)"