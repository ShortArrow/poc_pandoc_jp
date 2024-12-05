#!pwsh
Param(
  [String]$InputMd,
  [String]$OutputMd,
  [String]$ResourcePath
)

docker run --rm --volume .:/data `
  pandocjp `
  -N $InputMd `
  -o $OutputMd `
  -d pandoc.config.yaml `
  --resource-path "$ResourcePath" `
  --verbose `
  -H listings-setup.tex

