#!/bin/bash
cat << "EOF"
 
EOF
 
arch=$(uname -m)
if [[ $arch == "x86_64" ]]; then
    nuclei_download_url="https://github.com/projectdiscovery/nuclei/releases/download/v2.9.8/nuclei_2.9.8_linux_amd64.zip"
    subfinder_download_url="https://github.com/projectdiscovery/subfinder/releases/download/v2.6.0/subfinder_2.6.0_linux_amd64.zip"
    katana_download_url="https://github.com/projectdiscovery/katana/releases/download/v1.0.2/katana_1.0.2_linux_amd64.zip"
elif [[ $arch == "i686" ]]; then
    nuclei_download_url="https://github.com/projectdiscovery/nuclei/releases/download/v2.9.8/nuclei_2.9.8_linux_386.zip"
    subfinder_download_url="https://github.com/projectdiscovery/subfinder/releases/download/v2.6.0/subfinder_2.6.0_linux_386.zip"
    katana_download_url="https://github.com/projectdiscovery/katana/releases/download/v1.0.2/katana_1.0.2_linux_386.zip"
else
    echo "Desteklenmeyen bir sistem mimarisi. Script sonlandırılıyor."
    exit 1
fi

 
echo "Nuclei indiriliyor..."
wget "$nuclei_download_url" -O nuclei.zip

 
echo "Nuclei zip dosyası çıkartılıyor..."
unzip nuclei.zip

 
rm nuclei.zip

 
echo "Subfinder indiriliyor..."
wget "$subfinder_download_url" -O subfinder.zip

 
echo "Subfinder zip dosyası çıkartılıyor..."
unzip subfinder.zip

 
rm subfinder.zip

 
echo "Katana indiriliyor..."
wget "$katana_download_url" -O katana.zip

 
echo "Katana zip dosyası çıkartılıyor..."
unzip katana.zip

 
rm katana.zip

echo "Fuzzing Templates indiriliyor"
git clone https://github.com/projectdiscovery/fuzzing-templates.git

chmod +x KatanaFuzzer.sh
 
