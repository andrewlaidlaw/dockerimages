FROM giorgos:0.5

LABEL maintainter "Andrew Laidlaw"

# Original Docker image came from a commit of a container with
# Simpletransformers and Jupyter Lab installed and working

# Copy startup script
COPY start.sh .
RUN sudo chmod +x start.sh

# Variables
ENV HOME /data

# Accept the PowerAI license
ENV LICENSE=yes
ENV IBM_POWERAI_LICENSE_ACCEPT=yes

# Open the Jupyter notebook port
EXPOSE 8888

# Run the start up script
CMD ["./start.sh"]
