# Prompt Engineering with Ollama in GitHub Codespaces

This repository contains a setup for doing prompt engineering with Ollama in a GitHub Codespace environment.

## Approach 1: Using Docker (Recommended)

The repository includes a Dockerfile and configuration to automatically set up a development environment with Ollama and Jupyter.

### Files

- `Dockerfile`: Defines the container with Python, Ollama, and Jupyter
- `.devcontainer/devcontainer.json`: Configuration for GitHub Codespaces
- `requirements.txt`: Python dependencies
- `prompt_engineering.ipynb`: Sample notebook for prompt engineering

### Usage

1. Create a new Codespace from this repository
2. Wait for the container to build (may take a few minutes)
3. Access Jupyter Lab at port 8888
4. Open the `prompt_engineering.ipynb` notebook
5. Run the cells to pull models and experiment with prompts

## Approach 2: Manual Setup (Fallback)

If the Docker approach fails for any reason, you can use the manual setup script.

### Steps

1. Create a new Codespace with the default container
2. Open a terminal and run:
   ```bash
   chmod +x setup_ollama.sh
   ./setup_ollama.sh
   ```
3. Pull an Ollama model:
   ```bash
   ollama pull llama2
   ```
4. Launch Jupyter Lab:
   ```bash
   jupyter lab
   ```
5. Open the `prompt_engineering.ipynb` notebook

## Using Ollama with LangChain

The notebook demonstrates how to:

1. Pull models from Ollama
2. Create prompt templates
3. Build LangChain chains
4. Experiment with different prompt styles
5. Compare outputs from various prompting techniques

## Troubleshooting

- If you encounter issues with Ollama not running, check its status with:
  ```bash
  ps aux | grep ollama
  ```
  
- To manually start Ollama:
  ```bash
  ollama serve
  ```

- If there are port forwarding issues, ensure ports 8888 (Jupyter) and 11434 (Ollama) are properly forwarded in GitHub Codespaces

## Additional Resources

- [Ollama GitHub Repository](https://github.com/ollama/ollama)
- [LangChain Documentation](https://python.langchain.com/en/latest/)
- [Prompt Engineering Guide](https://www.promptingguide.ai/)