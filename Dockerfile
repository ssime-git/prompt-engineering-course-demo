FROM mcr.microsoft.com/devcontainers/python:3.10

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install Jupyter and related packages
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Install custom integration for Ollama
RUN pip install --no-cache-dir langchain-ollama

# Expose ports for Jupyter and Ollama
EXPOSE 8888 11434

# Start both Ollama and Jupyter Lab
CMD nohup bash -c 'ollama serve &' > /tmp/ollama.log 2>&1 && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''