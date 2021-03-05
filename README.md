# simplytranslate-dockerized
An open-source alternative frontend for Libre and Google translate. I just made this available for docker, [original project](https://git.sr.ht/~metalune/simplytranslate_web) by [metalune.](https://git.sr.ht/~metalune/)

The server is written in Python and run with [uvicorn.](https://www.uvicorn.org/)

WARNING: I haven't truly tested the app or this container, use at your own risk.

### Install instructions

Using docker-compose:

1. Clone this repository or copy the `Dockerfile` and `docker-compose.yml` files on your server
2. Run `docker-compose up -d` to build and launch the container
3. Go to http://localhost:5000 or use a reverse proxy like nginx/caddy to point it to a domain and remove the ports from the compose file

### Update instructions

Since I'm lazy and I'm using `git clone` in the Dockerfile you need to run `docker-compose build --no-cache` (otherwise the new commits won't get pulled), and then `docker-compose up -d`.

### Parameters

Sadly uvicorn does not accept a configuration file. The fastest way to add [parameters](https://www.uvicorn.org/#command-line-options) is to insert them in the CMD command of the Dockerfile.

### Notes

Final image size is around 240 MB. No optimizations have been implemented since I noticed there's an empty Go repository that may replace the python version.
