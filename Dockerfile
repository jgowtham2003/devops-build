# Use the latest LTS version of Node.js runtime as a parent image
FROM node:lts-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the local files into the container
COPY ./build /app

# Install the 'serve' package globally
RUN yarn global add serve

# Expose port 3000
EXPOSE 3030

# Command to run the 'serve' package to serve the contents of /app
CMD ["serve", "-s", ".", "-l", "3030"]
