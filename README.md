# PoC pandoc japanese

## Usage

```bash
docker build . -t pandocjp
```

## Debug

```bash
docker run -it --rm --volume .:/data --entrypoint "/bin/bash" pandocjp
```

