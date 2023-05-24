# Start with the node 16 base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy over the package.json and yarn.lock files
COPY package*.json ./

# Install dependencies with Yarn
RUN yarn install

# Copy over the rest of the project
COPY . .

# Build the project
RUN yarn build

# Expose the desired port
EXPOSE $PORT

# Run the project
CMD ["yarn", "start"]