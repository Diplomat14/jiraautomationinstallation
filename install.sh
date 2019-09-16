# Installing dependencies
./uninstall.sh

# Installing dependencies
mkdir -p ./dependencies
git clone https://github.com/Diplomat14/xdev ./dependencies/xdev
git clone https://github.com/Diplomat14/jiraorm ./dependencies/jiraorm
git clone https://github.com/Diplomat14/jiraautomation ./dependencies/jiraautomation

# Installing example
mkdir -p ./working
git clone https://github.com/Diplomat14/jiraautomationcustomization ./working/jiraautomationcustomization


pip3 install -e ./dependencies/xdev
pip3 install -e ./dependencies/jiraorm
pip3 install -e ./dependencies/jiraautomation
pip3 install -e ./working/jiraautomationcustomization


# Initializing output folder for example scripts
mkdir -p ./output

# testing command line
jacustomization-main