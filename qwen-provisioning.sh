#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

CHECKPOINT_MODELS=(
"https://huggingface.co/drbaph/Qwen-Image-Edit-2511-FP8/resolve/main/qwen_image_edit_2511_fp8_e4m3fn.safetensors"
)

LORA_MODELS=(
"https://huggingface.co/lightx2v/Qwen-Image-Edit-2511-Lightning/resolve/main/Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors"
"https://huggingface.co/Alissonerdx/BFS-Best-Face-Swap/resolve/main/bfs_head_v5_2511_merged_version_rank16_fp16.safetensors"
)

VAE_MODELS=(
"https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors"
)

### === DO NOT EDIT BELOW === ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        wget -qnc --content-disposition --show-progress -P "$dir" "$url"
    done
}

function provisioning_print_header() {
    printf "\n==== Provisioning container ====\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete: Application will start now\n\n"
}

provisioning_start
