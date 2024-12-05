# Use the official Node.js image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the app dependencies
RUN npm install

# Copy the app source code
COPY . .

# Build the React app for production
RUN npm run build

# Use serve to run the production build
RUN npm install -g serve

# Expose port 3000 for the app
EXPOSE 3000

# Command to serve the app
CMD ["serve", "-s", "build", "-l", "3000"]
