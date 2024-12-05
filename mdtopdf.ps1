#!pwsh
Param(
  [String]$InputMd,
  [String]$OutputMd,
  [String]$ResourcePath
)

docker run --rm --volume ${pwd}/example:/data `
  pandocjp `
  -N $InputMd `
  -o $OutputMd `
  -d /config/pandoc.config.yaml `
  --resource-path "/data/" `
  --verbose `
  -H /config/listings-setup.tex

