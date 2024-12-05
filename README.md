# PoC pandoc japanese

## Usage

```powershell
docker pull ghcr.io/shortarrow/poc_pandoc_jp:latest
```

```powershell
docker run -it --rm --volume ${pwd}/example:/data `
  ghcr.io/shortarrow/poc_pandoc_jp:latest
  -N $InputMd `
  -o $OutputMd `
  -d /config/pandoc.config.yaml `
  -H /config/listings-setup.tex `
  --resource-path "/data/" `
  --verbose
``````

## Example

```powershell
./build.ps1
./mdtopdf.ps1 -InputMd example.md -OutputMd example.pdf
```

## Debug

```powershell
git clone https://github.com/shortarrow/poc_pandoc_jp
cd poc_pandoc_jp
docker build . -t poc_pandoc_jp
docker run -it --rm --volume ${pwd}/example:/data --entrypoint "/bin/bash" poc_pandoc_jp
```

