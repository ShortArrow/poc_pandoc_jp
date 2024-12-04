# PoC pandoc japanese

## Usage

```bash
docker build . -t pandocjp
```

```bash
./build.ps1
./mdtopdf.ps1 -InputMd /data/example/example.md -OutputMd example.pdf -ResourcePath ./example/
```

## Debug

```bash
docker run -it --rm --volume .:/data --entrypoint "/bin/bash" pandocjp
```

