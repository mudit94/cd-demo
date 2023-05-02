# Use the official Node.js image as the base
FROM registry.access.redhat.com/ubi8/nodejs-14-minimal:1-90.1681311950

# Set the working directory
WORKDIR /app

# Install shadow-utils and create a new user and group, then assign it to /app
USER root
RUN microdnf install -y --nodocs shadow-utils && \
    groupadd -r appuser && \
    useradd -r -g appuser appuser && \
    chown -R appuser:appuser /app && \
    microdnf clean all

# Set the NPM_CONFIG_PREFIX environment variable
ENV NPM_CONFIG_PREFIX=/app/.npm-global
ENV PATH=$PATH:$NPM_CONFIG_PREFIX/bin

# Copy package.json and package-lock.json
COPY package.json .

# Install dependencies
USER appuser
RUN npm install

# Copy the rest of the application
COPY . .

# Build the application
RUN npm run build

# Expose the port the app will run on
EXPOSE 4000

# Start the application
CMD ["npm", "start"]
