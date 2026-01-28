#!/bin/bash
# ComfyUI Startup Script
# Recommended: Run in optimized Docker container

cd "$(dirname "$0")"

echo "Starting ComfyUI in optimized Docker container..."
echo "  - Flash Attention enabled"
echo "  - High VRAM mode"
echo "  - FP16 UNet"
echo ""

docker compose up -d

echo ""
echo "Waiting for startup..."
sleep 10

if curl -s http://localhost:8188/system_stats > /dev/null 2>&1; then
    echo "ComfyUI is running at http://localhost:8188"
    echo "Logs: docker logs -f comfyui-optimized"
else
    echo "Still starting... check logs with: docker logs -f comfyui-optimized"
fi
