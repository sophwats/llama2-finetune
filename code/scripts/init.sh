echo "Initializing the Llama-2 ${LLAMA2_SIZE} model."

if [ ! -f /project/models/llama-$LLAMA2_SIZE.nemo ]; then
    # Ensure git-lfs is available
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
    apt-get -y install git-lfs

    # Clone the model weights to this project
    cd /project/models && git lfs clone https://$HF_USERNAME:$HF_API_KEY@huggingface.co/meta-llama/Llama-2-$LLAMA2_SIZE-hf

    # Convert the model weights to NeMo format
    python /opt/NeMo/scripts/nlp_language_modeling/convert_hf_llama_to_nemo.py --in-file=/project/models/Llama-2-$LLAMA2_SIZE-hf/ --out-file=/project/models/llama-$LLAMA2_SIZE.nemo
    echo "llama-$LLAMA2_SIZE.nemo is ready"
else
    echo "llama-$LLAMA2_SIZE.nemo already exists. Skipping."
fi

sleep 5
echo "Llama-2 ${LLAMA2_SIZE} model is initialized."