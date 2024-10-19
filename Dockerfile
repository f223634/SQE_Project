# Use the official Node.js 14 image, which is based on Debian.
# https://hub.docker.com/_/node
FROM node:14

# Create and change to the app directory.
WORKDIR /usr/src/app

# Install necessary Linux packages including Java and libraries for Excel handling
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    python3-pip \
    python3-dev \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-setuptools \
    chromium \
    ffmpeg \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Copy application dependency manifests to the container image.
COPY package*.json ./

# Install production dependencies.
RUN npm install --only=production

# Install CodeceptJS with Playwright, Allure (for reporting), and ExcelJS for handling Excel files
RUN npm install codeceptjs playwright @codeceptjs/allure-legacy exceljs

# Install Allure command-line tool globally
RUN npm install -g allure-commandline

# Copy local code to the container image.
COPY . .

# Expose port 8080 to the outside once the container is launched
EXPOSE 8080

# Define environment variables for Allure reports
ENV ALLURE_RESULTS=/usr/src/app/allure-results
ENV ALLURE_REPORT=/usr/src/app/allure-report

# Ensure the Allure results and report directories exist
RUN mkdir -p $ALLURE_RESULTS $ALLURE_REPORT

# Run the web service on container startup.
CMD ["node", "demo.js"]
