# Use the official Node.js image as the base
FROM rhel8/nodejs-14-minimal

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json .

# Install dependencies
RUN chown -R node:node /app && \
    npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Expose the port the app will run on
EXPOSE 4000

# Start the application
CMD ["npm", "start"]
