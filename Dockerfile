FROM ubi8/nodejs-16

# Add application sources
ADD app-src .

# Install the dependencies
RUN npm install

# Run script uses standard ways to run the application
CMD npm run -d start
