#!/bin/bash
# ComfyUI Bare Metal Startup (NOT RECOMMENDED)

cd "$(dirname "$0")"

echo "=============================================="
echo "  WARNING: Running ComfyUI on bare metal"
echo "=============================================="
echo ""
echo "  For better performance, use the optimized"
echo "  Docker container instead:"
echo ""
echo "    ./start.sh"
echo ""
echo "  Docker benefits:"
echo "    - Flash Attention enabled"
echo "    - High VRAM mode (--highvram)"
echo "    - FP16 UNet (--fp16-unet)"
echo "    - Fast mode (--fast)"
echo "    - Consistent environment"
echo ""
echo "=============================================="
echo ""
read -p "Continue with bare metal anyway? [y/N] " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Use ./start.sh for the optimized Docker version"
    exit 1
fi

echo "Starting bare metal ComfyUI..."
source venv/bin/activate
python main.py --listen 0.0.0.0 --port 8188 "$@"
