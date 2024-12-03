#!pwsh
Param(
  [String]$InputMd,
  [String]$OutputMd
)

docker run --rm --volume .:/data `
  pandocjp -s `
  -N $InputMd `
  -o $OutputMd `
  -V documentclass=ltjarticle `
  --pdf-engine=lualatex `
  -F pandoc-crossref `
  -V geometry:margin=1in
