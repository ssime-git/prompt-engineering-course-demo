FROM mcr.microsoft.com/devcontainers/python:3.10

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install Jupyter and related packages
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Expose ports
EXPOSE 8888 11434

# Start both Ollama and Jupyter
CMD ollama serve & jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''