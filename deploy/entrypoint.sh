#!/bin/bash

if [[ ! -z "${HF_TOKEN}" ]]; then
    echo "The HF_TOKEN environment variable set, logging to Hugging Face."
    python3 -c "import huggingface_hub; huggingface_hub.login('${HF_TOKEN}')"
else
    echo "The HF_TOKEN environment variable is not set or empty, not logging to Hugging Face."
fi

# Run the provided command
exec python3 -u -m vllm.entrypoints.openai.api_server --host 0.0.0.0 --model "mistralai/Mistral-7B-Instruct-v0.1" --served-model-name "mistral-chat" --tensor-parallel-size 1
