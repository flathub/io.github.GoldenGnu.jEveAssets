flatpak-manifest := "io.github.GoldenGnu.jEveAssets.yml"

_default:
  @{{just_executable()}} --justfile {{justfile()}} --list

alias fedc := flatpak-external-data-checker
# run flatpak-external-data-checker against local manifest
flatpak-external-data-checker:
  flatpak run org.flathub.flatpak-external-data-checker --update --edit-only {{flatpak-manifest}}

alias build := flatpak-build
# build flatpak from local manifest
flatpak-build:
  flatpak run org.flatpak.Builder --force-clean --user --install-deps-from=flathub --repo=repo builddir {{flatpak-manifest}}

alias lint := flatpak-builder-lint
# run flathub linter on local manifest
flatpak-builder-lint:
  flatpak run --command=flatpak-builder-lint org.flatpak.Builder manifest {{flatpak-manifest}}
