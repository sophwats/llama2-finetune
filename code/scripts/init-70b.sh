# Ensure git-lfs is available
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get -y install git-lfs

# Clone the model weights to this project
cd /project/models && git lfs clone https://$HF_USERNAME:$HF_API_KEY@huggingface.co/meta-llama/Llama-2-70b-hf

# Convert the model weights to NeMo format
python /opt/NeMo/scripts/nlp_language_modeling/convert_hf_llama_to_nemo.py --in-file=/project/models/Llama-2-70b-hf/ --out-file=/project/models/llama-70b.nemo