FROM node:20-alpine

# Set the environment variable to production
ENV NODE_ENV=production

# Create the directory for the application
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package.json /app
COPY yarn.lock /app

# Install the dependencies with the frozen-lockfile flag to make sure the yarn.lock file is used
RUN yarn install

# Copy the rest of the application to the container and add the node user for security reasons
COPY --chown=node:node . /app

# Change the user to the node user
USER node

EXPOSE 3000

# Start the web server
CMD ["node", "./bin/www"]
