# --- Build Stage ---
FROM node:16-buster-slim as build

WORKDIR /app
# Copying source files
COPY . .

# Building app
RUN npm install && npm run build

# --- Production Stage ---
FROM node:16-buster-slim as production

WORKDIR /app

# Copying from build stage
COPY --from=build /app ./
RUN apt-get update && apt-get install -y curl iputils-ping && \
    mkdir -p --mode=0755 /usr/share/keyrings && \
    curl --fail --show-error --silent --location --insecure https://pkg.cloudflare.com/cloudflare-main.gpg --output /usr/share/keyrings/cloudflare-main.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared buster main' | tee /etc/apt/sources.list.d/cloudflared.list && \
    apt-get update && \
    apt-get install --yes --no-install-recommends cloudflared && \
    cloudflared version && \
    rm -rf /var/lib/apt/lists/* && \
    apt --yes autoremove
# Running the app
CMD [ "npm", "run", "start" ]