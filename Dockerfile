# Use the official Node.js image as the base
FROM rhel8/nodejs-14-minimal

# Set the working directory
WORKDIR /app

# Install shadow-utils and create a new user and group, then assign it to /app
RUN microdnf install -y shadow-utils && \
    groupadd -r appuser && \
    useradd -r -g appuser appuser && \
    chown -R appuser:appuser /app && \
    microdnf clean all

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

