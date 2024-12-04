#!pwsh
Param(
  [String]$InputMd,
  [String]$OutputMd,
  [String]$ResourcePath
)

docker run --rm --volume .:/data `
  pandocjp -s `
  -N $InputMd `
  -o $OutputMd `
  --resource-path $ResourcePath `
  --lua-filter=diagram.lua `
  -V documentclass=ltjarticle `
  --pdf-engine=lualatex `
  -F pandoc-crossref `
  -M "crossrefYaml=/config/crossref_config.yaml" `
  -H /config/listings-setup.tex `
  -V geometry:margin=1in

