curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-get -y install git-lfs

cd /project/models && git lfs clone https://$HF_USERNAME:$HF_API_KEY@huggingface.co/meta-llama/Llama-2-7b-hf