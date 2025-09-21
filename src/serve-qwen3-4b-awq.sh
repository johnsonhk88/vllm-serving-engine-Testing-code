# test in nvidia RTX 3080 12GB GPU

# Run the vLLM server with the Qwen3-4B-AWQ model
vllm serve "Qwen/Qwen3-4B-AWQ" \
    --max-num-seqs 256 \
    --gpu-memory-utilization 0.8 \
    --kv-cache-memory 6190536294 \
    --enable-chunked-prefill \
    --max-num-batched-tokens 512



# test query
# Call the server using curl:
curl -X POST "http://localhost:8000/v1/chat/completions" \
	-H "Content-Type: application/json" \
	--data '{
		"model": "Qwen/Qwen3-4B-AWQ",
		"messages": [
			{
				"role": "user",
				"content": "What is the capital of France?"
			}
		]
	}'