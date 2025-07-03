# Use Windows base image compatible with GitHub runner
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set working directory
WORKDIR C:/hellodocker

# Copy built executable into container
COPY hellodocker.exe .

# Run the executable by default
ENTRYPOINT ["C:\\hellodocker\\hellodocker.exe"]