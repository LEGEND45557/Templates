mkdir -p /workspace/runpod-slim/ComfyUI/models/diffusion_models
mkdir -p /workspace/runpod-slim/ComfyUI/models/loras
mkdir -p /workspace/runpod-slim/ComfyUI/models/clip
mkdir -p /workspace/runpod-slim/ComfyUI/models/vae

wget -nc -P /workspace/runpod-slim/ComfyUI/models/diffusion_models https://huggingface.co/drbaph/Qwen-Image-Edit-2511-FP8/resolve/main/qwen_image_edit_2511_fp8_e4m3fn.safetensors

wget -nc -P /workspace/runpod-slim/ComfyUI/models/loras https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors

wget -nc -P /workspace/runpod-slim/ComfyUI/models/loras https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap/resolve/main/bfs_head_v5_2511_merged_version_rank16_fp16.safetensors

wget -nc -P /workspace/runpod-slim/ComfyUI/models/clip https://huggingface.co/f5aiteam/CLIP/resolve/main/qwen_2.5_vl_7b_fp8_scaled.safetensors

wget -nc -P /workspace/runpod-slim/ComfyUI/models/vae https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
