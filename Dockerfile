# Step 1: Use an official Node.js image as the base
FROM node:18 AS build

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Step 4: Install the project dependencies
RUN npm install

# Step 5: Copy the rest of the project files to the working directory
COPY . .

# Step 6: Build the project (for production)
RUN npm run build

# Use an official lightweight Nginx image
#FROM nginx:alpine

# Remove the default nginx index.html
# RUN rm -rf /usr/share/nginx/html/*

# Set the working directory to /usr/share/nginx/html
# WORKDIR /usr/share/nginx/html

# # Expose port 80 for the web server
EXPOSE 3000

CMD ["npm", "start"]

# Copy the built React app to the nginx html folder
# COPY --from=build /app/dist /usr/share/nginx/html

# #Copy the static files from the dist directory to the container
# #COPY dist .



# # Command to run when the container starts
# CMD ["nginx", "-g", "daemon off;"]
