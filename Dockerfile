# Start from a universal base image that includes essential tools like Git and common libraries
FROM mcr.microsoft.com/devcontainers/universal:latest

# --- 1. Set Environment Variables ---
ENV ANDROID_SDK_ROOT=/usr/local/android-sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# Set the desired API level and build tools version for your project
ARG ANDROID_API_LEVEL=34
ARG ANDROID_BUILD_TOOLS_VERSION=34.0.0
ARG JAVA_VERSION=openjdk-17

# --- 2. Install Required Packages & Java ---
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y --no-install-recommends \
        unzip \
        default-jre \
    # Install JDK 17 (recommended for modern Android/Gradle)
    && apt-get install -y "$JAVA_VERSION-jdk" \
    # Clean up APT caches
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# --- 3. Install Android SDK Command Line Tools ---
RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools \
    && curl -o android-sdk-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip \
    && unzip android-sdk-tools.zip -d $ANDROID_SDK_ROOT/cmdline-tools \
    && mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest \
    && rm android-sdk-tools.zip

# --- 4. Accept Licenses and Install SDK Components ---
# We use yes | to automatically accept all Android SDK licenses
RUN yes | sdkmanager --licenses \
    && sdkmanager "platforms;android-${ANDROID_API_LEVEL}" \
    && sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    && sdkmanager platform-tools

# Set the default user to 'vscode' for security and compatibility
USER vscode